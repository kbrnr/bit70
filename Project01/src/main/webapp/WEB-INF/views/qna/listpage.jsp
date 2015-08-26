<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>

<!-- Main content -->
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
							<c:set var = "v" value= "${vo.question_visible }" />
							<c:set var = "memId" value= "${vo.mem_id }" />
							<c:set var = "userId" value= "${user.id}" />
							<c:set var = "t" value= "${isTeacher}" />
							<c:choose>
							<c:when test="${v == true || t == true || memId == userId}" > 
								<td><span><a href='detail?page=${pagemaker.page }&perPagerNum=${pagemaker.perPageNum }&no=${vo.question_no}'>${vo.question_title }</a></span></td>
						    </c:when>
							<c:when test="${v == false || memId != userId }" > 
							 	<td>선생님만 봐주세요!!!</td>
							</c:when>
							</c:choose>
							<td width = 120px>${vo.mem_id }</td>
							<td width = 120px class="regDate">${vo.question_reg_date }</td>
						</tr>
					</c:forEach>
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
								        <button class="btn btn-default" type="Submit">Go!</button>
								      </span>
		                 	 </div><!-- /input-group -->
							</div>
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

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>
