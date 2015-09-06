<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
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
.div-text-valign{
	font-size: medium;
	padding: 0px 15px 0px 15px;
	line-height: 34px;
}
.div-left{
	padding: 0px 0px 0px 0px;
}
.align {
	margin-left: 45%;
	width: 110px;
}


</style> 
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				　
			</h1>
			<ol class="breadcrumb">
				<li><a href="#">
						<i class="fa fa-fw fa-home"></i> Home
					</a></li>
				<li class="active">수업관리</li>
			</ol>
		</section>



		<!-- Main content -->
		<section class="content">
		<!-- ----------------------------------------- -->
			<div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title"><i class="fa fa-fw  fa-info-circle"></i>수업정보</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <form id="classinputform" class="form-horizontal" action="/classinfo/classregister" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-10 div-text-valign">
                        ${clzinfo.clz_name}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <div class="col-sm-10 div-text-valign">http://www.understand.com/${clzinfo.clz_domain}</div>
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
                  </div><!-- /.box-body -->
                  <div id="hiddenid"></div>
                  
                </form>
                  <div class="box-footer text-center ">
                  <!-- 학원일때 -->
                  <c:if test="${isAdmin}">
                  <div class="align">
                  	<a href="/classinfo/classmodifyform?domain=${clzinfo.clz_domain}" class="btn btn-primary">수정</a>
                  	<a href="/classinfo/classlist" class="btn btn-default pull-right">목록 </a>
                  </c:if>
                  </div>
                  
                  
                  </div><!-- /.box-footer -->
			</div><!-- /.box -->		
		<!-- ----------------------------------------- -->
			
		</section>
		<!-- /.content -->



<!-- ****************************************************************************** -->
<!-- ****************************************************************************** -->
<!-- ****************************************************************************** -->
<!-- 선생님리스트 모달창 -->
<!-- Modal -->
<div class="modal fade" id="teacherModal" role="dialog">
   <div class="modal-dialog">
    
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">선생님리스트</h4>
      </div>
      <div class="modal-body">    
        <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
        	<table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
		    <thead>
		    	<tr role="row">
		        	<th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending" style="width: 109px;">아이디</th>
			        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 142px;">성명</th>
			        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 92px;">이메일</th>
			        <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 64px;">연락처</th>			                   
		        </tr>
		    </thead>
		    <tbody id="teacherinfo">

		    </tbody>
		    </table>
		</div><!-- /.example1_wrapper -->
        <div class="dataTables_paginate paging_simple_numbers text-center" id="example1_paginate">
        	<ul id="teacherpaging" class="pagination">
            	
        	</ul>
        </div><!-- /.example1_paginate -->
      </div><!-- /.modal-body -->
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
      
  </div><!-- ./modal-dialog -->
</div><!-- ./modal fade -->              
<!-- ./Modal -->  
<!-- ****************************************************************************** -->
<!-- ****************************************************************************** -->
<!-- ****************************************************************************** -->

  </body>
</html>


<script>


</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>