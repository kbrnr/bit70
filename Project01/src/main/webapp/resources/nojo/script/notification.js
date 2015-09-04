(function (domain){
	var menu = [new Menu("보기", inquiry), new Menu("읽음", updateReadStatus), new Menu("삭제", removeNotification)];
	
	function inquiry(e, target){
 		updateReadStatus(e, target);
 		target = $(target);
 		var link = target.data("link");
 		location.href = link;
 	}
 	
 	function updateReadStatus(e, target){
 		e.preventDefault();
 		target = $(target);
 		$.ajax({
 			url: domain + "/notification/updateReadState/" + target.data("notino"), 
 			method: "patch",
 			success: function(){
 				var idx = target.data("idx");
 				$(".jokbal-wrapper:nth(" +idx+ ")").remove();
 				target.remove();
 			}
 		});
 	}
 	
 	function removeNotification(e, target){
 		e.preventDefault();
 		target = $(target);
 		$.ajax({
 			url: domain + "/notification/" + target.data("notino"), 
 			method: "delete",
 			success: function(){
 				var idx = target.data("idx");
 				$(".jokbal-wrapper:nth(" +idx+ ")").remove();
 				target.remove();
 			}
 		});
 	}
 	
 	function Menu(text, action){
 		this.text = text;
 		this.action = action;
 	}
	
	function showNoti(target, fadeIn){
        var $last = $(".noti:last");
        var notiTop =  $last.css("top") || 30;
        var notiLeft =  $last.css("left") || 30;
        var str = '<div class="noti" data-notino="' + target.data("notino") + '" data-idx="' + target.data("idx") + '" data-link="' + target.data("link") + '" style="top:' + (notiTop-3) + '%; left:' + (notiLeft-1) + '%;">'
	            +   '<div class="noti-content">'
	            +     '<div class="noti-name">' + target.data("name") + '</div>'
	            +     '<h1 class="noti-header neon">' + target.data("header") + '</h1>'
	            +     '<p class="noti-body">' + target.data("body") + '</p>'
	            +   '</div>'
	            +'</div>';
	    var tag = $(str);
	    if(fadeIn){
	    	tag.addClass("fadeIn");
	    }
        target.hide();
        context.attach(tag, menu);
        $("body").append(tag);
    }
	
	function getNoti(){
		$.getJSON(domain + "/notification", function(data){
			if(data.length < 1){ return; }
			$(".noti").remove();
			$(".jokbal-wrapper").remove();
			$(data).each(function(idx){
				var state = this.screen_gb;
				var header = this.noti_service_name;
				var name = this.noti_sender_id;
				var notiTop = 45 * (idx + 1);
				var str = '<div class="jokbal-wrapper" data-notino="' + this.noti_no + '" data-idx="' + idx + '" data-header="' + header + '" data-name="' + name + '" data-body="' + this.noti_summation + '" data-link="' + this.noti_service_link + '" style="top: ' + notiTop + 'px">'
						+ 	'<div class="jokbal">'
						+ 		header + '<small>[' + name + ']</small>'
						+ 	'</div>'
						+ 	'<div class="jokbal-label"></div>'
						+ '</div>';
				var tag = $(str);
				$("body").append(tag);
				
				switch(state){
				case 1: 
					showNoti(tag, true);
					break;
				case 2: 
					showNoti(tag, false);
				}
			});
		});
	}
	
	$("body").on("click", ".jokbal-wrapper", function(e){
		var $this = $(this);
		$.ajax({
 			url: domain + "/notification/setInside/" + $this.data("notino"), 
 			method: "patch",
 			success: function(){
 				showNoti($this, true);	
 			}
 		});
	});

	$("body").on("click", ".noti", function(){
	    var $this = $(this);
	    var idx = $this.data("idx");
	    $.ajax({
 			url: domain + "/notification/setAside/" + $this.data("notino"), 
 			method: "patch",
 			success: function(){
 				$this.animation("fadeOut", function(){
 			    	$this.remove();
 			    });
 			    $(".jokbal-wrapper:nth(" +idx+ ")").show().animation("bounceInRight");
 			}
 		});
	});
	
	$.fn.animation = function(className, callback){
		var $this = this;
		$this.addClass(className);
		$this.one("animationend", function(){
		    $this.removeClass(className);
		    if(callback){
		    	callback($this);
		    }
	    });
	}
	context.init();
	getNoti();
	setInterval(function(){ getNoti(); }, 30000);

})(domain);