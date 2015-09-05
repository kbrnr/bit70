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
        <h4>${grade}</h4>
        <!-- Status -->
      </div>
    </div>

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">
      <li class="header"></li>
      
      <%-- 학원 --%>
      <c:if test="${isAdmin}">
	      <li class="treeview active"><a href="/classinfo/classlist" target="inner"><i class="fa fa-link"></i> <span>수업관리</span></a></li>
          <li class="treeview"><a href="/membership/teacherlist" target="inner"><i class="fa fa-link"></i> <span>선생님관리</span></a></li>
      </c:if>
      
      <%-- 선생님 --%>
	  <c:if test="${isTeacher}">
	      <li class="treeview active"><a href="/classinfo/myclasslist" target="inner"><i class="fa fa-link"></i> <span>나의수업관리</span></a></li>
	      <li class="treeview"><a href="/membership/profile" target="inner"><i class="fa fa-link"></i> <span>개인정보관리</span></a></li>
	  </c:if>
	  
	  <%-- 학생 --%>
      <c:if test="${isStudent}">
	      <li class="treeview active"><a href="/classinfo/myclasslist" target="inner"><i class="fa fa-link"></i> <span>수업관리</span></a></li>
	      <li class="treeview"><a href="/membership/profile" target="inner"><i class="fa fa-link"></i> <span>개인정보관리</span></a></li>
      </c:if>
	  
    </ul><!-- /.sidebar-menu -->
  </section>
  <!-- /.sidebar -->
</aside>


<!-- Full Width Column -->
<%-- 학원 --%>
<c:if test="${isAdmin}">
	<div class="content-wrapper">
		<iframe name="inner" src="/classinfo/classlist" width="100%" height="100%" style="border:none;"></iframe>
	</div>
</c:if>

<%-- 선생님 --%>
<c:if test="${isTeacher}">
	<div class="content-wrapper">
		<iframe name="inner" src="/classinfo/myclasslist" width="100%" height="100%" style="border:none;"></iframe>
	</div>
</c:if>

<%-- 학생 --%>
<c:if test="${isStudent}">
	<div class="content-wrapper">
		<iframe name="inner" src="/classinfo/sclasslistjoin" width="100%" height="100%" style="border:none;"></iframe>
	</div>
</c:if>

<!-- /.content-wrapper -->


<!-- 선택메뉴 활성화 -->
<script>
$(".treeview").on('click', function(){
	$('.treeview').attr('class','treeview')
	$(this).attr('class', 'treeview active')	
});
</script>

 
<%@include file="/WEB-INF/views/include/footer.jsp"%>