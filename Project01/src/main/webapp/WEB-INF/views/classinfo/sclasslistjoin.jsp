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
                  <h3 class="box-title">■수업리스트</h3>
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
		        		  
		                  <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 109px;">강의명</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">선생님</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 129px;">강의실</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 92px;">시작일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">종료일</th>			                   
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">수업상태(준비중1,강의중2,종료3,일시정지4)</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">주소</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">가입여부(승인전0, 승인요청1, 가입완료2, 정지3)</th>
		                      </tr>
		                    </thead>
		                    
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td><a href="/classinfo/classread?domain=${vo.clz_domain}">${vo.clz_name}</a></td>
			                      <td>
			                      	<c:forEach items="${vo.teacherlist}" var="teacherlist">
			                      		${teacherlist.mem_name}(${teacherlist.mem_id})<br> 
			                        </c:forEach>
			                      </td>
			                      <td>${vo.clz_room}</td>
			                      <td>${vo.clz_start_date}</td>
			                      <td>${vo.clz_end_date}</td>
			                      <td>${vo.clz_state}</td>
			                      <td class="domain"><a href="/${vo.clz_domain}" target=_blank>${vo.clz_domain}</a></td>
			                      <td ><a href="/classinfo/joinform?domain=${vo.clz_domain}">[${vo.course_state}]</a></td>
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
                  			
                  			
                  		</div><!-- /.grid -->
                  	</div><!-- /.row -->
                  	
 
   
   
      
                  	
                    	
                  </div><!-- /.example1_wrapper -->
                </div><!-- /.box-body -->
		</div><!-- /.box -->
		
		<!-- ----------------------------------------- -->
	</section>






<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
