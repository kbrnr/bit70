<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">

<!-- 커리큘럼 -->
<link href="/resources/nojo/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/nojo/script/bootstrap-treeview.min.js"></script>

<!-- 알림 -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/context.bootstrap.css">
<link rel="stylesheet" href="/resources/nojo/css/notification.css">
<link rel="stylesheet" href="/resources/nojo/css/animate.css">
<script src="/resources/nojo/script/context.js"></script>

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
	
	<!-- Small modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Small modal</button>
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>


<script>
	var domain = "/${domain}";
</script>
<script src="/resources/nojo/script/notification.js"></script>
<script src="/resources/nojo/script/curiculum.js"></script>
<script src="/resources/nojo/script/seat.js"></script>
<script>
	//----------------------------------------------- 이해했니? -----------------------------------------------------
	<c:if test="${isClassTeacher}">
		$("#question").click(function(){
			parent.$('#myModal').modal('show');
		});
		parent.$("#sendQuestion").submit(function(e){
			e.preventDefault();
			var $this = $(this);
			$.post(domain + "/comprehension/question", $this.serialize(), function(questionNo){
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
			parent.$(".modal-title").text(msg.teacherquestion_content);
			parent.$('#myModal').modal('show');
		});
		parent.$("#sendScore").submit(function(e){
			e.preventDefault();
			var $this = $(this);
			$.post(domain + "/comprehension", $this.serialize(), function(data){
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
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>


 
