<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include/header.jsp"%>
<div class="content-wrapper">
	<!-- START ACCORDION & CAROUSEL-->
	<h2 class="page-header">Bootstrap Accordion & Carousel</h2>
	<div class="row"
		style="width: 50%; margin-right: auto; margin-left: auto;">
		<div class="col-md-6"
			style="width: 90%; margin-right: auto; margin-left: auto;">
			<div class="box-header with-border">
				<div style="float: left">
					<h3 class="box-title">Q&A
				</div>
				<div style="float: right;">
					<a href="listpage">
						<button type="button" class="btn btn-info" style="float: right;">Go
							List</button>
					</a>
				</div>
				</h3>
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
							<div class="box-body" style="height: 500px;">
								${QuestionVO.question_content }</div>
							<div>
								<a href="answer?no=${QuestionVO.question_no}">
									<button style="float: left;" id="AnsBoard" type="submit" class="btn btn-primary">Answer</button>
								</a> 
								<a href="questionModify?no=${QuestionVO.question_no } ">
									<button type="submit" class="btn btn-info">Modify</button>
								</a> 
								<a href="questionRemove/${QuestionVO.question_no }">
									<button type="submit" id="delBtn" class="btn btn">Delete</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->

			<!-- Answer box -->
			
			<!-- 			
				<div class="box-header with-border">
				<div style="float: left">
					<h3 class="box-title">Answers
				</div>
	 			</div>
 			-->
				
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
									</a> <a href="answerModify?rno=${vo.answer_no }&no=${vo.question_no } ">
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
	<!-- END ACCORDION & CAROUSEL-->
</div>
<%@ include file="../include/footer.jsp"%>