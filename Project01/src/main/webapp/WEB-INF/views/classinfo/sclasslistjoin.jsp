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
	height:10px; 
}

.badge{
	font-size: 13px;
}

.widget-user-header {
	padding : 10px 10px 10px 20px ;
}

.bg-userimg{
	background-image:url(/resources/nojo/images/namecardbg.jpg);
}



.info {
	padding : 5px 15px 5px 15px ;
}

.box {
	border: solid 1px #d2d6de ;
}

.ahand { cursor: pointer; }


.padding_zero {
	padding: 0px 0px 0px 0px;
}

.padding_right {
	padding: 0px 15px 0px 0px;
}

.padding_search {
	padding: 0px 0px 20px 0px;
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

<div class="box">
<!-- ----------------------------------------- -->


	<div class="box-header with-border">
	  <h3 class="box-title">■마이페이지 </h3>
	</div><!-- /.box-header -->
              
    <div class="box-body">
                		
		<div class="col-sm-3 padding_right">
   			<div class="col-sm-12 padding_zero">
   			<P>나의 프로필</p>
				<div class="box box-widget widget-user-2 ">
					
					
					
					<div class="bg-userimg widget-user-header">
						<div class="widget-user-image">
							<img class="img-circle" src="/membership/profileImg?userId=${user.id}" onerror='imgError(this);'" width="100px" height="100px" alt="User Avatar">
							<!--  <img class='img-circle' src='/${domain}/seat/seatImg?userId=${vo.mem_id}' onerror="javascript:this.src='/resources/nojo/images/noImage.png" alt='User Avatar'>-->
						</div>
					
						<h3 class="widget-user-username">${user.name}</h3>
						<h5 class="widget-user-desc">${user.id}</h5>
					</div>
					<div class="box-footer no-padding">
						<ul class="nav nav-stacked">
							<li class="info">메일 <span class="pull-right badge bg-blue">${user.email}</span></li>
							<li class="info">전화 <span class="pull-right badge bg-aqua">${user.tel}</span></li>
							<li class="text-center info"><a href="/membership/profile"><span class="badge bg-gray">개인정보수정</span></a></li>
						</ul>
					</div>
					
					
				</div><!-- /.box -->
   			</div>
              
		</div><!-- /.col-sm-3 -->
                
                			
        <div class="col-sm-9 ">
   			<div class="col-sm-12">
   			<P>나의 수업</p>
   			<!-- - -->
				<div class="row">
					<c:forEach items="${mylist}" var="vo">
				
		            <div class="col-md-4">
		              <div class="box box-widget">
		                <div class="box-header with-border">
		                  <i class="fa fa-text-width"></i>
		                  <h3 class="box-title">${vo.clz_name}</h3>
		                </div><!-- /.box-header -->
		                <div class="box-body no-padding">
				                 <table class="table td-left">
				                    <tr>
				                      <td class="td-left">선생님</td>
				                      <td class="td-left">
				                      	<c:forEach items="${vo.teacherlist}" var="teacherlist">
			                      			${teacherlist.mem_name}(${teacherlist.mem_id})<br> 
			                        	</c:forEach>
			                          </td>
				                    </tr>
				                    <tr>
				                      <td class="td-left">강의실</td>
				                      <td class="td-left">${vo.clz_room}</td>
				                    </tr>
				                    <tr>
				                      <td class="td-left">시작일</td>
				                      <td class="td-left"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_start_date}"/></td>
				                    </tr>
				                  	<tr>
				                      <td class="td-left">종료일</td>
				                      <td class="td-left"><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.clz_end_date}"/>e</td>
				                    </tr>
				                    <tr>
				                      <td class="td-left">상태</td>
				                      <td class="td-left">
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
				                    </tr>
				                    <tr>
				                      <td class="td-left">도메인</td>
				                      <td class="td-left"><a href="/${vo.clz_domain}" target=_blank><span class="td-domain">${vo.clz_domain}</span></a></td>
				                    </tr>
				                   </table> 
		                </div><!-- /.box-body -->
		              </div><!-- /.box -->
		            </div><!-- ./col -->
		            
					</c:forEach>
				
				
		
			          
			          </div>
   				
   				
   				
   				
			<hr>
   			<!-- - -->
   			
            </div><!-- /.col-sm-12 -->    			
     

   			

           		
       		<div class="col-sm-12 ">
				<div class="padding_search" >
					<span>전체수업</span>
					<span class=" pull-right">
						<form name="searchFrom" action="/classinfo/sclasslistjoin" method="get">
								<div id="select_board" class="form-inline" >
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
					</span>
	
				</div>
			
	          	
				
			

				<table id="example1" class="table table-hover" role="grid" aria-describedby="example1_info">
				<thead>
					<tr role="row">
						<th width="250px">강의명</th>
						<th width="150px">선생님</th>
						<th width="90px">강의실</th>
						<th width="120px">시작일</th>
						<th width="120px">종료일</th>			                   
						<th width="110px">상태</th>
						<th>수강신청</th>
					</tr>
				</thead>
				               
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr role="row">
				  			<td class="td-left"><a href="/classinfo/classread?domain=${vo.clz_domain}">${vo.clz_name}</a></td>
							<td class="td-left">
								<c:forEach items="${vo.teacherlist}" var="teacherlist">
									${teacherlist.mem_name}<br> 
								</c:forEach>
							</td>
							<td>${vo.clz_room}</td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${vo.clz_start_date}"/></td>
							<td><fmt:formatDate pattern="yy-MM-dd" value="${vo.clz_end_date}"/></td>
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
				
						</tr>
				 	</c:forEach>
				</tbody>
				</table>
				<hr>
	
			</div><!-- /.col-sm-12 -->  
       		 
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
	          			

	           	
	           	<div class="space"></div>
                  			

			</div><!-- /.col-sm-12  -->
                		
        </div><!-- /.col-sm-9  -->
                	
   
                		
                  	

	</div><!-- /.box-body -->

<!-- ----------------------------------------- -->

</div><!-- /.box -->

</section>


<script>
	//seat 이미지 on 이벤트
	function imgError(image) {
	image.onerror = "";
	image.src = "/resources/nojo/images/noImage.png";
	return true;
	}
</script>



<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
