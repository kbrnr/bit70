<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<style>

.cont-box { 
		width:0px; height:0px;
		border-right:10px solid cornflowerblue;
		border-bottom:10px solid transparent;
		float:right;
	}

.table>tbody>tr>td {
    padding-right: 0px;
    padding-top: 0px;
    padding-left: 18px;
    vertical-align: middle;
  }

.lead {
	margin-bottom: 0px;
    margin-right: 0px;
    margin-left: 2px;
    vertical-align: middle;
}

.ahand { cursor: pointer; }





</style>

		<section class="content-header">
			<h1>
				Top Navigation <small>Example 2.0</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">
						<i class="fa fa-dashboard"></i> Home
					</a></li>
				<li class="active">Dashboard</li>
			</ol>
		</section>



		<!-- Main content -->
		<section class="content">
		<!-- ----------------------------------------- -->
		<div class="box">
                <div class="box-header">
                  <h3 class="box-title">■${domain} 이해도</h3>
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
	                  	<div class="col-sm-12">
	                  	<div class="box-body table-responsive no-padding">
		                  <table class="table table-hover table-bordered">
		                    <thead>
		                      <tr>
		                      	 <th width="142px" >&nbsp;</th>
		                      	 <c:forEach items="${tqscorelist[0].scorelist}" var="namelist">
			                     	<th width="80px" style="table-layout:fixed" >
			                     	${namelist.mem_name}
			                     	</th>
			                     </c:forEach>
			                  </tr>
							</thead>
							<tbody>							  
  							  <c:forEach items="${tqscorelist}" var="tqlist" varStatus="status">
							  <tr>
							  	<td data-content="${tqlist.teacherquestion_content}">${tqlist.teacherquestion_content}</td>
							  	
							  	<c:forEach items="${tqlist.scorelist}" var="scorelist">
								
								<c:choose>
									<c:when test="${scorelist.comprehension_score >= 9}">
										<td data-com_no="${scorelist.comprehension_no}">
											<c:if test="${scorelist.comprehension_replycnt >= 1}">
													<span class="cont-box"></span>
											</c:if>
											<p class="lead"><a href="#" ><span class="label label-success">${scorelist.comprehension_score}</span></a></p>
										</td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 7}">
										<td data-com_no="${scorelist.comprehension_no}">
											<c:if test="${scorelist.comprehension_replycnt >= 1}">
													<span class="cont-box"></span>
											</c:if>
											<p class="lead "><a href="#" ><span class="label label-info">${scorelist.comprehension_score}</span></a></p>
										</td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 5}">
										<td><p class="lead "><span class="label label-primary">${scorelist.comprehension_score}</span></p></td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 3}">
										<td><p class="lead"><span class="label label-warning">${scorelist.comprehension_score}</span></p></td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 1}">
										<td><p class="lead"><span class="label label-danger">${scorelist.comprehension_score}</span></p></td>
									</c:when>
									
									<c:otherwise >
										<c:if test="${scorelist.mem_id == user.id}">										
											<td ><a href="#"><span data-qno="${tqlist.teacherquestion_no}" class="label label-default" >입력</span></a></td>
										</c:if>
										<c:if test="${scorelist.mem_id != user.id}">										
											<td >&nbsp;</td>
										</c:if>
									</c:otherwise>
								</c:choose>
							  
							  	</c:forEach>
							  </tr>
							  </c:forEach>
			                </tbody>   
		                  </table>
		                  </div>
	                  	</div><!-- /.grid -->
                  	</div><!-- /.row -->
                    	
             	
                    	
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
	</section>

	<!-- 이해도 메세지 기록 Modal -->
	<div class="modal fade" id="scoreMsgModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">이해도 메세지 기록</h4>
				</div>
				<div class="modal-body">


					<div class="box-body">
						<!-- Conversations are loaded here -->
						<div class="direct-chat-messages">
							<!-- Message. Default to the left -->
							<div class="direct-chat-msg">
								<div class="direct-chat-info clearfix">
									<span class="direct-chat-name pull-left">Alexander
										Pierce</span> <span class="direct-chat-timestamp pull-right">23
										Jan 2:00 pm</span>
								</div>
								<!-- /.direct-chat-info -->
								<img class="direct-chat-img" src="../dist/img/user1-128x128.jpg"
									alt="message user image">
								<!-- /.direct-chat-img -->
								<div class="direct-chat-text">Is this template really for
									free? That's unbelievable!</div>
								<!-- /.direct-chat-text -->
							</div>
							<!-- /.direct-chat-msg -->


						</div>
						<!--/.direct-chat-messages-->


					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<form id="reply" action="">
							<div class="input-group">
								<input id="replymsg" type="text" name="replymsg" placeholder="Type Message ..." class="form-control"> 
								<input id="com_no" type="text" name="com_no" value="">
								<span class="input-group-btn">
									<button id="btn_sendreply" type="button" class="btn btn-primary btn-flat">Send</button>
								</span>
							</div>
						</form>
					</div>
					<!-- /.box-footer-->

				</div>
				<div class="modal-footer">
					<button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- /이해도 메세지 기록 Modal -->	



<script>
//이해도 댓글 팝업 호출
$(".lead").on("click", function(){
	var com_no = $(this).parents().data("com_no");
	$("#scoreMsgModal [name=com_no]").val(com_no);
	$("#scoreMsgModal").modal();
});

//이해도 댓글 추가
$("#btn_sendreply").on("click", function(){
	var url = '/${domain}/reply';
	
	$.ajax({
		type : 'POST',
		url : url,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			comprehension_no: $("#com_no").val(),
			reply_content: $("#replymsg").val()
		}),
		success : function(result) {
			replyAll($("#com_no").val());
		}
	});
});

function replyAll(comprehension_no){
	
	url
	ajax 
	
	
	succeess :
		
	
	
}


$("#btn_close").on("click", function(){
	$(location).attr('href','/${domain}/comprehension'); 
});

//이해도 점수 모달 관련//
$(".label.label-default").on('click', function(){
	parent.$("#myModal [name=teacherquestion_no]").val($(this).data("qno"));
	parent.$("#myModal #msg").text($(this).parents().siblings(":first").data("content"));	
	parent.$("#myModal [name=comprehension_score").val("");
	parent.$("#myModal").modal("show");	
});

parent.$("#sendScore").submit(function(e){
	var $this = $(this);
	console.log($this.serialize());
	$.post("/${domain}/comprehension", $this.serialize(), function(data){
		var obj = {
			mem_id: "${user.id}", 
			teacherquestion_no: $this.find("[name=teacherquestion_no]").val(),
			comprehension_score: $this.find("[name=comprehension_score]").val(),
		}
		parent.socket.emit("seatScore", obj);
	});
	parent.$('#myModal').modal('hide');
	$(location).attr('href','/${domain}/comprehension'); 
	return false;
});
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>