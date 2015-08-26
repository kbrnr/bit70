<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

	<!-- Text Editor -->
	<link href="/resources/froala_editor/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<!-- Include Editor style. -->
	<link href="/resources/froala_editor/css/froala_editor.min.css" rel="stylesheet" type="text/css" />
	<link href="/resources/froala_editor/css/froala_style.min.css" rel="stylesheet" type="text/css" />   

<!-- Content Wrapper. Contains page content -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
	    <h1>질문답변</h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-fw fa-home"></i>Home</a></li>
	        <li><a href="#">${domain }</a></li>
	        <li class="active">질문답변</li>
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
							<h5 class="box-title" style="float: right;">${QuestionVO.mem_id }</h5>
						</div>
						<div class="box-header with-border ">
							<div class="froala-view" style="height: 200px;">${QuestionVO.question_content }</div>
							<br/>
						</div>
						<ul id="fileAttach" class='list-group' >
										<li id="question_attachfile" class="list-group-item"></li>
									</ul>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
	
	<div class='row'>
		<div class='col-md-12'>
			<div class='box'>
				<div class='box-body pad'>
					<section id="editor" style="width : 100%; margin: auto;">
						<form id="ansForm" role="form" method="post" action="answer">
							<div style="height: 150px;">
								<input id="question_no" type="hidden" class="form-control" name="question_no" value= " ${QuestionVO.question_no }" >
								<input id="title" type="text" class="form-control" value= "Re : ${QuestionVO.question_title }" name="answer_title" placeholder="title">
								<!-- <input id="gb" type="text" class="form-control" name="question_gb" placeholder="구분은 히든으로 처리하자" > -->
								<input id="answer_visible" type="radio" name="answer_visible" value = "1" checked> 공개
								<input id="answer_visible" type="radio" name="answer_visible" value = "0" > 비공개
								<input id="mem_id" type="hidden" class="form-control" name="mem_id" value="${user.id}">
								<input id="clz_domain" type="hidden" class="form-control" name="clz_domain" value="${domain }">
							</div>
							<textarea id='edit' name="answer_content" style="margin-top: 30px;"></textarea>
							<br/>
							<div>
									<ul class='list-group' >
										<li id="ansAttach" class="list-group-item"></li>
									</ul>
							</div>
						<div class="box-footer">
							<button id="answerRegist" type="submit" class="btn btn-primary">Submit</button>
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

<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="/resources/froala_editor/js/froala_editor.min.js"></script>
<!--[if lt IE 9]>
  <script src="../js/froala_editor_ie8.min.js"></script>
<![endif]-->
<script src="/resources/froala_editor/js/plugins/tables.min.js"></script>
<script src="/resources/froala_editor/js/plugins/urls.min.js"></script>
<script src="/resources/froala_editor/js/plugins/lists.min.js"></script>
<script src="/resources/froala_editor/js/plugins/colors.min.js"></script>
<script src="/resources/froala_editor/js/plugins/font_family.min.js"></script>
<script src="/resources/froala_editor/js/plugins/font_size.min.js"></script>
<script src="/resources/froala_editor/js/plugins/block_styles.min.js"></script>
<script src="/resources/froala_editor/js/plugins/media_manager.min.js"></script>
<script src="/resources/froala_editor/js/plugins/video.min.js"></script>
<script src="/resources/froala_editor/js/plugins/char_counter.min.js"></script>
<script src="/resources/froala_editor/js/plugins/entities.min.js"></script>
<script src="/resources/froala_editor/js/plugins/urls.min.js"></script>
<script src="/resources/froala_editor/js/plugins/file_upload.min.js"></script>
<!-- Text Editor -->	
	
<script type="text/javascript">
		
		var no = ${QuestionVO.question_no};
		var domain = '${domain}';
		
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
			var str = "<a href='/displayFile?fileName="+res.filePath+"'<span>"+res.fileName+"</span></a>"
				 + "<a href='#' class='removeBtn' data-fileNo='"+res.fileNo+"' data-src="+res.fileName+"><span class='glyphicon glyphicon-remove-circle' style='float: right;'></span></a><br/></div>";
			var no =  "<input class='fno' type='hidden' name='attachfile_no' value='"+res.fileNo+"' />";
			$("#ansAttach").append(str);
			$("#ansForm").append($(no));
			});
		
		$('#edit').on('editable.afterImageUpload', function (e, editor, response) {
			
			var res = JSON.parse(response);
			var str = "<img width ='300' name='attachfile_name' class='fr-fin fr-dib' data-fileNo='"+res.fileNo+"' data-src="+ res.filePath +" src='/displayFile?fileName="+ res.filePath +"' />";
			var no = "<input class='fno' type='hidden' name='attachfile_no' value='"+res.fileNo+"' />";
			var view = $(".f-placeholder.froala-view.froala-element.not-msie.f-basic");
			view.append(str);
			$("#ansForm").append($(no));
			
		});
		
		$('#edit').on('editable.beforeRemoveImage', function (e, editor, img) {
			
			var attachfile_no = img.context.dataset.fileno;
			var attachfile_name = img.context.dataset.src;
		
			$.post("/deleteFile", { attachfile_name : attachfile_name ,
									attachfile_no : attachfile_no }, function(){
										
				$(":hidden[value="+attachfile_no+"]").remove();
				
			});
		});
		

		function getFileInfo(filePath){
			
			var path = filePath.attachfile_path;
			var filename, fileLink, fileno;
			
			filesrc = "/displayFile?fileName="+path;
			fileLink = path.substr(0,14);
			filename = fileLink.substr(path.indexOf("_") + 1);
			fileno = filePath.attachfile_no;
			return {filename:filename, filesrc:filesrc, filePath:filePath, fileno:fileno};
			
		}
		
		$.get(domain+"../qna/getQuestionFile/"+no, function(list){
			
			$(list).each(function(){
				
				var fileInfo = getFileInfo(this);
				var filePath = fileInfo.filePath.attachfile_path;
				var filename = fileInfo.filePath.attachfile_name;
				var file = "<a href="+filesrc+"><span>"+filename+"</span></a><br/>";
				$('#question_attachfile').append(file);
			});	
		});
		
		$('#ansAttach').on("click",".removeBtn",function(event){
			
			var $that = $(this);
			
			var attachfile_no =  $that.attr("data-fileNo")
			var attachfile_name = $that.attr("data-src");
			var $this = $(this);
			
			 $.ajax({
				url: "/deleteFile",
				type: "post",
				data: {attachfile_name: attachfile_name,
					   attachfile_no : attachfile_no },
				dataType: "text",
				
				success : function(result){
					if(result == 'deleted'){
						$(":hidden[value="+attachfile_no+"]").remove();
						$this.parent().remove();
					}
				}
			}); 
		});
		
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>