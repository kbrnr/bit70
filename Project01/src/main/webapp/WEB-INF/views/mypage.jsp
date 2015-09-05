<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

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

$(".sidebar-toggle").remove();

</script>

 
<%@include file="/WEB-INF/views/include/footer.jsp"%>