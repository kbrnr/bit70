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
							<small>Simple and fast</small>
						</h3>
					</div>
					<!-- /.box-header -->
					<div class='box-body pad'>
						<section id="editor" style="width: 100%; margin: auto;">
							<form id='regForm' role="form" method="post" action="questionRegist">
								<div style="height: 150px;">
									<input id="title" type="text" class="form-control" value="${vo.question_title }" name="question_title" placeholder="title"> 
									<input id="mem_id" type="hidden" class="form-control" name="mem_id" value="${user.id}"> 
									<input id="question_visible" type="radio" name="question_visible" value = "1" checked> 공개
									<input id="question_visible" type="radio" name="question_visible" value = "0" > 비공개
									<input id="clz_domain" type="hidden" class="form-control" name="clz_domain" value="${domain }">
								</div>
								<textarea id='edit' name="question_content" style="margin-top: 30px;"></textarea>
								<br/>
								<div>
									<ul class='list-group' >
										<li class="list-group-item"></li>
									</ul>
								</div>
								<div class="box-footer">
									<button id="RegBoard" type="submit" class="btn btn-primary">Submit</button>
									<a href="listpage">
										<button type="button" class="btn btn-info" style="float: right;">Go List</button>
									</a>
								</div>
							</form>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class='control-sidebar-bg'></div>
	
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
	
	$('#edit').on('editable.beforeRemoveImage', function (e, editor, img) {
		
		var attachfile_no = img.context.dataset.fileno;
		var attachfile_name = img.context.dataset.src;

		$.post("/deleteFile", { attachfile_name : attachfile_name ,
								attachfile_no : attachfile_no }, function(){
									
			$(":hidden[value="+attachfile_no+"]").remove();
			
		});
	});
	
	 $('#regForm').on("submit", function(event){
	     var userId = $("#mem_id").val();
	     console.log(userId);
		 event.preventDefault();
	      $.ajax({
	         url: "questionRegist",
	         type: "post",
	         data: $(this).serialize(),
	         success: function(no){
	        	console.log(no);
	            parent.socket.emit("seatQuestion", { userId: $("#mem_id").val(), qno: no});
	            location.href = "/${domain}/qna/listpage"; 
	         },
	         dataType: "text"
	      });
	   });
	
	
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>