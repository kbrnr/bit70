<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/t_header.jsp"%>

<style>
.chair{border: thin solid black; width: 80px; position: absolute;}
</style>

<div class="content-wrapper">
	<div class="container">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				수업명: ${domain} <small>(${userid}선생님)</small>
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
		
		<div class="row">
			<div class="col-sm-12">
				<div class="box">
	                <div class="box-header">
	                  <h3 class="box-title">※커리큘럼 요약 들어갈곳 이에요^^ 질문할수 있어요</h3>
	                </div><!-- /.box-header -->
	                <div class="box-body">
  	                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
		                  	
	                  	<div class="row">
		                  	<div class="col-sm-12">
			                  
			                  <img id="curri" src="/resources/nojo/images/main01.jpg">
				                  
		                  	</div><!-- /.grid -->
			                  	
	                  	</div><!-- /.row -->
		                  	
		
		                    	
  	                  </div><!-- /.example1_wrapper -->
		               
	                </div><!-- /.box-body -->
				</div><!-- /.box -->
			</div><!-- /.col -->
		</div><!-- /.row -->
		<!-- ----------------------------------------- -->
		
		<div class="row">
			<div class="col-sm-9">
			
				<div class="box">
	                <div class="box-header">
	                  <h3 class="box-title">※배치도 들어갈곳 이에요^^</h3>
	                </div><!-- /.box-header -->

                	<div class="box-body">
                		<div id="container" style="border: thin solid black;">
		                  <div id="seat"  style="height: 400px; width: 700px; margin: 0 auto; overflow: auto; ">
						  </div>
						</div>
                	</div><!-- /.box-body -->
				
				</div><!-- /.box -->
			</div><!-- /.col -->		
		
			<div class="col-sm-3 main-header">
			
				<div class="box">
	                <div class="box-header">
	                  <h3 class="box-title">※알림 들어갈곳^^</h3>
	                </div><!-- /.box-header -->

                	<div class="box-body">
		                  <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
		                  	
		                  	
		                  	<div class="row">
			                  	<div class="col-sm-12">
	<!--------------->
	<img src="/resources/nojo/images/main03.jpg">
	<!--------------->			                  
			                  	</div><!-- /.grid -->
		                  	</div><!-- /.row -->
		                    	
		                  </div><!-- /.example1_wrapper -->
                	</div><!-- /.box-body -->
				
				</div><!-- /.box -->
		
		
			</div><!-- /.col -->
		</div><!-- /.row -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.container -->
</div>
<!-- /.content-wrapper -->

	<script>
		// Seat에서 사용하는 함수
		$.getJSON("/${domain}/seat/ajax", function(list){
			$(list).each(function(){
				var x = this.seat_x;
				var y = this.seat_y;
				var name = this.mem_name;
				var id = this.mem_id;
				
				var str = "<div class='chair' style='margin-left: " + x + "px; margin-top: " + y + "px;'>" + name + "</div>";
				var chair = $(str);
				chair.css( { "margin-left" : x+"px", "margin-top" : y+"px" });
				$("#seat").append(str);
					
			});
			
			
		});
		
	</script>
  </body>
</html>

 
<%@include file="/WEB-INF/views/include/footer.jsp"%>