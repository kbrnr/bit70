<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">개인정보관리</li>
	</ol>
</section>


<!-- Main content -->
<section class="content">
    <div class="box box-primary">
    	<div class="box-header with-border">
    		<h3 class="box-title">■${user.id}님의 기본정보</h3>
    	</div><!-- /.box-header -->
  	
		<!-- form start -->
        <form id="profileModify" class="form-horizontal" action="profileModify" method="post">
               <div class="box-body">
                 <div class="form-group">
                   <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
                   <div class="col-sm-6">
                   		${user.id}
                   </div>
                 </div>
  	             <div class="form-group">
                   <label for="inputPassword3" class="col-sm-2 control-label" >새 비밀번호</label>
                      <div class="col-sm-4">
                        <input type="password" class="form-control" id="inputEmail3" name='clz_name'">
                      </div>
                   <label for="inputPassword3" class="col-sm-2 control-label" >비밀번호 확인</label>
                      <div class="col-sm-2">
                      </div>
                      <div class="col-sm-4">
                        <input type="password" class="form-control" id="inputEmail3" name='clz_name'">
                      </div>
                 </div>
                 <div class="form-group">
                   <label for="inputPassword3" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-6">
                   		${user.name}
                   </div>
                 </div>
                 <div class="form-group">
                   <label for="inputPassword3" class="col-sm-2 control-label">E-MAIL</label>
                    <div class="col-sm-4">
                    	<input type="text" class="form-control" id="inputEmail3" name='clz_name'" value="${user.email}">
                   </div>
                                      <label for="inputPassword3" class="col-sm-2 control-label" >E-MAIL 확인</label>
                    <div class="col-sm-4">
                   		<input type="text" class="form-control" id="inputEmail3" name='clz_name'" value="${user.tel}">
                   </div>
                 </div>
                 <div class="form-group">
                   <label for="inputPassword3" class="col-sm-2 control-label">TEL</label>
                    <div class="col-sm-4">
                   		<input type="text" class="form-control" id="inputEmail3" name='clz_name'" value="${user.tel}">
                   </div>
                 </div>
                                      
                 <div class="form-group">
                   <label for="inputPassword3" class="col-sm-2 control-label">사진</label>
                   <div class="col-sm-10">
                   	<div class="col-sm-5">
                   		<img src="/membership/seatImg?userId=${profile.mem_id}">
			            <input type="file" class="form-control" name="file" />
                   	</div>
                   </div>
                 </div>
                
               </div><!-- /.box-body -->
               <div id="hiddenid"></div>
               <div class="box-footer">
               	<a href="profile" class="btn btn-default">취소</a>
                 
                 <button type="submit" class="btn btn-info pull-right">등록</button>
                 
               </div><!-- /.box-footer -->
             </form>
</div><!-- /.box box-info -->		
<!-- ----------------------------------------- -->		
		
		
		
	</div>
</section>
<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>