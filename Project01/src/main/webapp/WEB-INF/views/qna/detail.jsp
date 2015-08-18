<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/resources/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- SlimScroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />

<link href="/resources/froala_editor/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<link href="/resources/froala_editor/css/froala_editor.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/froala_editor/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- START ACCORDION & CAROUSEL-->
	<h2 class="page-header">Bootstrap Accordion & Carousel</h2>
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
						</div>
						<div class="box-header with-border ">

							<div class="froala-view" style="width: 500px;">${QuestionVO.question_content }</div>
							<div>
									<ul id="fileAttach" class='list-group' >
										<li class="list-group-item"></li>
									</ul>
							</div>

							<div style="margin-top: 200px;">
								<a href="answer?no=${QuestionVO.question_no}">
									<button style="float: left;" id="AnsBoard" type="submit"
										class="btn btn-primary">Answer</button>
								</a> <a href="questionModify?no=${QuestionVO.question_no } ">
									<button type="submit" class="btn btn-info">Modify</button>
								</a> <a href="questionRemove/${QuestionVO.question_no }">
									<button type="submit" id="delQuestionBtn" class="btn btn">Delete</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="box-body">
				<div class="box-group" id="accordion">
					<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
					<c:forEach items="${ansList}" var="vo">
						<div class="panel box box-success">
							<div class="box-header with-border">
								<h4 class="box-title">${vo.question_no }</h4>
								<h4 class="box-title">${vo.answer_no }</h4>
								<h5 class="box-title">${vo.answer_title }</h5>
								<h4 class="box-title">${vo.mem_id }</h4>
								<h4 class="box-title">${vo.answer_recommend }</h4>
							</div>
							<div class="box-header with-border ">
								<div class="box-body" style="height: 500px;">
									${vo.answer_content }</div>
								<div>
									<a href="questionRegist">
										<button style="float: left;" id="ResBoard" type="submit"
											class="btn btn-primary">Write</button>
									</a> <a
										href="answerModify?rno=${vo.answer_no }&no=${vo.question_no } ">
										<button type="submit" class="btn btn-info">Modify</button>
									</a> <a href="answerRemove/${vo.answer_no }">
										<button type="submit" id="delBtn" class="btn btn">Delete</button>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- Answer box End -->
		</div>
		<!-- /.box -->
		<!-- /.col -->
	</div>
	<!-- /.row -->
</body>
<script type="text/javascript">

	$('#delQuestionBtn').on('click', function() {
		$("img").each(function(idx){
			var query = "attachfile_no=" + $(this).data("fileno") +"&attachfile_name=" + $(this).data("src");
			$.post("/deleteFile", query, function() {
				alert("ok");
			}); 
		})
	});
	

	function getFileInfo(filePath){
		
		var filename, fileLink;
		
		filesrc = "/displayFile?filename="+filePath;
		fileLink = filePath.substr(0,14);
		filename = fileLink.substr(fileLink.indexOf("_") + 1);
		
		return {filename:filename, filesrc:filesrc, filePath:filePath};
		
	}
	
	var no = ${QuestionVO.question_no};
	var domain = '${domain}';
	
	$.getJSON(+"/getAttachFile/"+no, function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			var file = "<li><span>"+fileInfo+"</span></li>";
			$('#fileAttachfile').append(file);
		});	
	});
	
		
		
</script>
</html>
