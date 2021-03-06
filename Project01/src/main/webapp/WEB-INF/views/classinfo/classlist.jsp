<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

th {
		text-align: center;
		vertical-align: middle;
		background-color: #F7D62D ;
}
	
td {
	text-align: center;
}

.td-left {
	text-align: left;
}

.teacherul {
    padding-left: 0px;
	float: left;
}

.teacherli { 
	width:80px; 
	float:left; 
	display:inline; 
	margin: 0px 5px 0px 0px;
}

.td-domain {
	font-size: 18px;
	font-weight: bold;>
}

.space {
	height:50px; 
}

.v-middle {
	vertical-align: middle;
}

</style>

		<section class="content-header">
			<h1>
				 <small></small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">
						<i class="fa fa-fw fa-home"></i> Home
					</a></li>
				<li class="active">수업관리</li>
			</ol>
		</section>



		<!-- Main content -->
		<section class="content">
		<!-- ----------------------------------------- -->
		<div class="box">
				<div class="box-header with-border">
                	<span><h3 class="box-title"><i class="fa fa-fw fa-tasks"></i>수업리스트</h3></span>
                  	<span class="pull-right">
	                  	<div class="col-sm-12">
			                <a href="/membership/teacherlist" class=" pull-right ">선생님관리</a>
			 					<p class=" pull-right">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>                 	
				            <a href="/classinfo/classlist" class=" pull-right"><b>수업관리</b> </a>
			            </div>
                  	</span>
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
	                  	<div class="col-sm-12"><a href="/classinfo/classform" class="btn btn-primary pull-right margin-bottom">수업등록</a>
	                  	</div>
	                  	<div class="col-sm-12">
		        		  
		                  <table id="example1" class="table table-hover" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th width="250px" class="td-left">강의명</th>
			                      <th width="80px" class="td-left">선생님</th>
			                      <th width="100px">강의실</th>
			                      <th width="120px">시작일</th>
			                      <th width="120px">종료일</th>			                   
			                      <th width="100px">상태</th>
			                      <th width="100px">주소</th>
		                      </tr>
		                    </thead>
		                    
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td class="td-left"><a href="/classinfo/classread?domain=${vo.clz_domain}">${vo.clz_name}</a></td>
			                      <td class="td-left">
			                      	<ul class="teacherul">
			                      	<c:forEach items="${vo.teacherlist}" var="teacherlist">
			                      		<li class="teacherli">${teacherlist.mem_name}</li>
			                        </c:forEach>
			                        </ul>
			                      </td>
			                      <td >${vo.clz_room}</td>
			                      <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_start_date}"/></td>
			                      <td ><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_end_date}"/></td>
			                      <td >
			                      	<c:choose>
			                      		<c:when test="${vo.clz_state=='1'}">
			                      			준비중
			                      		</c:when>
			                      		<c:when test="${vo.clz_state=='2'}">
			                      			강의중
			                      		</c:when>
			                      		<c:when test="${vo.clz_state=='3'}">
			                      			종료
			                      		</c:when>
			                      		<c:when test="${vo.clz_state=='4'}">
			                      			정지
			                      		</c:when>
			                      	</c:choose>
			                      <td class="td-left"><a href="/${vo.clz_domain}" target=_blank><span class="td-domain">${vo.clz_domain}</span></a></td>
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
	                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/classlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
	                  				  		</c:if>
	                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
	                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/classlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
	                  				  		</c:if>
	                  				  </c:if>
	                  				  
	                  				  <!-- 페이징 -->
	                  				  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
										<li <c:out value = "${pageMaker.page==idx?'class=active' :'' }"/>>
											<c:if test="${cri.searchType == null && cri.keyword == null }">
												<a href="/classinfo/classlist?page=${idx }&perPageNum=${pageMaker.perPageNum}">${idx }</a>
											</c:if>
											<c:if test="${cri.searchType != null && cri.keyword != null }">
												<a href="/classinfo/classlist?page=${idx }&perPageNum=${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
											</c:if>
										</li>
	                  				  </c:forEach>
									  
									  <!--다음페이지 -->
									  <c:if test="${pageMaker.next}">
	                  						<c:if test="${cri.searchType == null && cri.keyword == null }">
	                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/classlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
	                  				  		</c:if>
	                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
	                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/classlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
	                  				  		</c:if>
	                  				  </c:if>
	                  				</ul>
	                  			</div>
	                  			
	                  			<form name="searchFrom" action="/classinfo/classlist" method="get">
									<div id="select_board" class="text-center" >
										<select name="searchType" class="form-control" style="width: 150px; margin-right: 10px;">
											<option value="className" <c:out value="${cri.searchType == 'className'?'selected':'' }" />>
											강의명
											</option>	
											<option value="domain" <c:out value="${cri.searchType == 'domain'?'selected':'' }" />>
											도메인(주소)	
											</option>
											<option value="state" <c:out value="${cri.searchType == 'state'?'selected':'' }" />>
											상태	
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
	                  		</div><!-- /.grid -->
	                  	</div><!-- /.row -->
                  	</div>
 
   
   
      
                  	
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
	</section>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
