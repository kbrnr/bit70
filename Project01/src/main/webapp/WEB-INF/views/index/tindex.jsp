<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/t_index_header.jsp"%>
<%@include file="/WEB-INF/views/include/t_index_aside.jsp"%>
<style>
.wrapper, .wrapper .content-wrapper, .content-wrapper *{
	height: 100%;
} 
</style>

<div class="content-wrapper">
	<iframe name="inner" src="/${domain}/${userid}/t/main" width="100%" height="100%"  onload="autoResize(this)" frameborder="0"></iframe>
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			Modal content
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이해했닝</h4>
			</div>
			<div class="modal-body">
				<form id="sendQuestion" class="form-inline">
					<input type="hidden" name="curri_no">
					<input type="hidden" name="curri_gpno">
					<div class="input-group">
				      <input type="text" name="teacherquestion_content" class="form-control" placeholder="질문을 입력하세요">
				      <span class="input-group-btn">
				        <button id="questionBtn" class="btn btn-default">전송</button>
				      </span>
				    </div>
			    </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
<script>
	var socket = io.connect('http://14.32.66.104:3002');
	socket.on("connect", function(){
		socket.emit("init", {domain: "${domain}", userId: "${userid}"});	
	});
</script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>