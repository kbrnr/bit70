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
		                      	 <th>&nbsp;</th>
		                      	 <c:forEach items="${tqscorelist[0].scorelist}" var="namelist">
			                     	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">
			                     	(${namelist.mem_id})${namelist.mem_name}
			                     	</th>
			                     </c:forEach>
			                  </tr>
							</thead>
							<tbody>							  
  								<c:forEach items="${tqscorelist}" var="tqlist" varStatus="status">
							  <tr>
							  	<td>(${tqlist.teacherquestion_no})${tqlist.teacherquestion_content}
							  	</td>
							  		<c:forEach items="${tqlist.scorelist}" var="scorelist">
								  		<c:if test = "${scorelist.comprehension_score == 0}">
									  		<td>&nbsp;
									  		</td>
								  		</c:if>
							  			<c:if test = "${scorelist.comprehension_score != 0}">
							  		 		<td>(${scorelist.teacherquestion_no})(${scorelist.mem_id})${scorelist.comprehension_score}
							  		 		</td>
							  			</c:if>
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

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>