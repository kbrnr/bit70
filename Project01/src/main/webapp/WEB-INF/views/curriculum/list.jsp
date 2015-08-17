<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
    
    <link href="/resources/nojo/css/dropzone.css" rel="stylesheet" type="text/css"/>
    <script src="/resources/nojo/script/dropzone.js"></script>
    <script src="/resources/nojo/script/xlsx.core.min.js"></script>
	
	<style>
	    body{background-color:#ecf0f5;}
	    
	    .icon{
	    	cursor: pointer;
	    	margin-right: 10px;
	    }
	    
	    .tree-node{
	    	cursor: pointer;
	    }
	</style>
</head>

<body>
	<!-- Content Header (Page header) -->
	<section class="content-header">
	    <h1>
	        커리큘럼
	    </h1>
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-fw fa-home"></i>Home</a></li>
	        <li><a href="#">${domain}</a></li>
	        <li class="active">커리큘럼</li>
	    </ol>
	</section>
	
	<!-- Main content -->
	<section class="content">
	    <div class="box box-primary">
	        <div class="box-header with-border">
	            <h3 class="box-title">Blank Box</h3>
	        </div>
	        	
	        <div class="box-body">
	        	<div class="row">
	        		<div class="col-md-3">
	        			 <div class="pull-right">
			                <button id="add" class="btn btn-primary">추가</button>
			                <button id="mod" class="btn btn-primary">수정</button>
			                <button id="del" class="btn btn-primary">삭제</button>
			            </div>
			            <div class="clearfix"></div>
			            <div id="curri">
			            	<ul class="list-group">
							  <li class="tree-node list-group-item">
							  	<span class="icon glyphicon glyphicon-plus"></span>
							  	<span class="name">자바</span>
							  </li>
							  <li class="tree-node list-group-item">
							  	<span class="icon glyphicon glyphicon-plus"></span>
							  	<span class="name">안드로이드</span>
							  </li>
							  <li class="tree-node list-group-item">
							  	<span class="icon glyphicon glyphicon-plus"></span>
							  	<span class="name">오라클</span>
							  </li>
							</ul>
			            
			            </div>
	        		</div>
	        		<div class="col-md-9">
	        		</div>
	        	</div>
	        </div>
	        <!-- /.box-body -->
	    </div>
	</section>
	<!-- /.content -->

<script>
$(".tree-node").click(function(){
	console.log($(this).siblings(".active"));
	$(this).siblings(".active").removeClass("active");
	$(this).addClass("active");
});

function Node(name, no, content) {
	this.name = name;
	this.no = no;
	this.content = content;
}

//트리에 사용될 데이터를 알맞는 형식으로 변경
/* var list = [];
$.ajax({
	async: false,
	dataType: "json",
	url: "/${domain}/curriculum",
	success: function(data){
		var work;
		$(data).each(function() {
			var name = this.curri_name;
			var no = this.curri_no;
			var content = this.curri_content;
			var depth = this.curri_depth;
			var node = new Node(name, no, content);
			if (depth == 1) {
				work = [];
				list.push(node);
			} else {
				if (!work[depth - 2].children) {
					work[depth - 2].children = [];
				}
				work[depth - 2].children.push(node);
			}
			work[depth - 1] = node;
		});  
	}
});

for(var i in list){
	var str = '<ul class="list-group">'
			+ '<li class="list-group-item">'
			
			+ '</li>'
	  		+ '</ul>';
} */



</script>

</body>
</html>