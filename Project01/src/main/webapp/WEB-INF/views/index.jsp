<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">

    <!-- Sidebar user panel (optional) -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
      </div>
      <div class="pull-left info">
        <h4>카페설정(Setting)</h4>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">
      <li class="header"></li>
      <c:if test="${isAdmin || isClassTeacher}">
	      <li class="treeview active"><a href="/${domain}/main" target="inner"><i class="fa fa-link"></i> <span>홈</span></a></li>
	      <li class="treeview"><a href="/classinfo/classread?domain=${domain}" target="inner"><i class="fa fa-link"></i> <span>${domain} 수업정보</span></a></li>
	      <li class="treeview"><a href="/${domain}/curriculum/edit" target="inner"><i class="fa fa-link"></i> <span>커리큘럼</span></a></li>
	      <li class="treeview"><a href="/${domain}/qna/listpage" target="inner"><i class="fa fa-link"></i> <span>질문답변</span></a></li>
	      <li class="treeview"><a href="/${domain}/comprehension" target="inner"><i class="fa fa-link"></i> <span>이해도통계</span></a></li>
	      <li class="treeview"><a href="/${domain}/course/joinmemberlist" target="inner"><i class="fa fa-link"></i> <span>우리반식구(가입승인)</span></a></li>
	      <li class="treeview"><a href="/${domain}/seat" target="inner"><i class="fa fa-link"></i>[반장메뉴:배치도]</a></li>
      </c:if>
      
      <c:if test="${isClassStudent || isClassPresident}">
	  	  <li class="treeview active"><a href="/${domain}/main" target="inner"><i class="fa fa-link"></i> <span>홈</span></a></li>
     	  <li class="treeview"><a href="/classinfo/classread?domain=${domain}" target="inner"><i class="fa fa-link"></i> <span>${domain} 수업정보</span></a></li>
          <li class="treeview"><a href="/${domain}/qna/listpage" target="inner"><i class="fa fa-link"></i> <span>질문답변</span></a></li>
          <li class="treeview"><a href="/${domain}/comprehension" target="inner"><i class="fa fa-link"></i> <span>이해도통계</span></a></li>
          <li class="treeview"><a href="/${domain}/course/joinmemberlist" target="inner"><i class="fa fa-link"></i> <span>우리반식구</span></a></li>
          <c:if test="${isClassPresident}">
          	<li class="treeview"><a href="/${domain}/seat" target="inner"><i class="fa fa-link"></i>[반장메뉴:배치도]</a></li>
          </c:if>
      </c:if>
      
    </ul><!-- /.sidebar-menu -->
  </section>
  <!-- /.sidebar -->
</aside>


<div class="content-wrapper">
	<iframe name="inner" src="/${domain}/main" width="100%" height="100%" style="border:none;"></iframe>
</div>
<!-- /.content-wrapper -->

<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이해했니?</h4>
			</div>
			<div class="modal-body">
				<%-- 선생님 --%>
				<c:if test="${isClassTeacher}">
					<form id="sendQuestion" class="form-inline">
						<input type="hidden" name="curri_no">
						<input type="hidden" name="curri_gpno">
						<div class="input-group">
					      <input type="text" name="teacherquestion_content" class="form-control" placeholder="질문을 입력하세요">
					      <span class="input-group-btn">
					        <button id="questionBtn" class="btn btn-default">전송</button>
					      </span>
					    </div>
				    </form>
			    </c:if>
			    
			    <%-- 학생 --%>
			    <c:if test="${isClassStudent}">
			    	<p id="msg">이해되냐</p>
					<div class="row">
	  					<div class="col-md-3">
	  						<form id="sendScore" class="form-inline">
								<input type="hidden" name="clz_domain" value="${domain}">
								<input type="hidden" name="mem_id" value="${user.id}">
								<input type="hidden" name="teacherquestion_no">
								<div class="input-group">
							      <input type="number" name="comprehension_score" class="form-control" min="0" max="10" placeholder="점수" required="required">
							      <span class="input-group-btn">
							        <button class="btn btn-default">전송</button>
							      </span>
							    </div>
						    </form>
				    	</div>
				    </div>
			    </c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
<script>
	var socket = io.connect('http://14.32.66.104:3002');
	socket.on("connect", function(){
		socket.emit("init", {domain: "${domain}", userId: "${user.id}"});	
	});
</script>

<!-- 선택메뉴 활성화 -->
<script>
$(".treeview").on('click', function(){
	$('.treeview').attr('class','treeview')
	$(this).attr('class', 'treeview active')	
});
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>