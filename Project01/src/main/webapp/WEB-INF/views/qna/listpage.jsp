<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Main content -->
<div class="content-wrapper">
<section class="content">
<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-header with-border">
				<h3 class="box-title">${domain} Table</h3>
				<a href="listpage">
					<button type="button" class="btn btn-info" style="float: right;">Go List</button>
				</a>
			</div>
			<!-- /.box-header -->
			<div class="box-body">
				<table class="table table-bordered">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td width = 50px><span>${vo.rowNum}</span></td>
							<td><span><a href='detail?page=${pagemaker.page }&perPagerNum=${pagemaker.perPageNum }&no=${vo.question_no}'>${vo.question_title }</a></span></td>
							<td width = 120px>${vo.mem_id }</td>
							<td width = 120px class="regDate">${vo.question_reg_date }</td>
					</c:forEach>
					</tr>
				</table>
			</div>
			<!-- /.box-body -->
			<!-- 페이징 -->
			<div class="box-footer clearfix">
				<ul class="pagination pagination-sm no-margin pull-left">
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

				<!-- 글쓰기 버튼 -->
				<a href="questionRegist"><button style="float: right;" id="ResBoard"
						type="submit" class="btn btn-primary">Write</button></a>
			</div>

			<!-- 검색 -->
			<p class="margin"></p>
			<div class="input-group input-group-lg">
				<div class="box-body">
					<form name="searchFrom">
						<fieldset>
							<div id="select_board" >
								<select name="searchKey">
									<option value="question_title"
										<c:if test="${searchKey =='question_title' }">selected</c:if>>제목</option>
									<option value="question_title&question_content" selected
										<c:if test="${searchKey=='question_title'||'question_content' }">selected</c:if>>제목
										+ 내용</option>
									<option value="mem_id"
										<c:if test="${searchKey=='mem_id' }">selected</c:if>>작성자</option>
								</select>
							</div>
							<div class="input-group input-group-sm">
			                    <input name="searchValue" type="text" class="form-control">
			                    <span class="input-group-btn">
			                      	<button class="btn btn-info btn-flat" type="Submit">Go!</button>
			                    </span>
		                 	 </div><!-- /input-group -->
						</fieldset>
					</form>
				</div>
				<!-- /btn-group -->

				<!-- /input-group -->
			</div>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-xs-12"></div>
</div>
</section>
</div>

<!-- /.content -->
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>