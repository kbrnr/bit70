<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@page import="java.util.*" %>
<c:set var="date" value="<%=new Date() %>"/>

<style>

th {
		text-align: center;
		vertical-align: middle;
		background-color: #F7D62D ;
}
	
td {
	text-align: center;
}

.td-left {
	text-align: left;
}

.teacherul {
    padding-left: 0px;
	float: left;
}

.teacherli { 
	width:130px; 
	float:left; 
	margin:5px; 
	display:inline; 
	margin: 0px 5px 0px 5px;
}

.td-domain {
	font-size: 18px;
	font-weight: bold;>
}

.space {
	height:50px; 
}


</style>


<!-- Main content -->

<section class="content-header">
	<h1>
		<small></small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#">
				<i class="fa fa-fw fa-home"></i> Home
			</a></li>
		<li class="active">${domain}</li>
		<li class="active">질문답변</li>
	</ol>
</section>


<section class="content">
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-fw fa-list"></i>질문리스트</h3>
			<!-- <a href="listpage">
					<button type="button" class="btn btn-info" style="float: right;">Go List</button>
				</a> -->
			</div>
			<!-- /.box-header -->
			<div class="box-body">
			
				<div><!-- 글쓰기 버튼 -->
					<a href="questionRegist"><button id="ResBoard"
							type="submit" class="btn btn-primary pull-right margin-bottom">질문등록</button></a>
				</div>
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td width = 50px><span>${vo.rowNum}</span></td>
							<c:set var = "v" value= "${vo.question_visible }" />
							<c:set var = "memId" value= "${vo.mem_id }" />
							<c:set var = "userId" value= "${user.id}" />
							<c:set var = "t" value= "${isTeacher}" />
								<c:choose>
									<c:when test="${v == true || t == true || memId == userId}" > 
										<td class="td-left" ><span><a href='detail?page=${pagemaker.page }&perPagerNum=${pagemaker.perPageNum }&no=${vo.question_no}'>
										<c:if test="${v == false }"><span class="glyphicon glyphicon-lock"></span></c:if>
										${vo.question_title }</a></span></td>
								    </c:when>
									<c:when test="${v == false || memId != userId }" > 
									 	<td class="td-left"><span class="glyphicon glyphicon-lock"></span> 비밀글 입니다.</td>
									</c:when>
								</c:choose>
							<td width = 120px>${vo.mem_id }</td>
							<td width = 120px class="regDate"><fmt:formatDate value="${vo.question_reg_date }" type="date" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 -->
			<div class="box-footer clearfix text-center">
			<div class="dataTables_paginate paging_simple_numbers text-center" id="example1_paginate">
				<ul class="pagination" style="margin: 20px 0 10px 0;">
					<!-- 이전페이지 -->
					<c:if test="${pagemaker.prev }">
						<c:if test="${searchKey == null && searchValue == null }">
							<li><a href="listpage?page=${pagemaker.startPage - 1 }&perPageNum=${pagemaker.perPageNum}">prev</a></li>
					</c:if>
						<c:if test="${searchKey != null && searchValue != null }">
							<li><a href="listpage?page=${pagemaker.startPage - 1 }&perPageNum=${pagemaker.perPageNum}&searchKey=${searchKey}&searchValue=${searchValue}">
									prev</a></li>
						</c:if>
					</c:if>
					<!-- 페이징 -->
					<c:forEach begin="${pagemaker.startPage }" end="${pagemaker.endPage }" var="idx">
						<li <c:out value = "${pagemaker.page==idx?'class=active' :'' }"/>>
							<c:if test="${searchKey == null && searchValue == null }">
								<a href="listpage?page=${idx }&perPageNum=${pagemaker.perPageNum}">${idx }</a>
							</c:if>
							<c:if test="${searchKey != null && searchValue != null }">
								<a href="listpage?page=${idx }&perPageNum=${pagemaker.perPageNum}&searchKey=${searchKey}&searchValue=${searchValue}">${idx }</a>
							</c:if>
						</li>
					</c:forEach>
					<!-- 다음페이지 -->
					<c:if test="${pagemaker.next }">
						<c:if test="${searchKey == null && searchValue == null }">
							<li><a href="listpage?page=${pagemaker.endPage + 1 }&perPageNum=${pagemaker.perPageNum}">next</a>
							</li>
						</c:if>
						<c:if test="${searchKey != null && searchValue != null }">
							<li><a href="listpage?page=${pagemaker.endPage + 1 }&perPageNum=${pagemaker.perPageNum}&searchKey=${searchKey}&searchValue=${searchValue}">next</a>
							</li>
						</c:if>
					</c:if>
				</ul>
			</div>
				
			

			<!-- 검색 -->
			
			
				<div class="box-body">
					<div class="input-group input-group-lg text-center" style="margin: 0px auto;">
					<form name="searchFrom">
							<div id="select_board">
								<select name="searchKey" class="form-control" style="width: 150px; margin-right: 10px;">
									<option value="question_title"
										<c:if test="${searchKey =='question_title' }">selected</c:if>>제목</option>
									<option value="question_title&question_content" selected
										<c:if test="${searchKey=='question_title'||'question_content' }">selected</c:if>>제목
										+ 내용</option>
									<option value="mem_id"
										<c:if test="${searchKey=='mem_id' }">selected</c:if>>작성자</option>
								</select>
								<div class="input-group">
   								   <input type="text" class="form-control" name="searchValue" style="width: 200px;">
								      <span class="input-group-btn">
								        <button class="btn btn-default" type="Submit">검색</button>
								      </span>
		                 	 </div><!-- /input-group -->
							</div>
					</form>
					</div>
				</div>
				
				<div class="space"></div>
				
		</div>
	</div>
	<!-- /.col -->
</div>
</section>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
