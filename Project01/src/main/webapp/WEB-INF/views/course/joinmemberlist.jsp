<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>


<style>
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

.space {
	height:50px; 
}


.boxShake {
   animation-name: boxShake;
   animation: animationFrames linear 0.7s;
}

@keyframes shake {
    from, to {
        transform: translate3d(0, 0, 0);
    }

    10%, 30%, 50%, 70%, 90% {
        transform: translate3d(-10px, 0, 0);
    }

    20%, 40%, 60%, 80% {
        transform: translate3d(10px, 0, 0);
    }
}

.shake {
    animation-name: shake;
}


</style>



<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Top Navigation <small>Example 2.0</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"> <i class="fa fa-dashboard"></i> Home
		</a></li>
		<li class="active">Dashboard</li>
	</ol>
</section>



<!-- Main content -->
<section class="content">
	<!-- ----------------------------------------- -->


	<div class="box box-solid">

		<div class="box-body">



			<div id="example1_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap">


				<div class="row">
					<div class="col-sm-12">
						<a href="/${domain}/course/joinmemberlist?searchType=mem_gb&keyword=member_teacher" class=" pull-right margin-bottom">선생님</a>
						<p class=" pull-right margin-bottom">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
						<a href="/${domain}/course/joinmemberlist?searchType=mem_gb&keyword=member_student" class=" pull-right margin-bottom">학생</a>
					</div>


					<!-- -- -->
					<c:forEach items="${list}" var="vo">  
					<div class="col-sm-3 boxShake">
						<!-- Widget: user widget style 1 -->
						<div class="box box-widget widget-user-2 ">
							<!-- Add the bg color to the header using any of the bg-* classes -->
							<div class="bg-userimg widget-user-header">
								<div class="widget-user-image">
									<img class="img-circle" src="/resources/dist/img/user7-128x128.jpg" alt="User Avatar">
									<!--  <img class='img-circle' src='/${domain}/seat/seatImg?userId=${vo.mem_id}' onerror="javascript:this.src='/resources/nojo/images/noImage.png" alt='User Avatar'>-->
								</div>
								<!-- /.widget-user-image -->
								<h3 class="widget-user-username">${vo.mem_name}</h3>
								<h5 class="widget-user-desc">${vo.mem_id}</h5>
							</div>
							<div class="box-footer no-padding">
								<ul class="nav nav-stacked">
									<li class="info">메일 <span class="pull-right badge bg-blue">${vo.mem_email}</span></li>
									<li class="info">전화 <span class="pull-right badge bg-aqua">${vo.mem_tel}</span></li>
									<li class="info">구분 <span class="pull-right badge bg-green">${vo.course_gb}</span></li>
									<c:if test="${vo.course_state == 1}">
										<li class="text-center info ahand shake"><span class="badge bg-red joincourse" data-userid="${vo.mem_id}" >승인요청</span></li>
									</c:if>
									<c:if test="${vo.course_state != 1}">
										<li class="text-center info"><span class="badge bg-gray">승인완료</span></li>
									</c:if>
								</ul>
							</div>
						</div>
						<!-- /.widget-user -->
					</div>
					</c:forEach>
					<!-- /.col -->
				</div>
				<!-- /.row -->



					<!-- -- -->





					<div class="row">

						<div class="col-sm-12">
							<div
								class="dataTables_paginate paging_simple_numbers text-center"
								id="example1_paginate">
								<ul class="pagination">
									<!--이전페이지 -->
									<c:if test="${pageMaker.prev}">
										<c:if test="${cri.searchType == null && cri.keyword == null }">
											<li class="paginate_button previous" id="example1_previous"><a
												href="/${domain}/course/joinmemberlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}"
												aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
										</c:if>
										<c:if test="${cri.searchType != null && cri.keyword != null }">
											<li class="paginate_button previous" id="example1_previous"><a
												href="/${domain}/course/joinmemberlist?page=${pageMaker.startPage-1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"
												aria-controls="example1" data-dt-idx="0" tabindex="0">Previous</a></li>
										</c:if>
									</c:if>

									<!-- 페이징 -->
									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value = "${pageMaker.page==idx?'class=active' :'' }"/>>
											<c:if
												test="${cri.searchType == null && cri.keyword == null }">
												<a
													href="/${domain}/course/joinmemberlist?page=${idx }&perPageNum=${pageMaker.perPageNum}">${idx }</a>
											</c:if> <c:if
												test="${cri.searchType != null && cri.keyword != null }">
												<a
													href="/${domain}/course/joinmemberlist?page=${idx }&perPageNum=${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a>
											</c:if>
										</li>
									</c:forEach>

									<!--다음페이지 -->
									<c:if test="${pageMaker.next}">
										<c:if test="${cri.searchType == null && cri.keyword == null }">
											<li class="paginate_button previous" id="example1_previous"><a
												href="/${domain}/course/joinmemberlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}"
												aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
										</c:if>
										<c:if test="${cri.searchType != null && cri.keyword != null }">
											<li class="paginate_button previous" id="example1_previous"><a
												href="/${domain}/course/joinmemberlist?page=${pageMaker.endPage+1}&perPageNum${pageMaker.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"
												aria-controls="example1" data-dt-idx="0" tabindex="0">Next</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>


							<form name="searchFrom" action="/${domain}/course/joinmemberlist"
								method="get">
								<div id="select_board" class="text-center">
									<select name="searchType" class="form-control"
										style="width: 150px; margin-right: 10px;">
										<option value="id"
											<c:out value="${cri.searchType == 'id'?'selected':'' }" />>
											아이디</option>
										<option value="name"
											<c:out value="${cri.searchType == 'name'?'selected':'' }" />>
											성명</option>
										<option value="mem_gb"
											<c:out value="${cri.searchType == 'mem_gb'?'selected':'' }" />>
											구분</option>
									</select>
									<div class="input-group">
										<input type="text" class="form-control" name="keyword"
											value="${cri.keyword}" style="width: 200px;"> <span
											class="input-group-btn">
											<button class="btn btn-default" type="Submit">검색</button>
										</span>
									</div>
									<!-- /input-group -->
								</div>
							</form>

	                  			<div class="space"></div>

						</div>
						<!-- /.grid -->
					</div>
					<!-- /.row -->

		
				</div>
				<!-- /.example1_wrapper -->
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->

		<!-- ----------------------------------------- -->
</section>
<!-- /.content -->


<script>
	/*-------수업승인하기---------*/
	$(".joincourse").on("click", function() {
		$this = $(this);
		console.log($this);
		console.log($this.data("userid"));
		console.log("${domain}");

		var url = '/${domain}/course/joinclassOK';
		$.ajax({
			type : 'PUT',
			url : url,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				mem_id : $this.data("userid"),
				clz_domain : "${domain}"
			}),
			success : function(result) {
				$this.parent().html("<span class='badge bg-gray'>승인완료</span>")
			}

		});
				
	});
	
	
	
	
    function animate(target, className, visible) {
        target.show();
        target.addClass(className).one('animationend', function () {
            target.removeClass(className);
            if (!visible) {
                target.hide();
            }
        });
    }
   
    $(".shake").on("click", function(){
        animate($(this).parents(":nth(3)"),"shake", true);
    });	
</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>