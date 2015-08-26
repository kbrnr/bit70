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
			<div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">■수업상세FAFD</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <div id="classinputform" class="form-horizontal" >
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_name}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <label for="inputPassword3" class="col-sm-2 control-label" >http://www.XXX.com/</label>
                      <div class="col-sm-2">
                      	${clzinfo.clz_domain}
                      </div>
                      <div class="col-sm-4">
                      	<div id="domainmsg"></div>
                      </div>
                      <div class="col-sm-2">
                      	
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">선생님</label>
                      <div class="col-sm-8">
                 		<div id="choiceteacher" class="time-label">
                 		<c:forEach items="${clzinfo.teacherlist}" var="teacher">
                 				${teacher.mem_name}(${teacher.mem_id})&nbsp;&nbsp;&nbsp;
                 			</c:forEach>
                 		</div>
                      </div>
                      <div class="col-sm-2">
                 			
                      </div>
                    </div>
                                         
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강의실</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_room}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">시작일</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_start_date}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">종료일</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_end_date}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >상태</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_state} 
                      </div>
                    </div>
                    <div class="text-center">
				  		<button id="btn_join" class="btn btn-info text-center" >join</button>   
					</div>                         
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
			$(location).attr('href', '/classinfo/myclasslist')
		}
	});
});	





	

</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>