<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
   <!-- Bootstrap 3.3.4 -->
   <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
   <!-- Theme style -->
   <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
   <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
   <!-- jQuery 2.1.4 -->
   <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
   <!-- Bootstrap 3.3.2 JS -->
   <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <!-- SlimScroll -->
   <script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <!-- FastClick -->
   <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
   <!-- AdminLTE App -->
   <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
   <!-- bootstrap wysihtml5 - text editor -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
   

   <link href="/resources/froala_editor/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<!-- Include Editor style. -->
	<link href="/resources/froala_editor/css/froala_editor.min.css" rel="stylesheet" type="text/css" />
	<link href="/resources/froala_editor/css/froala_style.min.css" rel="stylesheet" type="text/css" />
	   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Text Editors <small>Advanced form element</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Forms</a></li>
		<li class="active">Editors</li>
	</ol>
	</section>

	<!-- Main content -->
	<section class="content">
	
	<!-- /.box-header -->
			<div class="box-body">
				<div class="box-group" id="accordion">
					<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
					<div class="panel box box-success">
						<div class="box-header with-border">
							<h5 class="box-title">${QuestionVO.question_title }</h5>
						</div>
						<div class="box-header with-border ">
							<div class="froala-view">${QuestionVO.question_content }</div>
							<ul id="fileAttach" class='list-group' >
										<li class="list-group-item"></li>
									</ul>
							<div>
								<a href="regist">
									<button style="float: left;" id="ResBoard" type="submit"
										class="btn btn-primary">Write</button>
								</a> <a href="modify?no=${QuestionVO.question_no } ">
									<button type="submit" class="btn btn-info">Modify</button>
								</a> <a href="remove/${QuestionVO.question_no }">
									<button type="submit" id="delBtn" class="btn btn">Delete</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
	
	<div class='row'>
		<div class='col-md-12'>
			<div class='box'>
				<div class='box-header'>
					<h3 class='box-title'>
						Bootstrap WYSIHTML5 <small>Simple and fast</small>
					</h3>
				</div>
				<!-- /.box-header -->
				<div class='box-body pad'>
					<section id="editor" style="width : 100%; margin: auto;">
						<form role="form" method="post" action="answerModify">
							<div style="height: 150px;">
								<input id="answer_no" type="hidden" class="form-control" value= "${vo.answer_no }" name="answer_no" >	
								<input id="question_no" type="hidden" class="form-control" value= "${vo.question_no }" name="question_no" >							
								<input id="title" type="text" class="form-control" value= "${vo.answer_title }" name="answer_title" placeholder="title">
								<!-- <input id="gb" type="text" class="form-control" name="question_gb" value= placeholder="구분은 히든으로 처리하자" > -->
								<input id="mem_id" type="text" class="form-control" name="mem_id" value = '${vo.mem_id }' placeholder="맴버아이디 히든으로 처리하자">
								<input id="clz_domain" type="text" class="form-control" name="clz_domain" value= "${vo.clz_domain }" } placeholder="도메인 히든으로 처리하자">
							</div>
							
							<textarea id='edit' name="answer_content" style="margin-top: 30px;">${vo.answer_content }</textarea>
							<br/>
							<div>
									<ul class='list-group' >
										<li class="list-group-item"></li>
									</ul>
							</div>
						<div class="box-footer">
							<button id="ansModify" type="submit" class="btn btn-primary">Submit</button>
							<a href="listpage">
								<button type="button" class="btn btn-info" style="float: right;">Go	List</button>
							</a>
						</div>
						</form>
					</section>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>
	<!-- ./row --> </section>
	<!-- /.content -->
<!-- /.content-wrapper -->
<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
<div class='control-sidebar-bg'></div>


<!-- Text Editor -->
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/froala_editor/js/froala_editor.min.js"></script>
<!--[if lt IE 9]>
  <script src="../js/froala_editor_ie8.min.js"></script>
<![endif]-->

<script type="text/javascript">
		
	$('#edit').editable({
		inlineMode : false,
		height : 500,
		buttons : [ 'bold', 'italic', 'underline', 'fontFamily',
				'fontSize', 'color', ' formatBlock', 'inlineStyle',
				'align', 'insertOrderedList',
				'insertUnorderedList', 'outdent', 'indent',
				'createLink', 'insertImage', 'uploadFile', 'table',
				'undo', 'redo', 'html' ],
		imageUploadURL : "/upload",	
		pastedImagesUploadURL : "/upload",		
		fileUploadURL: "/upload"
			
	});
	
	
	$('#edit').on('editable.afterFileUpload', function (e, editor, response) {
		
		var res = JSON.parse(response);
		var str = "<a href='/displayFile?fileName="+res.filePath+"'<span>"+res.fileName+"</span></a><br/>";
		var no =  "<input class='fno' type='hidden' name='attachfile_no' value='"+res.fileNo+"' />";
		$(".list-group-item").append(str);
		$("#regForm").append($(no));
		});
	
	$('#edit').on('editable.afterImageUpload', function (e, editor, response) {
		
		var res = JSON.parse(response);
		var str = "<img width ='300' name='attachfile_name' class='fr-fin fr-dib' data-fileNo='"+res.fileNo+"' data-src="+ res.filePath +" src='/displayFile?fileName="+ res.filePath +"' />";
		var no = "<input class='fno' type='hidden' name='attachfile_no' value='"+res.fileNo+"' />";
		
		$(".froala-view").append(str);
		$("#regForm").append($(no));
		
	});
	
	$('#edit').on('editable.beforeRemoveImage', function (e, editor, img) {
		
		var attachfile_no = img.context.dataset.fileno;
		var attachfile_name = img.context.dataset.src;
	
		$.post("/deleteFile", { attachfile_name : attachfile_name ,
								attachfile_no : attachfile_no }, function(){
									
			$(":hidden[value="+attachfile_no+"]").remove();
			
		});
	});
	

</script>

</body>
</html>