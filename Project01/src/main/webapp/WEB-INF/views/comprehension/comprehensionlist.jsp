<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

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
		                  <table class="table table-hover">
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
							  	<td>${tqlist.teacherquestion_content}</td>
							  	
							  	<c:forEach items="${tqlist.scorelist}" var="scorelist">
								
								<c:choose>
									
									<c:when test="${scorelist.comprehension_score >= 9}">
										<td><p class="lead"><span class="label label-success">${scorelist.comprehension_score}</span></p></td>
									</c:when>
									
									<c:when test="${scorelist.comprehension_score >= 7}">
										<td><p class="lead "><span class="label label-info">${scorelist.comprehension_score}</span></p></td>
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
										<td >&nbsp;</td>
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

<script>
$(".btn").on('click', function(){
	parent.$("#myModal [name=teacherquestion_no]").val($(this).data("qno"));
	parent.$("#myModal").modal("show");		
});

</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>