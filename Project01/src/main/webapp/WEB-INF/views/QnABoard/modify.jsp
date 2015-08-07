
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include/header.jsp"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
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

	<div class='row'>
		<div class='col-md-12'>
			<div class='box'>
				<div class='box-header'>
					<h3 class='box-title'>
						Bootstrap WYSIHTML5 <small>Simple and fast</small>
					</h3>
					<!-- tools box -->
					<div class="pull-right box-tools">
						<button class="btn btn-default btn-sm" data-widget='collapse'
							data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
					<!-- /. tools -->
				</div>
				<!-- /.box-header -->
				<div class='box-body pad'>
					<form role="form" method="post">
						<div style="height: 150px;">
							<input id="no" type="hidden" class="form-control" value="${QuestionVO.question_no}" name="question_no" > 
							<input id="title" type="text" class="form-control" value="${QuestionVO.question_title }" name="question_title"> 
							<input id="gb" type="hidden" class="form-control" value="${QuestionVO.question_gb}" name="question_gb" > 
							<input id="mem_id" type="hidden" class="form-control" value="${QuestionVO.mem_id }" name="mem_id"> 
							<input id="clz_domain" type="hidden" class="form-control" value="${QuestionVO.clz_domain}" name="clz_domain">
						</div>
						<textarea id="question_content" class="textarea" name="question_content" placeholder="Place some text here"
						style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" 
						>
						${QuestionVO.question_content }
						</textarea>

						<div class="box-footer">
							<button type="submit" class="btn btn-info">Modify</button>
							<a href="remove/${QuestionVO.question_no }" method="POST">
							<button	type="button" id="delBtn" class="btn btn">Delete</button> 
							<a href="listpage?page=${cri.page }&perPageNum=${cri.perPageNum}">
							<button	type="button" class="btn btn-info">Go List</button></a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>
	<!-- ./row --> </section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!-- Add the sidebar's background. This div must be placed
	           immediately after the control sidebar -->
<div class='control-sidebar-bg'></div>
</div>
<!-- ./wrapper -->

<!-- Bootstrap WYSIHTML5 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
<script
	src="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		// Replace the <textarea id="editor1"> with a CKEditor
		// instance, using default configuration.
		//bootstrap WYSIHTML5 - text editor
		$(".textarea").wysihtml5();
	});
</script>

<%@ include file="../include/footer.jsp"%>