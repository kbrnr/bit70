<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE 2 | Dashboard</title>
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

<!-- REQUIRED JS SCRIPTS -->
<link href="/resources/nojo/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/nojo/script/bootstrap-treeview.min.js" type="text/javascript"></script>


  </head>
  <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->

<style>
body{background-color:#ecf0f5;}
.chair{border: thin solid black; width: 80px; position: absolute;}
</style>

<body class="skin-blue sidebar-mini">


		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				수업명: ${domain} <small>(${userid}학생)</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
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
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-3">
								<form id="searchTree" class="form-inline">
									<div class="input-group margin">
								      <input id="treeSearchText" type="text" class="form-control" placeholder="커리큘럼 검색">
								      <span class="input-group-btn">
								        <button class="btn btn-info">검색</button>
								      </span>
								    </div><!-- /input-group -->
								</form>
								<div id="tree"></div>
							</div>
							<div class="col-md-9">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">자바</h3>
									</div>
									<div class="panel-body">
										<p id="curriContent"></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<script>
			function Node(text, href, content) {
				this.text = text;
				this.href = href;
				this.content = content;
			}

			$.getJSON("/${domain}/curriculum", function(data) {
				//트리에 사용될 데이터를 알맞는 형식으로 변경
				var list = [];
				var work;
				$(data).each(function() {
					var name = this.curri_name;
					var depth = this.curri_depth;
					var no = this.curri_no;
					var content = this.curri_content;
					var node = new Node(name, no, content);
					if (depth == 1) {
						work = [];
						list.push(node);
					} else {
						if (!work[depth - 2].nodes) {
							work[depth - 2].nodes = [];
						}
						work[depth - 2].nodes.push(node);
					}
					work[depth - 1] = node;
				});
				console.log(list);
				
				//트리세팅
				$('#tree').treeview({
					data : list,
					levels : 1,
					onNodeSelected : function(event, data) {
						console.log(data);
						var parent = data;
						while(parent.parentId != undefined){
							parent = $('#tree').treeview('getParent', parent.nodeId);
						}
						$(":hidden[name=curri_no]").val(data.href);
						$(":hidden[name=curri_gpno]").val(parent.href);
						$(".panel-title").text(data.text);
						$("#curriContent").text(data.content);
						console.log(parent);
					}
				});
				
				//기본으로 첫번쨰 트리선택
				$('#tree').treeview('selectNode', 0);
				
				//검색이벤트
				$("#searchTree").submit(function(e){
					e.preventDefault();
					var text = $("#treeSearchText").val();
					var arr= $('#tree').treeview('search', [ text, {
					  ignoreCase: true,     // case insensitive
					  exactMatch: false,    // like or equals
					  revealResults: true,  // reveal matching nodes
					}]);
					if(arr.length > 0){
						$('#tree').treeview("selectNode", arr[arr.length-1]);
					}
				});
			});
		</script>
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





			
		<!-- ----------------------------------------- -->	

		</section>
		<!-- /.content -->

	 <div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">이해했니?</h4>
			</div>
			<div class="modal-body">
				<p id="msg">이해되냐</p>
				<div class="row">
  					<div class="col-md-3">
  						<form id="sendScore" class="form-inline">
							<input type="hidden" name="clz_domain" value="${domain}">
							<input type="hidden" name="mem_id" value="${userid}">
							<input type="hidden" name="teacherquestion_no">
							<div class="input-group">
						      <input type="number" name="comprehension_score" class="form-control" min="0" max="10" placeholder="점수" required="required">
						      <span class="input-group-btn">
						        <button class="btn btn-default">전송</button>
						      </span>
						    </div>
					    </form>
			    	</div>
			    </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
	
	<script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
	<script>
		var socket = io.connect('http://localhost:3000');
		socket.emit("init", {domain: "${domain}", userId: "${userid}"});
		socket.on("understanding", function(msg){
			var arr = msg.split("|");
			$("#sendScore [name=teacherquestion_no]").val(arr[0]);
			$("#msg").text(arr[1]);
			$('#myModal').modal('show');
		});
		
		$("#sendScore").submit(function(e){
			e.preventDefault();
			$.post("/${domain}/comprehension", $(this).serialize(), function(data){
				console.log(data);
			});
			$('#myModal').modal('hide');
		});
			
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