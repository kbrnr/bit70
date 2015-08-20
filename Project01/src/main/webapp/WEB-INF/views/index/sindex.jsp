<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/s_index_header.jsp"%>
<%@include file="/WEB-INF/views/include/s_index_aside.jsp"%>
<style>
.wrapper, .wrapper .content-wrapper, .content-wrapper *{
	height: 100%;
} 
</style>
<div class="content-wrapper">
	<iframe name="inner" src="/${domain}/${userid}/s/main" width="100%" height="100%" style="border:none;"></iframe>
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이해했니?</h4>
			</div>
			<div class="modal-body">
				<p id="msg">이해되냐</p>
				<div class="row">
  					<div class="col-md-3">
  						<form id="sendScore" class="form-inline">
							<input type="hidden" name="clz_domain" value="${domain}">
							<input type="hidden" name="mem_id" value="${userid}">
							<input type="hidden" name="teacherquestion_no">
							<div class="input-group">
						      <input type="number" name="comprehension_score" class="form-control" min="0" max="10" placeholder="점수" required="required">
						      <span class="input-group-btn">
						        <button class="btn btn-default">전송</button>
						      </span>
						    </div>
					    </form>
			    	</div>
			    </div>
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