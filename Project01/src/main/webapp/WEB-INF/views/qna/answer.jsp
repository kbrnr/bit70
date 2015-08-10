<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	<!-- /.box-header -->
			<div class="box-body">
				<div class="box-group" id="accordion">
					<!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
					<div class="panel box box-success">
						<div class="box-header with-border">
							<h5 class="box-title">${QuestionVO.question_title }</h5>
						</div>
						<div class="box-header with-border ">
							<div class="box-body" style="height: 500px;">
								${QuestionVO.question_content }</div>
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
					<form role="form" method="post" action="answer">
						<div style="height: 150px;">
							<input id="question_no" type="hidden" class="form-control" name="question_no" value= " ${QuestionVO.question_no }" placeholder="맴버아이디 히든으로 처리하자">
							<input id="title" type="text" class="form-control" value= "Re : ${QuestionVO.question_title }" name="answer_title" placeholder="title">
							<!-- <input id="gb" type="text" class="form-control" name="question_gb" placeholder="구분은 히든으로 처리하자" > -->
							<input id="answer_visible" type="radio" name="answer_visible" value = "1" checked> 공개
							<input id="answer_visible" type="radio" name="answer_visible" value = "0" > 비공개
							<input id="mem_id" type="text" class="form-control" name="mem_id" placeholder="맴버아이디 히든으로 처리하자">
							<input id="clz_domain" type="text" class="form-control" name="clz_domain" placeholder="도메인 히든으로 처리하자">
						</div>
						<textarea id="answer_content" class="textarea" name="answer_content" placeholder="Place some text here"
							style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">
							</textarea>
					
					<div class="box-footer">
						<button id="answerRegist" type="submit" class="btn btn-primary">Submit</button>
						<a href="listpage">
							<button type="button" class="btn btn-info" style="float: right;">Go	List</button>
						</a>
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
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
   <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
<script	src="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
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