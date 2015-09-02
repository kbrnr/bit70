<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<style>
.div-text-valign{
	font-size: 22px;
	padding: 0px 15px 0px 15px;
}


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
                <div class="box-header with-border">
                  <h3 class="box-title">■수업신청</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <div id="classinputform" class="form-horizontal" >
                  <div class="box-body">
                  
                   	<c:if test="${courseinfo.course_state==1}">
					<div class="form-group">
						<div class="col-sm-6 text-center ">
					  		<div class="alert alert-info alert-dismissable">
                    			<h4><i class="icon fa fa-info"></i> 가입진행중!</h4>
                    			선생님의 승인후 사용가능합니다.
                  			</div>
						</div>
					</div>
                  	</c:if>     
                  
                  
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-10 div-text-valign">
                        ${clzinfo.clz_name}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <div class="col-sm-10 div-text-valign">http://www.focus.com/${clzinfo.clz_domain}</div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">선생님</label>
                      <div class="col-sm-8 div-text-valign">
                 		<div id="choiceteacher" class="time-label">
                 		<c:forEach items="${clzinfo.teacherlist}" var="teacher">
                 				${teacher.mem_name}(${teacher.mem_id})&nbsp;&nbsp;&nbsp;
                 			</c:forEach>
                 		</div>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강의실</label>
                      <div class="col-sm-10 div-text-valign">
                        ${clzinfo.clz_room}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">시작일</label>
                      <div class="col-sm-10 div-text-valign">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${clzinfo.clz_start_date}"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">종료일</label>
                      <div class="col-sm-10 div-text-valign">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${clzinfo.clz_end_date}"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >상태</label>
                      <div class="col-sm-10 div-text-valign">
                      <c:choose>
			          	<c:when test="${clzinfo.clz_state=='1'}">준비중</c:when>
			            <c:when test="${clzinfo.clz_state=='2'}">강의중</c:when>
			            <c:when test="${clzinfo.clz_state=='3'}">종료</c:when>
			            <c:when test="${clzinfo.clz_state=='4'}">일시정지</c:when>
			          </c:choose>
                      </div>
                    </div>
		
		          	<c:if test="${courseinfo.course_state==null}">
					<div class="box-footer text-center ">
						<div class="col-sm-7">
					  		<button id="btn_join" class="btn btn-primary btn-lg" >join</button> 
						</div>
					</div>	                         
                  	</c:if>
                  	
                  	<c:if test="${courseinfo.course_state==1}">
					<div class="box-footer text-center ">
						<div class="col-sm-6">
					  		<a href="/classinfo/classlist" class="btn btn-default btn-lg ">목록 </a>
						</div>
					</div>	                         
                  	</c:if>
                  
                  </div><!-- /.box-body -->
					
                </div>

			</div><!-- /.box box-info -->		
		<!-- ----------------------------------------- -->
			
		</section>
		<!-- /.content -->



<script>
/*--------수업신청하기---------*/
$("#btn_join").on("click", function() {	
	
	var url = '/classinfo/joinexe';
	$.ajax({
		type : 'POST',
		url : url ,
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
				clz_domain: "${clzinfo.clz_domain}",
				mem_id: "${user.id}"
				}),
		dataType : 'text',
		success : function(result) {
			if (result == 'ok') {
				alert("가입되었습니다. 선생님의 승인후 사용가능합니다.");
			}
			parent.location.href = "/";
		}
	});
});	


</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>