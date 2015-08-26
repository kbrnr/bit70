<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>


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
                  <h3 class="box-title">■${domain} 인원</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                  	
                  	
                  	<div class="row">
						<div class="col-sm-12">
	                   			<a href="/${domain}/course/joinmemberlist?searchType=mem_gb&keyword=member_teacher" class=" pull-right margin-bottom">선생님</a>
	 							<p class=" pull-right margin-bottom">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>                 	
	                  			<a href="/${domain}/course/joinmemberlist?searchType=mem_gb&keyword=member_student" class=" pull-right margin-bottom">학생</a>
		                </div>
	                  	                  	
	                  	<div class="col-sm-12">
	                  
		                  <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		                    <thead>
		                      <tr role="row">
		                      	  <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 109px;">아이디</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">이름</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 129px;">이메일</th>
			                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 92px;">전화번호</th>
			                      <c:if test="${isTeacher}">
			                      	<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">가입상태(승인전0, 승인요청1, 가입완료2, 정지3)</th>			                   
		                          </c:if>
		                          <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">구분</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                      <c:forEach items="${list}" var="vo">
			                    <tr role="row">
			                      <td class="userid">${vo.mem_id}</td>
			                      <td>${vo.mem_name}</td>
			                      <td>${vo.mem_email}</td>
			                      <td>${vo.mem_tel}</td>
			                      <c:if test="${isTeacher}">
			                      	<td class="joincourse"><a href=#>[ ${vo.course_state} ]</a></td>
			                      </c:if>
			                      <td>${vo.course_gb}</td>
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
                  							<li class="paginate_button previous" id="example1_previous"><a href="/${domain}/course/joinmemberlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/${domain}/course/joinmemberlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				  
                  				  <!-- 페이징 -->
                  				  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li <c:out value = "${pageMaker.page==idx?'class=active' :'' }"/>>
										<c:if test="${cri.searchType == null && cri.keyword == null }">
											<a href="/${domain}/course/joinmemberlist?page=${idx }&perPageNum=${pageMaker.perPageNum}">${idx }</a>
										</c:if>
										<c:if test="${cri.searchType != null && cri.keyword != null }">
											<a href="/${domain}/course/joinmemberlist?page=${idx }&perPageNum=${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
										</c:if>
									</li>
                  				  </c:forEach>
								  
								  <!--다음페이지 -->
								  <c:if test="${pageMaker.next}">
                  						<c:if test="${cri.searchType == null && cri.keyword == null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/${domain}/course/joinmemberlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  		<c:if test="${cri.searchType != null && cri.keyword != null }">
                  							<li class="paginate_button previous" id="example1_previous"><a href="/${domain}/course/joinmemberlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}" aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
                  				  		</c:if>
                  				  </c:if>
                  				</ul>
                  			</div>

                  			
                  			<form name="searchFrom" action="/${domain}/course/joinmemberlist" method="get">
								<div id="select_board" class="text-center" >
									<select name="searchType" class="form-control" style="width: 150px; margin-right: 10px;">
										<option value="id" <c:out value="${cri.searchType == 'id'?'selected':'' }" />>
										아이디
										</option>	
										<option value="name" <c:out value="${cri.searchType == 'name'?'selected':'' }" />>
										성명	
										</option>
										<option value="mem_gb" <c:out value="${cri.searchType == 'mem_gb'?'selected':'' }" />>
										구분
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
		<!-- /.content -->


<script>

/*-------수업승인하기---------*/
$(".joincourse").on("click", function() {
	event.preventDefault();
	$this=$(this);
	console.log($this);
	console.log($this.siblings("td.userid").text());
	console.log("${domain}");

	
	var url = '/${domain}/course/joinclassOK';
	$.ajax({
		type : 'PUT',
		url : url ,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data : JSON.stringify({
				mem_id: $this.siblings("td.userid").text(),
				clz_domain: "${domain}"
				}),
		success : function(result) {
			alert("승인완료")
			$this.text("[2]")
		}
		
	});
	
	
});
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>