<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
  
  
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				<small></small>
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
			<div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">■수업상세FAFD</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <form id="classinputform" class="form-horizontal" action="/classinfo/classregister" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-10">
                        ${clzinfo.clz_name}
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <label for="inputPassword3" class="col-sm-2 control-label" >http://www.understand.com/</label>
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
                  </div><!-- /.box-body -->
                  <div id="hiddenid"></div>
                  
                </form>
                  <div class="box-footer">
                   	<a href="/classinfo/classlist" class="btn btn-default">목록</a>
                  	<a href="/classinfo/classmodifyform?domain=${clzinfo.clz_domain}" class="btn btn-info pull-right">수정</a>
                  </div><!-- /.box-footer -->
			</div><!-- /.box box-info -->		
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