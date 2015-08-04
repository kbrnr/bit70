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
                  <h3 class="box-title">Data Table With Full Features</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	<div class="row">	
                  		<div class="col-sm-6">
                  			<div class="dataTables_length" id="example1_length">
                  				<label>Show 
	                  				<select name="example1_length" aria-controls="example1" class="form-control input-sm">
	                  				<option value="10">10</option>
	                  				<option value="25">25</option>
	                  				<option value="50">50</option>
	                  				<option value="100">100</option>
	                  				</select>
                  				entries</label>
                  			</div><!-- /.grid -->
                  		</div>
                  		
                  		<div class="col-sm-6">
                  			<div id="example1_filter" class="dataTables_filter">
                  				<label>Search:
                  					<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1">
                  				</label>
                  			</div>
                  		</div><!-- /.grid -->
                  		
                  	</div><!-- /.row -->
                  	
                  	<div class="row">
                  	
	                  	<div class="col-sm-12">
	                  
		                  <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 109px;">아이디</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">성명</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 129px;">가입일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 92px;">이메일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">연락처</th>			                   
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <tr role="row" class="odd">
		                        <td class="sorting_1">Gecko</td>
		                        <td>Firefox 1.0</td>
		                        <td>Win 98+ / OSX.2+</td>
		                        <td>1.7</td>
		                        <td>A</td>
		                      </tr>
		                      <tr role="row" class="even">
		                        <td class="sorting_1">Gecko</td>
		                        <td>Firefox 1.5</td>
		                        <td>Win 98+ / OSX.2+</td>
		                        <td>1.8</td>
		                        <td>A</td>
		                      </tr>
		                    </tbody>
		                  </table>
		                  
	                  	</div><!-- /.grid -->
	                  	
                  	</div><!-- /.row -->
                  	
                  	<div class="row">
                  		<div class="col-sm-5">
                  			<div class="dataTables_info" id="example1_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
                  		</div><!-- /.grid -->
                  		
                  		<div class="col-sm-7">
                  			<div class="dataTables_paginate paging_simple_numbers" id="example1_paginate">
                  				<ul class="pagination">
                  					<li class="paginate_button previous disabled" id="example1_previous"><a href="#" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  					<li class="paginate_button active"><a href="#" aria-controls="example1" data-dt-idx="1" tabindex="0">1</a></li>
                  					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="2" tabindex="0">2</a></li>
                  					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="3" tabindex="0">3</a></li>
                  					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="4" tabindex="0">4</a></li>
                  					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="5" tabindex="0">5</a></li>
                  					<li class="paginate_button "><a href="#" aria-controls="example1" data-dt-idx="6" tabindex="0">6</a></li>
                  					<li class="paginate_button next" id="example1_next"><a href="#" aria-controls="example1" data-dt-idx="7" tabindex="0">Next</a></li>
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