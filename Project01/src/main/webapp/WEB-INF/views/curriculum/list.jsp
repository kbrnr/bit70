<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>민아님 천재</title>
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
    
    <link href="/resources/nojo/css/dropzone.css" rel="stylesheet" type="text/css"/>
    <script src="/resources/nojo/script/dropzone.js"></script>
    <script src="/resources/nojo/script/xlsx.core.min.js"></script>
    <script src="https://cdn.socket.io/socket.io-1.2.0.js"></script>
</head>

<body>
		<section class="content-header">
		    <h1>
		        커리큘럼
		    </h1>
		    <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-fw fa-home"></i>Home</a></li>
		        <li><a href="#">java70</a></li>
		        <li class="active">커리큘럼</li>
		    </ol>
		</section>
		
		<!-- Main content -->
		<section class="content">
		    <div class="box box-default">
		        <div class="box-header with-border">
		            <h3 class="box-title">Blank Box</h3>
		        </div>
		        	
		        <div class="box-body">
		        	<button id="btn">이해됐니?</button>
		        </div>
		        <!-- /.box-body -->
		    </div>
		</section>
		<!-- /.content -->
	
		<div class="modal fade" id="myModal" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">엑셀</h4>
		      </div>
		      <div class="modal-body">
	
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	<script>
	var socket = io.connect('http://localhost:3000');
	socket.on("understanding", function(msg){
		$(".modal-body").html(msg);
		$('#myModal').modal('show');
	});

	$("#btn").click(function (){
		alert("aasdf");
		socket.emit("understanding", "민아야 공부잘하고 잇지??");
	});
	</script>



</body>
</html>