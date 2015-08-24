<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		${user.id} <small>기본정보</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">${user.id} 기본정보</li>
	</ol>
</section>


<!-- Main content -->
<section class="content">
    <div class="box box-primary">
    	<div class="box-header with-border">
    	</div>
    	<div class="box-body">
			<table class="table table-striped">
				<thead>
					<h2>${user.id}님의 기본정보</h2>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>