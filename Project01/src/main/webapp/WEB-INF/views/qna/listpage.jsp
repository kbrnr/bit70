<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
   <!-- Bootstrap 3.3.4 -->
   <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
   <!-- Theme style -->
   <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
   <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
   <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
   <!-- jQuery 2.1.4 -->
   <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
   <!-- Bootstrap 3.3.2 JS -->
   <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
   <!-- SlimScroll -->
   <script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
   <!-- FastClick -->
   <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
   <!-- AdminLTE App -->
   <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
   <!-- Ionicons -->
   <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
   <!-- bootstrap wysihtml5 - text editor -->
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
   <!-- Font Awesome Icons -->
   <link href="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
   
   <link href="/resources/froala_editor/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
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

<!-- /.content -->
<!-- /.content-wrapper -->
</body>
</html>
