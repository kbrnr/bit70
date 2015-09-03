<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">

<!-- 커리큘럼 -->
<link href="/resources/nojo/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/nojo/script/bootstrap-treeview.min.js" type="text/javascript"></script>

<!-- 알림 -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/context.bootstrap.css">
<script src="/resources/nojo/script/context.js"></script>
<link rel="stylesheet" href="/resources/nojo/css/notification.css">
<link rel="stylesheet" href="/resources/nojo/css/animate.css">

<!-- 배치도 -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">


<div class="container">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			수업명: ${domain} <small>(${user.id}${grade})</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/" target="parent"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">${domain}</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content">
		
		<%------------- 커리큘럼 -------------%>
		<div class="row">
			<div class="col-sm-12">
				<div class="box box-primary">
					<div class="box-body">
						<div class="row">
							<div class="col-md-4">
								<form id="searchTree">
									<div class="input-group">
								      <input id="treeSearchText" type="text" class="form-control" placeholder="커리큘럼 검색">
								      <span class="input-group-btn">
								        <button class="btn btn-info">검색</button>
								      </span>
								    </div>
								</form>
								<div id="tree"></div>
							</div>
							<div class="col-md-8">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h1 id="curri_title" class="panel-title" style="display: inline;"></h1>
										<c:if test="${isClassTeacher}">
											<a id="question" class="btn" style="color: white;"><span class="glyphicon glyphicon-question-sign"></span></a>
										</c:if>
									</div>
									<div class="panel-body">
										<pre id="curriContent" style="background-color: white; border: none; padding: 0px;"></pre>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<%------------- 배치도 -------------%>
			<div class="col-sm-12">
				<div class="box">
	               	<div class="box-body">
	               		<div id="container">
		                  <div id="seat" style="overflow-x: auto;"></div>
						</div>
	               	</div>
				</div>
			</div>	
		</div>
		
	</section>
</div>
	
