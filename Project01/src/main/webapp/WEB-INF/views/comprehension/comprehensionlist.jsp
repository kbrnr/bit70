<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<style>

th {
		text-align: center;
		vertical-align: middle;
		background-color: #E0E0E0 ;
}
	
td {
	text-align: center;
}

.td-left {
	text-align: left;
}


.cont-box { 
		width:0px; height:0px;
		border-right:10px solid cornflowerblue;
		border-bottom:10px solid transparent;
		float:right;
	}



.lead {
	margin-bottom: 0px;
    margin-right: 0px;
    margin-left: 2px;
    vertical-align: middle;
}

.ahand { cursor: pointer; }

table {word-break:break-all;}




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
		<div class="box box-solid">
                
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
			                     	<th width="70px" >
			                     	${namelist.mem_name}
			                     	</th>
			                     </c:forEach>
			                  </tr>
							</thead>
							<tbody>							  
  							  <c:forEach items="${tqscorelist}" var="tqlist" varStatus="status">
							  <tr>
							  	<td data-content="${tqlist.teacherquestion_content}">${tqlist.teacherquestion_content}</span></td>
							  	
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
										<td data-com_no="${scorelist.comprehension_no}">
											<c:if test="${scorelist.comprehension_replycnt >= 1}">
													<span class="cont-box"></span>
											</c:if>
											<p class="lead "><a href="#" ><span class="label label-primary">${scorelist.comprehension_score}</span></a></p>
										</td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 3}">
										<td data-com_no="${scorelist.comprehension_no}">
											<c:if test="${scorelist.comprehension_replycnt >= 1}">
													<span class="cont-box"></span>
											</c:if>
											<p class="lead"><a href="#" ><span class="label label-warning">${scorelist.comprehension_score}</span></a></p>
										</td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 1}">
										<td data-com_no="${scorelist.comprehension_no}">
											<c:if test="${scorelist.comprehension_replycnt >= 1}">
													<span class="cont-box"></span>
											</c:if>
											<p class="lead"><a href="#" ><span class="label label-danger">${scorelist.comprehension_score}</span></a></p>
										</td>
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
		<div class="modal-dialog box-solid">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button id="btn_close" type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">이해도 메세지 기록</h4>
				</div>
				<div class="modal-body">
				
					
						<!-- Conversations are loaded here -->
						<div id="msg" class="direct-chat-messages direct-chat-primary">
							<!-- Message. Default to the left -->
								<!-- 댓글내용 -->
								<!-- /댓글내용 -->
						</div>
						<!--/.direct-chat-messages-->

					
					
						<form id="reply" action="">
							<div class="input-group">
								<input id="replymsg" type="text" name="replymsg" placeholder="Type Message ..." class="form-control"> 
								<input id="com_no" type="hidden" name="com_no" value="">
								<span class="input-group-btn">
									<button id="btn_sendreply" type="button" class="btn btn-primary btn-flat">Send</button>
								</span>
							</div>
						</form>
					
					<!-- /.box-footer-->

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
	replyAll(com_no);
});

//이해도팝업에서 댓글 추가
$("#btn_sendreply").on("click", function(){
	var url = '/${domain}/reply';
	var comprehension_no = $("#com_no").val();
	var reply_content = $("#replymsg").val();
	
	
	$.ajax({
		type : 'POST',
		url : url,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			comprehension_no: comprehension_no,
			reply_content: reply_content,
			reply_writer: "${user.id}"
		}),
		success : function(result) {
			replyAll(comprehension_no);
		}
	});
	
	
	
});


function replyAll(comprehension_no){
	var url = '/${domain}/reply/replyall';
	console.log("replyall " + comprehension_no);
	console.log("callback " + comprehension_no);
	
	$.ajax({
		type : 'GET',
		url : url + "?comprehension_no=" + comprehension_no,
		dataType: "JSON", 
		success : function(msglist) {
			var listStr = "";
			$(msglist).each(
					function(){
						
						if(this.reply_writer== "${user.id}"){
							listStr += "<div class='direct-chat-msg right'>"+
					                    	"<div class='direct-chat-info clearfix'>"+
					                        	"<span class='direct-chat-name pull-right'>"+ this.reply_writer+ "</span>"+
					                        	"<span class='direct-chat-timestamp pull-left'>"+ this.reply_reg_date +"</span>"+
					                      	"</div>"+
					                      	"<img class='direct-chat-img' src='/${domain}/seat/seatImg?userId="+ this.reply_writer +"' alt='message user image' />"+
					                      	"<div class='direct-chat-text'>" + this.reply_content + "</div>"+
					                   "</div>" ;	
							
						}
						else{
							listStr += "<div class='direct-chat-msg'>"+
			                      			"<div class='direct-chat-info clearfix'>"+
			                        			"<span class='direct-chat-name pull-left'>"+ this.reply_writer+ "</span>"+
			                        			"<span class='direct-chat-timestamp pull-right'>"+ this.reply_reg_date +"</span>"+
			                      			"</div>"+
			                      			"<img class='direct-chat-img' src='/${domain}/seat/seatImg?userId="+ this.reply_writer +"' alt='message user image' />"+
			                      			"<div class='direct-chat-text'>" + this.reply_content + "</div>"+
			                    		"</div>" ;	
						}
					}
			);
			$("#msg").html(listStr);
			$("#msg").scrollTop(1000);
		}
	});	
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