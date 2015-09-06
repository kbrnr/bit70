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
    padding-left: 0px;
	float: left;
}

.teacherli { 
	width:130px; 
	float:left; 
	margin:5px; 
	display:inline; 
	margin: 0px 5px 0px 5px;
}

.td-domain {
	font-size: 18px;
	font-weight: bold;>
}

.space {
	height:50px; 
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
                <div class="box-header with-border">
                  <h3 class="box-title">■전체수업리스트</h3>
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
						<c:if test="${isStudent}">
	                  		<div class="col-sm-12">
	                   			<a href="/classinfo/sclasslistjoin" class=" pull-right margin-bottom"> 전체수업리스트 </a>
	 							<p class=" pull-right margin-bottom">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>                 	
	                  			<a href="/classinfo/myclasslist" class=" pull-right margin-bottom">나의수업리스트 </a>
		                  	</div>
						</c:if>
	                  	
	                  	<div class="col-sm-12">
		        		  
		                  <table id="example1" class="table table-hover" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th width="250px">강의명</th>
			                      <th width="150px">선생님</th>
			                      <th width="90px">강의실</th>
			                      <th width="120px">시작일</th>
			                      <th width="120px">종료일</th>			                   
			                      <th width="110px">수업상태</th>
			                      <th>주소</th>
								  <th width="110px">승인여부</th>		                     
							 </tr>
		                    </thead>
		                    
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td class="td-left"><a href="/classinfo/classread?domain=${vo.clz_domain}">${vo.clz_name}</a></td>
			                      <td class="td-left">
			                      	<c:forEach items="${vo.teacherlist}" var="teacherlist">
			                      		${teacherlist.mem_name}(${teacherlist.mem_id})<br> 
			                        </c:forEach>
			                      </td>
			                      <td>${vo.clz_room}</td>
			                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_start_date}"/></td>
			                      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_end_date}"/></td>
			                      <td>
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
			                      			일시정지
			                      		</c:when>
			                      </c:choose>
			                      </td>
			                      <td class="td-left"><a href="/${vo.clz_domain}">http://www.focus.com/<span class="td-domain">${vo.clz_domain}</span></a></td>
			                       <td>
			                      <c:choose>
			                      		<c:when test="${vo.course_state=='0'}">
			                      			미가입
			                      		</c:when>
			                      		<c:when test="${vo.course_state=='1'}">
			                      			승인대기
			                      		</c:when>
			                      		<c:when test="${vo.course_state=='2'}">
			                      			승인완료
			                      		</c:when>
			                      		<c:when test="${vo.course_state=='3'}">
			                      			정지
			                      		</c:when>
			                      </c:choose>
			                      </td>
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
								  <!--이전페이지 -->	
                  				  <c:if test="${pageMaker.prev}">
                  				  		<c:if test="${cri.searchType == null && cri.keyword == null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/sclasslistjoin?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/sclasslistjoin?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				  
                  				  <!-- 페이징 -->
                  				  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li <c:out value = "${pageMaker.page==idx?'class=active' :'' }"/>>
										<c:if test="${cri.searchType == null && cri.keyword == null }">
											<a href="/classinfo/sclasslistjoin?page=${idx }&perPageNum=${pageMaker.perPageNum}">${idx }</a>
										</c:if>
										<c:if test="${cri.searchType != null && cri.keyword != null }">
											<a href="/classinfo/sclasslistjoin?page=${idx }&perPageNum=${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
										</c:if>
									</li>
                  				  </c:forEach>
								  
								  <!--다음페이지 -->
								  <c:if test="${pageMaker.next}">
                  						<c:if test="${cri.searchType == null && cri.keyword == null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/sclasslistjoin?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/classinfo/sclasslistjoin?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				</ul>
                  			</div>
                  			
                  			<form name="searchFrom" action="/classinfo/sclasslistjoin" method="get">
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
                  	
 
   
   
      
                  	
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
	</section>






<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
