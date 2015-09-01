<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<style>

.ahand { cursor: pointer; }

th {
		text-align: center;
		vertical-align: middle;
		background-color: #E0E0E0 ;
}
	
td {
	text-align: center;
}

.td-left {
	text-align: left;
}

.input-classname{
	width: 400px;
}

.input-domain{
	width: 50px;
}

.btn-tmodal{
	padding: 0px 15px 0px 47px;
}

.choiceteacher{
	width: 315px;
	padding: 8px 15px 0px 15px;
}

.classstate {
	padding: 5px 15px 0px 15px;
}

</style>

  
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
			<div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">■수업등록</h3>
                </div><!-- /.box-header -->
               
				<!-- form start -->
                <form id="classinputform" class="form-horizontal" action="/classinfo/classregister" method="post">
                  <div class="box-body">
                    <div class="form-group">
                      <label for="inputEmail3" class="col-sm-2 control-label">수업명</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control input-classname" id="inputEmail3" name="clz_name">
                      </div>
                    </div>
                    <div class="form-group">
					  <label for="inputPassword3" class="col-sm-2 control-label" >도메인</label>
                      <div class="col-sm-7 form-inline">
                      	<span class="url">http://www.focus.com/</span>
                      	<input type="text" id="clz_domain" class="input-domain form-control" name='clz_domain' >
                      	<button id="btn_domaincheck" type="button" class="btn btn btn-default btn-sm">도메인검사</button>
                      	<span id="domainmsg" ></span>
                      </div>
                  	  
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">선생님</label>
                      <div id="choiceteacher" class="choiceteacher col-sm-3"></div>
                      <div class="col-sm-1">
                 		<button id="btn_teachlist" type="button" class="btn btn btn-default btn-sm" data-toggle="modal" data-target="#teacherModal">선생님찾기</button>
                      </div>
                    </div>
                                         
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">강의실</label>
                      <div class="col-sm-2 ">
                        <input type="text" class="form-control" id="inputEmail3" name='clz_room'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">시작일</label>
                      <div class="col-sm-3">
                        <input type="date" class="form-control" id="inputEmail3" name='clz_start_date'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">종료일</label>
                      <div class="col-sm-3">
                        <input type="date" class="form-control" id="inputEmail3" name='clz_end_date'>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label" >상태</label>
                      <div class="col-sm-5 classstate">
                        <label>
                              준비중
                          <input type="radio" name="clz_state" id="optionsRadios1"  value="1">
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
                  
                  
                  <div class="box-footer text-center">
                  	<div class="col-sm-8">
                  	<a href="classlist" class="btn btn-default pull-right">취소</a>
                    
                    <button type="submit" class="btn btn-primary btn-lg ">등록</button>
                    </div>
                  </div><!-- /.box-footer -->
                  
                </form>
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
        	<table id="example1" class="table table-hover" role="grid">
		    <thead>
		    	<tr role="row">
		        	<th width="100px">아이디</th>
			        <th >성명</th>
			        <th width="150px">이메일</th>
			        <th width="150px">연락처</th>			                   
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


<script>
//모달 선생님 리스트//
var page = 1
$("#btn_teachlist").on("click", function() {
	popteacherlist(page)
});

function popteacherlist(){
	$.ajax({
		url: '/membership/modalteacherlist/'+page,
		type: 'post',
		dataType:'json',
		success: function(map){
			var listStr = "";
			$(map.poplist).each(
					function() {
						listStr += "<tr role='row' class='userinfo'><td class='userid'><a href='#'>"+this.mem_id+"</a></td><td class='username'>"+this.mem_name+"</td><td>"+this.mem_email+"</td><td>"+this.mem_tel+"</td></tr>";
					}
			);
			$("#teacherinfo").html(listStr);
			
			
			//페이징
		    replypage = (map.poppageMaker.page);
		var startPage = (map.poppageMaker.startPage);
		var endPage = (map.poppageMaker.endPage);
		var prevURL = (map.poppageMaker.startPage-1) ; 
		var nextURL = (map.poppageMaker.endPage+1) ; 
		var prev = (map.poppageMaker.prev);
		var next = (map.poppageMaker.next);
		var pageMakerList ="";
			
		if(prev === true){
			pageMakerList +='<li id='+ prevURL +'><a href="#">prev</a></li>';
		}
		
		for(var i=startPage; i<=endPage ; i++ ){
			if(i==replypage){
				pageMakerList += '<li id='+ i +'><a href="#"><b>  '+ i +' </a></b></li>';
			}else {
				pageMakerList += '<li id='+ i +'><a href="#">'+ i +'</a></li>';
			}
		}
		
		if(next === true){
			pageMakerList +='<li id='+ nextURL +'><a href="#">next</a></li>';
		}
		
		$("#teacherpaging").html(pageMakerList); 
		}
	});
}

$("#teacherpaging").on("click", "li", function(event) {
	event.preventDefault();
	page=$(this).attr("id");
	popteacherlist(page)
});
//./모달 선생님 리스트//

//모달창 선생님 선택시
$("#teacherinfo").on("click", ".userid", function(){
	var userid ;
	var username ;
	userid = $(this).text();
	username = $(this).siblings('.username').text();
	console.log(userid);
	console.log(username);
	$("#choiceteacher").append("<div data-vid='"+ userid +"' class='tremove'>"+ username + "(" + userid + ") <span class='badge ahand'>X</span> <input type='hidden' data-hid='mem_id' name='mem_id' value='"+userid+"' ></div>");
});


//선택된 선생님 취소
$("#choiceteacher").on("click", ".tremove", function(){
	$this = $(this)
	$this.remove();
	
});



//도메인체크
$("#btn_domaincheck").on("click", function() {
	console.log($("#clz_domain").val());
	$.ajax({
		url: '/classinfo/domaincheck',	
		type: 'post',
		data: "clz_domain=" + $("#clz_domain").val(),
		dataType:'json',
		success: function(data){
			console.log(data);
			var msg = data ? "<span style='color:blue'>사용가능한 도메인 입니다." : "<span style='color:red'>사용중인 도메인 입니다.";
			$("#domainmsg").html(msg)
		}
	});
});


</script>


<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>