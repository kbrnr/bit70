<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<!-- REQUIRED JS SCRIPTS -->
<link href="/resources/nojo/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/nojo/script/bootstrap-treeview.min.js" type="text/javascript"></script>
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
							<div class="col-md-3">
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
							<div class="col-md-6">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h1 id="curri_title" class="panel-title" style="display: inline;"></h1>
										<c:if test="${isTeacher}">
											<a id="question" class="btn" style="color: white;"><span class="glyphicon glyphicon-question-sign"></span></a>
										</c:if>
									</div>
									<div class="panel-body">
										<p id="curriContent"></p>
									</div>
								</div>
							</div>
							<div class="col-md-3">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<h1 class="panel-title">첨부파일</h1>
									</div>
									<div class="panel-body">
										첨부파일 데스
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
		                  <div id="seat"></div>
						</div>
	               	</div>
				</div>
			</div>	
		
			<%------------- 알림 -------------%>
			<div class="col-sm-3">
				<div class="box">
	               	<div class="box-body">
	               		<div id="notifications" class="list-group">
	                		<c:forEach var="noti" items="${notifications}">
		                		<a href="#" class="notification list-group-item ${noti.noti_read_gb ? '' : 'list-group-item-info'}" data-noti_no="${noti.noti_no}">
								    <h4 class="list-group-item-heading">${noti.noti_service_name} <small>[${noti.noti_sender_id}]</small></h4>
								    <p class="list-group-item-text">${noti.noti_summation}</p>
								</a>
	                		</c:forEach>
						</div>
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
	<c:if test="${isTeacher}">
		$("#question").click(function(){
			parent.$('#myModal').modal('show');
		});
		parent.$("#sendQuestion").submit(function(e){
			e.preventDefault();
			var $this = $(this);
			$.post("/${domain}/comprehension/question", $this.serialize(), function(no){
				var question = $this.find("[name=teacherquestion_content]").val();
				var obj = {teacherquestion_no: no, teacherquestion_content: question};
				parent.socket.emit("understanding", obj);
				parent.$('#myModal').modal('hide');
			});
		});
	</c:if>
	
	<c:if test="${isStudent}">
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
	//----------------------------------------------- 알림 ----------------------------------------------------------
	$("#notifications").on("click", ".notification", function(e){
		e.preventDefault();
		var $this = $(this);
		if($this.hasClass("list-group-item-info"))
			return;
		$.ajax({
			url: "/${domain}/notification/" + $this.data("noti_no"), 
			method: "patch",
			success: function(){
				$this.removeClass("list-group-item-info");
			}
		});
	});
	

	//----------------------------------------------- 배치도 -----------------------------------------------------
	$.getJSON("/${domain}/seat/ajax", function(list){
			$(list).each(function(){
				var x = this.seat_x;
				var y = this.seat_y;
				var name = this.mem_name;
				var id = this.mem_id;
				var domain = "${domain}";
				var str = "<div class='chair' data-mem_id='" + id + "' data-trigger='manual' data-placement='top' style='margin-left: " 
					+ x + "px; margin-top: " 
					+ y + "px;'><div class='img'><img class='realImg' src='/" 
					+ domain + "/seat/seatImg?userId=" 
					+ id + "' '/></div>"
					+ name + "</div>"
				var chair = $(str);
				chair.css( { "margin-left" : x+"px", "margin-top" : y+"px" });
				$("#seat").append(str);
			});
		});
	//Seat에서 on/off표시
	parent.socket.on("onlineUser", function(user){
		console.log("onlineUser: " + user);
		$(".chair[data-mem_id='" + user + "']").css( { "border" : "3px solid red"});
	});
	parent.socket.on("offlineUser", function(user){
		console.log("offlineUser" + user);
		$(".chair[data-mem_id='" + user + "']").css( { "border" : "thin solid gray"});
	});
	
	//Seat에서 이해도 점수 표시
	parent.socket.on("seatScore", function(data){
		var target = $(".chair[data-mem_id='"+data.mem_id+"']");
		target.attr("data-content", data.comprehension_score);
		//data-container='body' data-toggle='popover' data-placement='bottom
		target.popover('show');
		setTimeout(function(){
			target.popover('destroy');
		}, 30000);
	});
	
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>


 