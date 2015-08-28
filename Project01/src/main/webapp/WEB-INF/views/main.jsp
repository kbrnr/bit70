<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<!-- REQUIRED JS SCRIPTS -->
<link href="/resources/nojo/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/nojo/script/bootstrap-treeview.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/context.bootstrap.css">
<script src="/resources/nojo/script/context.js"></script>

<!-- 배치도 CSS 추가-->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">

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
			<div class="col-sm-9">
				<div class="box">
	               	<div class="box-body">
	               		<div id="container">
		                  <div id="seat" style="overflow-x: auto;"></div>
						</div>
	               	</div>
				</div>
			</div>	
		
			<%------------- 알림 -------------%>
			<div class="col-sm-3">
				<div class="box">
	               	<div class="box-body">
	               		<div id="notifications" class="list-group" style="overflow-y: hidden; height: 396px; margin-bottom: 0px;"></div>
	               	</div>
				</div>
			</div>
		
		</div>
	</section>
	<!-- /.content -->

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
			console.log($this.serialize());
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
	
	//----------------------------------------------- 알림 ----------------------------------------------------------
	function getNotifications(){
		$.getJSON("/${domain}/notification", function(data){
			if(data.length > 0)
				$("#notifications").html("");
			$(data).each(function(){
				var $a = $('<a href="#" class="notification list-group-item" data-noti_no="' + this.noti_no + '" data-link="'+ this.noti_service_link +'">'
			    		+   '  <h4 class="list-group-item-heading">' + this.noti_service_name + '<small>[' + this.noti_sender_id + ']</small></h4>'
			    		+   '  <p class="list-group-item-text">' + this.noti_summation + '</p>'
						+  '</a>');
				if(this.noti_read_gb==0){
					$a.addClass("list-group-item-info");
				}
				$("#notifications").prepend($a);			
			});
			
			context.attach('.notification', [
			    new Menu("보기", inquiry),
           		new Menu("읽음", updateReadStatus),
           		new Menu("삭제", removeNotification)
           	]);
		});
	}
	
	function Menu(text, action){
		this.text = text;
		this.action = action;
	}
	function inquiry(e, target){
		updateReadStatus(e, target);
		target = $(target);
		var link = target.data("link");
		location.href = link;
	}
	
	function updateReadStatus(e, target){
		e.preventDefault();
		target = $(target);
		if(!target.hasClass("list-group-item-info"))
			return;
		$.ajax({
			url: "/${domain}/notification/" + target.data("noti_no"), 
			method: "patch",
			success: function(){
				target.removeClass("list-group-item-info");
			}
		});
	}
	function removeNotification(e, target){
		e.preventDefault();
		target = $(target);
		$.ajax({
			url: "/${domain}/notification/" + target.data("noti_no"), 
			method: "delete",
			success: function(){
				target.remove();
			}
		});
	}
	$("#notifications").on("mousewheel wheel", function (e) {
		e.preventDefault();
	    var event = e.originalEvent;
	    var delta = event.wheelDelta || -event.deltaY; 
	    this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
	});
	
	context.init({
	    fadeSpeed: 100,
	    filter: function ($obj){},
	    above: 'auto',
	    preventDoubleContext: true,
	    compress: false
	});
	
	getNotifications();
	setInterval(getNotifications, 30000);
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
			console.log("onlineUser" + users);
			$(".name[data-mem_id='" + users[i] + "']").parent().css( { "background-color" : "#D6F7FE"});
			//$(".chair[data-mem_id='" + users[i] + "']").children().children($(".realImg")[0]).css( { "border" : "3px solid red"});
		}
	});
	parent.socket.on("offlineUser", function(user){
		console.log("offlineUser" + user);
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


 
