<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<style>
label {
	font-family: NANUMGOTHIC;
}

.box * {
	font-family: NANUMGOTHIC;
}

.box {
	background: white;
	border-top: 3px solid #19BDC4;
}

.div-text-valign {
	font-size: medium;
	font-weight: bold;
	padding: 0px 15px 0px 15px;
	line-height: 34px;
}

.div-left {
	padding: 0px 0px 0px 0px;
}

</style>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>　</h1>
	<ol class="breadcrumb">
		<li><a href="#">
				<i class="fa fa-fw fa-home"></i> Home
			</a></li>
		<li class="active">개인정보</li>
	</ol>
</section>


<!-- Main content -->
<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">
				<i class="fa fa-fw  fa-user"></i>${user.id}님의 개인정보
			</h3>
		</div>
		<!-- /.box-header -->

		<!-- form start -->
		<form id="profile" class="form-horizontal" method="post" action="/membership/profile" enctype="multipart/form-data">
			<div class="box-body">
				<div class="form-group">
					<label for="inputId" class="col-sm-2 control-label">아이디</label>
					<input type="hidden" class="form-control" name="mem_id" value="${user.id}">
					<div class="col-sm-6 div-text-valign">${user.id}</div>
				</div>
				<div class="form-group">
					<label for="inputPassword1" class="col-sm-2 control-label">새 비밀번호</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mem_pw">
					</div>
					<!--                       <label for="inputPassword2" class="col-sm-2 control-label" >비밀번호 확인</label>
                      <div class="col-sm-2">
                      </div>
                      <div class="col-sm-4">
                        <input type="text" class="form-control"> 
                      </div> -->
				</div>
				<div class="form-group">
					<label for="inputName" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-6 div-text-valign">${user.name}</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-sm-2 control-label">E-MAIL</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mem_email" value="${user.email}" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputTel" class="col-sm-2 control-label">TEL</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="mem_tel" value="${user.tel}" />
					</div>
				</div>

				<div class="form-group">
					<label for="inputPhoto" class="col-sm-2 control-label">사진</label>
					<div class="col-sm-10">
						<div class="col-sm-6 div-left ">
							<div class="form-inline">
								<img class="profileimg" src="/membership/profileImg" onerror='imgError(this);' width="100px" height="100px" /> <span>자신의 사진을 넣어주세요(160 X 160)</span>
							</div>

							<input type="file" class="form-control" name="file" />
						</div>
					</div>
				</div>

			</div>
			<!-- /.box-body -->
			<div class="box-footer text-center">
				<div class="col-sm-7">
					<c:if test="${isTeacher}">
							<a href="/classinfo/myclasslist" class="btn btn-default pull-right">취소</a>
					</c:if>
					<c:if test="${isStudent}">
							<a href="/classinfo/sclasslistjoin" class="btn btn-default pull-right">취소</a>
					</c:if>
					<button type="submit" class="btn btn-primary pull-right" style="margin-right: 5px;">등록</button>
				</div>
			</div>
			
		</form>
	</div>

	<!-- /.box-footer -->
	<!-- /.box box-info -->
	<!-- ----------------------------------------- -->

</section>
<script>
	//seat 이미지 on 이벤트
	function imgError(image) {
		image.onerror = "";
		image.src = "/resources/nojo/images/noImage.png";
		return true;
	}
</script>
<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>