<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<style>
table td{
	padding: 0px;
}

.cont-box{ 
	width:0px; height:0px;
	border-right:10px solid cornflowerblue;
	border-bottom:10px solid transparent;
	float:right;
	 
}

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
										<td><p class="lead"><span class="label label-success">${scorelist.comprehension_score}</span></p></td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 7}">
										<td>
										<div class="cont-box"></div>
										<p class="lead ">
										<c:if test="${scorelist.comprehension_replycnt >= 1}">
										<span class="label label-info">${scorelist.comprehension_score}</span>
										</c:if>
										</p>
										
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
											<td ><span data-qno="${tqlist.teacherquestion_no}" class="label label-default" >입력</span></td>
										</c:if>
										<c:if test="${scorelist.mem_id != user.id}">
											<td><span>&nbsp;</span></td>
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

<div class="row">                 	
                    	<div class="col-md-3">
              <!-- DIRECT CHAT PRIMARY -->
              <div class="box box-primary direct-chat direct-chat-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Direct Chat</h3>
                  <div class="box-tools pull-right">
                    <span data-toggle="tooltip" title="3 New Messages" class="badge bg-light-blue">3</span>
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle"><i class="fa fa-comments"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <!-- Conversations are loaded here -->
                  <div class="direct-chat-messages">
                    <!-- Message. Default to the left -->
                    <div class="direct-chat-msg">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">Alexander Pierce</span>
                        <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                      </div><!-- /.direct-chat-info -->
                      <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        Is this template really for free? That's unbelievable!
                      </div><!-- /.direct-chat-text -->
                    </div><!-- /.direct-chat-msg -->

                    <!-- Message to the right -->
                    <div class="direct-chat-msg right">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-right">Sarah Bullock</span>
                        <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                      </div><!-- /.direct-chat-info -->
                      <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                        You better believe it!
                      </div><!-- /.direct-chat-text -->
                    </div><!-- /.direct-chat-msg -->
                  </div><!--/.direct-chat-messages-->

                  <!-- Contacts are loaded here -->
                  <div class="direct-chat-contacts">
                    <ul class="contacts-list">
                      <li>
                        <a href="#">
                          <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg">
                          <div class="contacts-list-info">
                            <span class="contacts-list-name">
                              Count Dracula
                              <small class="contacts-list-date pull-right">2/28/2015</small>
                            </span>
                            <span class="contacts-list-msg">How have you been? I was...</span>
                          </div><!-- /.contacts-list-info -->
                        </a>
                      </li><!-- End Contact Item -->
                    </ul><!-- /.contatcts-list -->
                  </div><!-- /.direct-chat-pane -->
                </div><!-- /.box-body -->
                <div class="box-footer">
                  <form action="#" method="post">
                    <div class="input-group">
                      <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                      <span class="input-group-btn">
                        <button type="button" class="btn btn-primary btn-flat">Send</button>
                      </span>
                    </div>
                  </form>
                </div><!-- /.box-footer-->
              </div><!--/.direct-chat -->
            </div>
     </div>     



<script>
$(".label.label-default").on('click', function(){
	parent.$("#myModal [name=teacherquestion_no]").val($(this).data("qno"));
	parent.$("#myModal #msg").text($(this).parents().siblings(":first").data("content"));	
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
	return false;
});
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>