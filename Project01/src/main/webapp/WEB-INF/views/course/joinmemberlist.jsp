<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<style>

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
	                  	 
	              <c:forEach items="${list}" var="vo">    	 
          <div class="col-md-3">
              <!-- Widget: user widget style 1 -->
              <div class="box box-widget widget-user-2">
                <!-- Add the bg color to the header using any of the bg-* classes -->
                <div class="widget-user-header bg-aqua-active">
                  <div class="widget-user-image">
                    <img class="img-circle" src="/resources/dist/img/user7-128x128.jpg" alt="User Avatar">
                  </div><!-- /.widget-user-image -->
                  <h3 class="widget-user-username">${vo.mem_name}</h3>
                  <h5 class="widget-user-desc">Lead Developer</h5>
                </div>
                <div class="box-footer no-padding">
                  <ul class="nav nav-stacked">
                    <li>email<span class="pull-right badge bg-blue">${vo.mem_email}</span></li>
                    <li>${vo.mem_tel}<span class="pull-right badge bg-aqua">5</span></li>
                    <li>${vo.course_gb}<span class="pull-right badge bg-green">12</span></li>
                    <c:if test="${isTeacher}">
			        	<li class="joincourse"><a href="#">[ ${vo.course_state} ]<span class="pull-right badge bg-red">842</span></a></li>
			        </c:if>
                    
                    
                  </ul>
                </div>
              </div><!-- /.widget-user -->
            </div><!-- /.col -->
	                  	  </c:forEach>
	                  	 
	                  	 
	                  	 
	                  	 
	                  	 
	                  	 
	                  	 
	                  	 
	   
                  	
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