<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>


<!-- Full Width Column -->
<div class="content-wrapper">
	<div class="container">
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
                  <h3 class="box-title">■수업등록</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <form id="classinputform" class="form-horizontal" action="/academy/classregister">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='clz_name'">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <div class="col-sm-10">
                      	http://www.XXX.com/
                      		<div id="domainmsg"></div>
                      	<button id="btn_domaincheck" type="button" class="btn btn-info pull-right">도메인검사</button>
                        <input id="clz_domain" type="text" class="form-control" name='clz_domain' value=''>   
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사등록</label>
                      <div class="col-sm-10" id='popupdiv'>
                        <button id="btn_teachlist" type="button" class="btn btn-info pull-right">강사찾기</button>
                      </div>
                    </div>
                      
					========================================================
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사번호</label>
                      <div class="col-sm-10">
                      	user02	계룡산
						user122	김효연
						user121	황미영
						user120	권유리
                        <input type="text" class="form-control" id="inputEmail3" name='mem_id'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사명</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='mem_name'>
                      </div>
                    </div>
                    
                    
                    
                  
                    
                    ========================================================
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사번호</label>
                      <div class="col-sm-10">
                      	user02	계룡산
						user122	김효연
						user121	황미영
						user120	권유리
                        <input type="text" class="form-control" id="inputEmail3" name='mem_id'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사명</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='mem_name'>
                      </div>
                    </div>
                    ========================================================
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사번호</label>
                      <div class="col-sm-10">
                      	user02	계룡산
						user122	김효연
						user121	황미영
						user120	권유리
                        <input type="text" class="form-control" id="inputEmail3" name='mem_id'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강사명</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='mem_name'>
                      </div>
                    </div>
                    ========================================================
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강의실</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='clz_room'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">시작일</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='clz_start_date'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">종료일</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name='clz_end_date'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >상태</label>
                      <div class="col-sm-10">
                        <label>
                              준비중
                          <input type="radio" name="clz_state" id="optionsRadios1" value="1">
                        </label>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;
                              강의중
                          <input type="radio" name="clz_state" id="optionsRadios2" value="2">
                        </label>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;
                              종료
                          <input type="radio" name="clz_state" id="optionsRadios3" value="3">
                        </label>
                        <label>&nbsp;&nbsp;&nbsp;&nbsp;
                              일시정지
                          <input type="radio" name="clz_state" id="optionsRadios4" value="4">
                        </label>
                      </div>
                    </div>                         
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                  	<a href="classlist" class="btn btn-default">취소</a>
                    
                    <button type="submit" class="btn btn-info pull-right">등록</button>
                    
                  </div><!-- /.box-footer -->
                </form>
			</div><!-- /.box box-info -->		
		<!-- ----------------------------------------- -->
			
		</section>
		<!-- /.content -->



	</div>
	<!-- /.container -->
</div>
<!-- /.content-wrapper -->



<script>
$("#btn_teachlist").on("click", function() {
	$.ajax({
		url: '/academy/popupteacherlist',
		type: 'post',
		dataType:'json',
		success: function(list){
			var listStr = "";
			$(list).each(
					function(i, value) {
						listStr += value.mem_name+"("+value.mem_id+")<br>";
					}
			);
			$("#popupdiv").append(listStr);
		}
	});
});

$("#btn_domaincheck").on("click", function() {
	console.log($("#clz_domain").val());
	$.ajax({
		url: '/academy/domaincheck/',	
		type: 'post',
		data: $("#clz_domain").val(),
		dataType:'text',
		success: function(data){
			var msg ;
			if($(data)== true){
				 msg ="사용할수 있는 도메인입니다.";
			}
			else{
				msg ="사용할수 있는 도메인입니다.";
			}
			$("#domainmsg").append(msg)
		}
	});
});


</script>



<%@include file="/WEB-INF/views/include/footer.jsp"%>