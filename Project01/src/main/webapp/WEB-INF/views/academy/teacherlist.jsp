<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<!-- Full Width Column -->
<div class="content-wrapper">
	<div class="container">
		<!-- Content Header (Page header) -->
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
                  <h3 class="box-title">■선생님리스트</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
                  	
	                  	<div class="col-sm-12">
	                  
		                  <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 109px;">아이디</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">성명</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 129px;">가입일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 92px;">이메일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">연락처</th>			                   
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td>${vo.mem_id}</td>
			                      <td>${vo.mem_name}</td>
			                      <td>${vo.mem_reg_date}</td>
			                      <td>${vo.mem_email}</td>
			                      <td>${vo.mem_tel}</td>
			                    </tr>
		                      </c:forEach>
		                    </tbody>
		                  </table>
		                  
	                  	</div><!-- /.grid -->
	                  	
                  	</div><!-- /.row -->
                  	
                  	<div class="row">
            		
                  		<div class="col-sm-12">
                  			<div class="dataTables_paginate paging_simple_numbers text-center" id="example1_paginate">
                  				<ul class="pagination">
                  				  <c:if test="${pageMaker.prev}">
                  					<li class="paginate_button previous" id="example1_previous"><a href="teacherlist?page=${pageMaker.startPage-1}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  </c:if>
                  				  
                  				  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                  					<li ${pageMaker.page==idx? "class='paginate_button active'":"class='paginate_button'"}> 
									  <a href="teacherlist?page=${idx}&perPageNum=${pageMaker.perPageNum}&searchOPT=${searchOPT}&keyword=${keyword}">${idx}</a>
                  					</li>
                  				  </c:forEach>
								  
								  <c:if test="${pageMaker.next}">
                  					<li class="paginate_button next" id="example1_next"><a href="teacherlist?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>
                  				  </c:if>
                  				</ul>
                  			</div>
                  		</div><!-- /.grid -->
                  	</div><!-- /.row -->
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
			
		</section>
		<!-- /.content -->



	</div>
	<!-- /.container -->
</div>
<!-- /.content-wrapper -->

<%@include file="/WEB-INF/views/include/footer.jsp"%>