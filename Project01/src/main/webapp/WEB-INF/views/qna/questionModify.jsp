<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

    <link href="/resources/froala_editor/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="/resources/froala_editor/css/froala_editor.min.css" rel="stylesheet" type="text/css" />
	<link href="/resources/froala_editor/css/froala_style.min.css" rel="stylesheet" type="text/css" />
	   
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
						<form role="form" method="post">
							<div style="height: 150px;">
								<input id="no" type="hidden" class="form-control" value="${QuestionVO.question_no}" name="question_no" > 
								<input id="title" type="text" class="form-control" value="${QuestionVO.question_title }" name="question_title">
								<!-- if 공개&비공개 -->
								<input id="question_visible" type="radio" name="question_visible" value = "1" checked> 공개
								<input id="question_visible" type="radio" name="question_visible" value = "0" > 비공개 
								<input id="gb" type="hidden" class="form-control" value="${QuestionVO.question_gb}" name="question_gb" > 
								<input id="mem_id" type="hidden" class="form-control" value="${QuestionVO.mem_id }" name="mem_id"> 
								<input id="clz_domain" type="hidden" class="form-control" value="${QuestionVO.clz_domain}" name="clz_domain">
							</div>
							
							<textarea id='edit' name="question_content" style="margin-top: 30px;">${QuestionVO.question_content }</textarea>
							<br />
								<div>
									<ul class='list-group' >
										<li class="list-group-item"></li>
									</ul>
								</div>
							<div class="box-footer">
								<c:if test="${QuestionVO.mem_id == user.id }">
								<button type="submit" class="btn btn-info">Modify</button>
								<a href="remove/${QuestionVO.question_no }" method="POST">
								<button	type="button" id="delBtn" class="btn btn">Delete</button> </a>
								</c:if>
								<a href="listpage?page=${cri.page }&perPageNum=${cri.perPageNum}">
								<button	type="button" class="btn btn-info">Go List</button> </a>
							</div>
						</form>
					</section>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>
  </section>
<div class='control-sidebar-bg'></div>


<!-- Text Editor -->
<script type="text/javascript"	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
</body>

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
		
		$('#edit').on('editable.afterFileUpload', function (e, editor, response) {
			
			var res = JSON.parse(response);
			var str = "<div class='attach'><a href='/displayFile?fileName='"+res.filePath+"><span>"+res.fileName+"</span></a>"
					+ "<a href='#' class='removeBtn' data-fileNo='"+res.fileNo+"' data-src="+res.fileName+"><span class='glyphicon glyphicon-remove-circle' style='float: right;'></span></a><br/></div>";
			var no =  "<input class='fno' type='hidden' name='attachfile_no' value='"+res.fileNo+"' />";
			$(".list-group-item").append(str);
			$("#regForm").append($(no));
			});
		
		$('.list-group-item').on("click",".removeBtn",function(event){
			
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
		
		function getFileInfo(filePath){
			
			var path = filePath.attachfile_path;
			var filename, fileLink, fileno;
			
			fileno = filePath.attachfile_no;
			filesrc = "/displayFile?fileName="+path;
			fileLink = path.substr(0,14);
			filename = fileLink.substr(path.indexOf("_") + 1);
			return {filename:filename, filesrc:filesrc, filePath:filePath, fileno:fileno};
			
		}
		
		
		$.get(domain+"/../getQuestionFile/"+no, function(list){
			
			$(list).each(function(){
				
				
				var fileInfo = getFileInfo(this);
				console.log(fileInfo);
				var filePath = fileInfo.filePath.attachfile_path;
				var filename = fileInfo.filePath.attachfile_name;
				var fileno = fileInfo.filePath.attachfile_no;
				var file = "<div class='attach'><a href='"+filesrc+"'><span>"+filename+"</span></a>" 
						+ "<a href='#' class='removeBtn' data-fileNo='"+fileno+"' data-src='"+filename+"'>"
					 	+ "<span class='glyphicon glyphicon-remove-circle' style='float: right;'></span></a><br/></div>";
				
				
				$('.list-group-item').append(file);
			});	
		});

	</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>