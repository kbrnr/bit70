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
	                  	<div class="table-responsive">
		                  <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	 <th>이해도질문</th>
			                     <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">
			                     	${user.id} 이해도
			                     </th>
			                     <th>그래프</th>
			                   
			                  </tr>
							</thead>
							<tbody>							  
  							<c:forEach items="${scorelist}" var="tqlist">
							  <tr>
							  	<td>(${tqlist.teacherquestion_no})${tqlist.teacherquestion_content}
							  	</td>
								
								<c:if test = "${tqlist.comprehension_score == 0}">
									<td>&nbsp;
									</td>
									<td>&nbsp;
									</td>
									
								</c:if>
							  	<c:if test = "${tqlist.comprehension_score != 0}">
								  	<td>(${tqlist.teacherquestion_no})(${tqlist.mem_id})${tqlist.comprehension_score}
								  	</td>
								  	<td><div class="progress progress-xs progress-striped active">
                          					<div class="progress-bar progress-bar-success" style="width: 90%;"></div>
							  		</td>
							  		
							  	</c:if>
							  		
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

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>