<script>
//----------------------------------------------- 커리큘럼 -----------------------------------------------------
	function Node(text, href, content) {
		this.text = text;
		this.href = href;
		this.content = content;
	}
	$.getJSON("/${domain}/curriculum", function(data) {
		//트리에 사용될 데이터를 알맞는 형식으로 변경
		var list = [];
		var work;
		$(data).each(function() {
			var name = this.curri_name;
			var depth = this.curri_depth;
			var no = this.curri_no;
			var content = this.curri_content;
			var node = new Node(name, no, content);
			if (depth == 1) {
				work = [];
				list.push(node);
			} else {
				if (!work[depth - 2].nodes) {
					work[depth - 2].nodes = [];
				}
				work[depth - 2].nodes.push(node);
			}
			work[depth - 1] = node;
		});
		//트리세팅
		$('#tree').treeview({
			data : list,
			levels : 1,
			onNodeSelected : function(event, data) {
				var p = data;
				while(p.parentId != undefined){
					p = $('#tree').treeview('getParent', p.nodeId);
				}
				parent.$(":hidden[name=curri_no]").val(data.href);
				parent.$(":hidden[name=curri_gpno]").val(p.href);
				$("#curri_title").text(data.text);
				$("#curriContent").text(data.content);
			}
		});
		//기본으로 첫번쨰 트리선택
		$('#tree').treeview('selectNode', 0);
		//검색이벤트
		$("#searchTree").submit(function(e){
			e.preventDefault();
			var text = $("#treeSearchText").val();
			var arr= $('#tree').treeview('search', [ text, {
			  ignoreCase: true,     // case insensitive
			  exactMatch: false,    // like or equals
			  revealResults: true,  // reveal matching nodes
			}]);
			if(arr.length > 0){
				$('#tree').treeview("selectNode", arr[arr.length-1]);
			}
		});
	});
	
	//----------------------------------------------- 이해도 질문 -----------------------------------------------------
	<c:if test="${isClassTeacher}">
		$("#question").click(function(){
			parent.$('#myModal').modal('show');
		});
		parent.$("#sendQuestion").submit(function(e){
			e.preventDefault();
			var $this = $(this);
			$.post("/${domain}/comprehension/question", $this.serialize(), function(questionNo){
				var question = $this.find("[name=teacherquestion_content]").val();
				var obj = {teacherquestion_no: questionNo, teacherquestion_content: question};
				parent.socket.emit("understanding", obj);
				parent.$('#myModal').modal('hide');
			});
		});
	</c:if>
	
	<c:if test="${isClassStudent}">
		//seat에 이해도 부문 표시
		parent.socket.on("understanding", function(msg){
			parent.$("#sendScore [name=teacherquestion_no]").val(msg.teacherquestion_no);
			parent.$("#msg").text(msg.teacherquestion_content);
			parent.$('#myModal').modal('show');
		});
		parent.$("#sendScore").submit(function(e){
			e.preventDefault();
			var $this = $(this);
			$.post("/${domain}/comprehension", $this.serialize(), function(data){
				var obj = {
					mem_id: "${user.id}", 
					teacherquestion_no: $this.find("[name=teacherquestion_no]").val(),
					comprehension_score: $this.find("[name=comprehension_score]").val(),
				}
				parent.socket.emit("seatScore", obj);
			});
			parent.$('#myModal').modal('hide');
		});
	</c:if>
	
	//----------------------------------------------- 알림 -----------------------------------------------------
	$.fn.animate = function(className, callback){
		var $this = this;
		$this.addClass(className);
		$this.one("animationend", function(){
		    $this.removeClass(className);
		    if(callback){
		    	callback($this);
		    }
	    });
	}
	
	function showNoti(target, fadeIn){
        var $last = $(".noti:last");
        var notiTop =  $last.css("top") || 30;
        var notiLeft =  $last.css("left") || 30;
        var str = '<div class="noti" data-notino="' + target.data("notino") + '" data-idx="' + target.data("idx") + '" style="top:' + (notiTop-3) + '%; left:' + (notiLeft-1) + '%;">'
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
        $("body").append(tag);
    }

	$("body").on("click", ".jokbal-wrapper", function(e){
		var $this = $(this);
		$.get("/${domain}/notification/setInside/" + $this.data("notino"), function(){
			showNoti($this, true);	    	
	    });
	});

	$("body").on("click", ".noti", function(){
	    var $this = $(this);
	    var idx = $this.data("idx");
	    $.get("/${domain}/notification/setAside/" + $this.data("notino"), function(){
	    	$this.animate("fadeOut", function(){
		    	$this.remove();
		    });
		    $(".jokbal-wrapper:nth(" +idx+ ")").show().animate("bounceInRight");	    	
	    });
	});

	function getNoti(){
		$.getJSON("/${domain}/notification", function(data){
			if(data.length < 1){ return; }
			$(".noti").remove();
			$(".jokbal-wrapper").remove();
			$(data).each(function(idx){
				var state = this.screen_gb;
				var header = this.noti_service_name;
				var name = this.noti_sender_id;
				var notiTop = 10 * (idx + 1);
				var str = '<div class="jokbal-wrapper" data-notino="' + this.noti_no + '" data-idx="' + idx + '" data-header="' + header + '" data-name="' + name + '" data-body="' + this.noti_summation + '" style="top: ' + notiTop + '%">'
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
	getNoti();
	setInterval(function(){ getNoti(); }, 30000);

	
	//----------------------------------------------- 배치도 -----------------------------------------------------
	$.getJSON("/${domain}/seat/ajax", function(list){
			$(list).each(function(){
				var x = this.seat_x;
				var y = this.seat_y;
				var name = this.mem_name;
				var id = this.mem_id;
				var domain = "${domain}";
				var str = "<div class='chair' style='margin-left: "	+ x + "px; margin-top: " + y + "px;'>"
						+ "  <div class='img'>"
						+ "	    <img class='realImg' src='/" + domain + "/seat/seatImg?userId=" + id + "' onerror='imgError(this);'/>"
						+ "  </div>"
						+ "  <div class='name' data-mem_id='" + id + "' data-trigger='manual' data-placement='bottom' data-html='true' >"+name + "</div>"
						+ "</div>";

				var chair = $(str);
				chair.css( { "margin-left" : x+"px", "margin-top" : y+"px"});
				$("#seat").append(str);
			});
			parent.socket.emit("seatReady");
		});
	//Seat에서 on/off표시
	parent.socket.on("onlineUser", function(users){
		for(var i in users){
			$(".name[data-mem_id='" + users[i] + "']").parent().css( { "background-color" : "#D6F7FE"});
			//$(".chair[data-mem_id='" + users[i] + "']").children().children($(".realImg")[0]).css( { "border" : "3px solid red"});
		}
	});
	parent.socket.on("offlineUser", function(user){
		$(".name[data-mem_id='" + user + "']").parent().css( { "background-color" : "white"});
	});
	//seat 이미지 on 이벤트
	function imgError(image) {
    image.onerror = "";
    image.src = "/resources/nojo/images/noImage.png";
    return true;
	}
	//Seat에서 이해도 점수 표시
	parent.socket.on("seatScore", function(data){
		var target = $(".name[data-mem_id='"+data.mem_id+"']");
		target.attr("data-content", data.comprehension_score);
		target.popover('show');
		setTimeout(function(){
			target.popover('destroy');
		}, 60000);
	});
	
	//Seat에 질문 표시
	parent.socket.on("seatQuestion", function(no){
		var qno = no.qno;
		var href = "<a href='/${domain}/qna/detail?no="+qno+"'><img class='marginImg' src='/resources/nojo/images/questionMark.png' /></a>";
		var qtarget = $(".name[data-mem_id='"+no.userId+"']").parent().append(href);
 		setTimeout(function(){
			qtarget.children()[2].remove();
		}, 60000);
	});
	
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>


 
