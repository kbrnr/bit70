<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

.teacherul {
    margin: 0px;
    padding-left: 0px;
	float: left;
}

.teacherli { 
	width:130px; 
	float:left; 
	margin:5px; 
	display:inline; 
}

.td-domain {
	font-size: 18px;
	font-weight: bold;>
}

.space {
	height:50px; 
}



</style>


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
                <div class="box-header with-border">
                	<span><h3 class="box-title">■선생님리스트</h3></span>
                  	<span class=" pull-right">
	                  	<div class="col-sm-12">
			                <a href="/membership/teacherlist" class=" pull-right "><b>선생님리스트</b></a>
			 					<p class=" pull-right">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>                 	
				            <a href="/classinfo/classlist" class=" pull-right">수업리스트 </a>
			            </div>
                  	</span>
                </div><!-- /.box-header -->
                
                
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
                  	
	                  	<div class="col-sm-12">
	                  
		                  <table id="example1" class="table table-hover" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th >성명</th>
			                      <th >아이디</th>
			                      <th >가입일</th>
			                      <th >이메일</th>
			                      <th width="120px">연락처</th>			                   
		                      	  <th >구분</th>		
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td>${vo.mem_name}</td>
			                      <td>${vo.mem_id}</td>
			                      <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.mem_reg_date}"/></td>
			                      <td>${vo.mem_email}</td>
			                      <td >${vo.mem_tel}</td>
			                      <td>${vo.mem_gb}</td>
			                    </tr>
		                      </c:forEach>
		                    </tbody>
		                  </table>
		                  
	                  	</div><!-- /.grid -->
	                  	
                  	</div><!-- /.row -->
                  	<div class="box-footer">
                  	<div class="row">
            		
                  		<div class="col-sm-12">
                  			<div class="dataTables_paginate paging_simple_numbers text-center" id="example1_paginate">
                  				<ul class="pagination">
								  <!--이전페이지 -->	
                  				  <c:if test="${pageMaker.prev}">
                  				  		<c:if test="${cri.searchType == null && cri.keyword == null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/membership/teacherlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/membership/teacherlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				  
                  				  <!-- 페이징 -->
                  				  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li <c:out value = "${pageMaker.page==idx?'class=active' :'' }"/>>
										<c:if test="${cri.searchType == null && cri.keyword == null }">
											<a href="/membership/teacherlist?page=${idx }&perPageNum=${pageMaker.perPageNum}">${idx }</a>
										</c:if>
										<c:if test="${cri.searchType != null && cri.keyword != null }">
											<a href="/membership/teacherlist?page=${idx }&perPageNum=${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
										</c:if>
									</li>
                  				  </c:forEach>
								  
								  <!--다음페이지 -->
								  <c:if test="${pageMaker.next}">
                  						<c:if test="${cri.searchType == null && cri.keyword == null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/membership/teacherlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/membership/teacherlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				</ul>
                  			</div>

                  			
                  			<form name="searchFrom" action="/membership/teacherlist" method="get">
								<div id="select_board" class="text-center" >
									<select name="searchType" class="form-control" style="width: 150px; margin-right: 10px;">
										<option value="id" <c:out value="${cri.searchType == 'id'?'selected':'' }" />>
										아이디
										</option>	
										<option value="name" <c:out value="${cri.searchType == 'name'?'selected':'' }" />>
										성명	
										</option>
									</select>
									<div class="input-group">
	   								   <input type="text" class="form-control" name="keyword" value="${cri.keyword}" style="width: 200px;">
									      <span class="input-group-btn">
									        <button class="btn btn-default" type="Submit">검색</button>
									      </span>
			                 	 	</div><!-- /input-group -->
								</div>
							</form>
                  			
                  			<div class="space"></div>
                  		</div>
                  	</div><!-- /.grid -->
                  	</div><!-- /.row -->
                  	
                  	
                  	
                  	
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
			
		</section>
		<!-- /.content -->



<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>