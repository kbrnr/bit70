<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<link href="/resources/froala_editor/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<link href="/resources/froala_editor/css/froala_editor.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/froala_editor/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />

	<!-- START ACCORDION & CAROUSEL-->
	<!-- Content Header (Page header) -->
		<section class="content-header">
		    <h1>질문답변</h1>
		    <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-fw fa-home"></i>Home</a></li>
		        <li><a href="#">${domain }</a></li>
		        <li class="active">질문답변</li>
		    </ol>
		</section>
<div class="row">
	<div class="col-md-12">
		<div class="box-header with-border">
			<div style="float: left">
				<h3 class="box-title">Q&A</h3>
			</div>
			<div style="float: right;">
				<a href="listpage">
					<button type="button" class="btn btn-info" style="float: right;">Go
						List</button>
				</a>
			</div>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			<div class="box-group" id="accordion">
				<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
				<div class="panel box box-success">
					<div class="box-header with-border">
						<h5 class="box-title">${QuestionVO.question_title }</h5>
						<h5 class="box-title" style="float: right;">${QuestionVO.mem_id }</h5>
					</div>
					<div class="box-header with-border ">

						<div class="froala-view">
							<h5 class="box-title">비밀글 입니다.</h5>
							<br>
							<br>${QuestionVO.question_content }</div>

						<div style="margin-top: 200px;">
							<ul class='list-group'>
								<li id="attach" class="list-group-item"></li>
							</ul>
							<a href="answer?no=${QuestionVO.question_no}">
								<button style="float: left;" id="AnsBoard" type="submit"
									class="btn btn-primary">Answer</button>
							</a> 
							<c:if test="${QuestionVO.mem_id == user.id }">
							<a href="questionModify?no=${QuestionVO.question_no } ">
								<button type="submit" class="btn btn-info">Modify</button>
							</a> <a href="questionRemove/${QuestionVO.question_no }">
								<button type="submit" id="delQuestionBtn" class="btn btn">Delete</button>
							</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="box-body">
			<c:forEach items="${ansList}" var="vo">
				<div class="box-group" id="accordion">
					<div class="panel box box-success">
						<input type="hidden" name="domain" value="${vo.clz_domain }">
						<c:set var="v" value="${vo.answer_visible }" />
						<c:set var="memId" value="${vo.mem_id }" />
						<c:set var="userId" value="${user.id}" />
						<c:set var="t" value="${isTeacher}" />
						<c:choose>
							<c:when test="${v == true || t == true || memId == userId}">
								<div class="box-header with-border">
									<h4 class="box-title" style="display: none;">${vo.question_no }</h4>
									<h4 id="answer_no" class="box-title" style="display: none;">${vo.answer_no }</h4>
									<h5 class="box-title">${vo.answer_title }</h5>
									<h4 class="box-title" style="float: right;">${vo.mem_id }</h4>
								</div>
								<div class="box-header with-border">
									<div class="froala-view" style="height: 200px;">
										<h5 class="box-title">비밀글 입니다.</h5>
										<br>
										<br>${vo.answer_content }</div>
									<div id="recommend btn-group"
										style="width: 50px; margin: 0 auto;">
										<button
											class="ddabong glyphicon glyphicon-thumbs-up btn btn-default btn-lg"
											style="size: 30px;" value="${vo.answer_no }">
											<span class="recommendCnt">${vo.answer_recommend }</span>
										</button>
									</div>
									<div style="margin-top: 10px;">
										<ul id="ansfileAttach" class='list-group'>
											<li id="ansAttach" class="list-group-item ans"></li>
										</ul>
									</div>
									<div>
										<c:if test="${memId == userId }">
										<a href="answerModify?rno=${vo.answer_no }&no=${vo.question_no } ">
											<button type="submit" class="btn btn-info">Modify</button>
										</a> <a href="answerRemove/${vo.answer_no }">
											<button type="submit" id="delBtn" class="btn btn">Delete</button>
										</a>
										</c:if>
									</div>
								</div>
							</c:when>
							<c:when test="${v == false || memId != userId }">
								<div class="box-header with-border">
									<h4 class="box-title">비밀 답변 입니다.</h4>
								</div>
								<div class="froala-view">비밀 글입니다.</div>
							</c:when>
						</c:choose>
					<script type="text/javascript">
						var domain = "${domain}";
						var ano = ${vo.answer_no};
							$.get(domain+"/../getAnsFile/"+ano, function(list){
								$(list).each(function(){
									
									var fileInfo = getFileInfo(this);
									var filePath = fileInfo.filePath.attachfile_path;
									var filename = fileInfo.filePath.attachfile_name;
									var file = "<div class='attach'><a href="+filesrc+"><span>"+filename+"</span></a><br/></div>";
									$('#ansAttach').append(file);
								});
							});
						</script>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
	
<script type="text/javascript">
	var no = ${QuestionVO.question_no};
	var domain = '${domain}';
	
	$('#delQuestionBtn').on('click',function() {
		$("img").each(function(idx) {
				var query = "attachfile_no="
						+ $(this).data("fileno")
						+ "&attachfile_name="
						+ $(this).data("src");
				$.post("/deleteFile", query, function() {
					alert("ok");
				});
			})
		});

	function getFileInfo(filePath) {

		var path = filePath.attachfile_path;
		var filename, fileLink, fileno;

		fileno = filePath.attachfile_no;
		filesrc = "/displayFile?fileName=" + path;
		fileLink = path.substr(0, 14);
		filename = fileLink.substr(path.indexOf("_") + 1);
		return {
			filename : filename,
			filesrc : filesrc,
			filePath : filePath,
			fileno : fileno
		};

	}

	$.get(domain + "/../getQuestionFile/" + no, function(list) {

		$(list).each(
				function() {
					var fileInfo = getFileInfo(this);
					var filePath = fileInfo.filePath.attachfile_path;
					var filename = fileInfo.filePath.attachfile_name;
					var file = "<div class='attach'><a href="+filesrc+"><span>"
							+ filename + "</span></a><br/></div>";
					$('#attach').append(file);
				});
	});

	$(".ddabong").on("click", function(event) {
		var $this = this;
		var ano = $($this).val();
		$.ajax({
			url : "../qna/answerRecommend",
			type : "post",
			data : {
				ano : ano
			},
			dataType : "text",

			success : function(result) {
				alert("추천!!");
				location.reload();
			}
		});
	});
</script>
<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>