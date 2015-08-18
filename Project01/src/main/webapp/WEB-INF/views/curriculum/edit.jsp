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
	    .list-group-item {
	        padding: 5px;
	    }
	
	    .glyphicon-minus {
	        margin-right: 10px;
	    }
	
	    .glyphicon {
	        cursor: pointer;
	    }
	
	    .box-header {
	        padding-bottom: 3px;
	    }
	
	    .inner {
	        padding-left: 10px;
	        padding-top: 5px;
	        list-style: none;
	    }
	    
	    body{background-color:#ecf0f5;}
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
	        <li><a href="#">java70</a></li>
	        <li class="active">커리큘럼</li>
	    </ol>
	</section>
	
	<!-- Main content -->
	<section class="content">
	    <div class="box box-primary">
	        <div class="box-header with-border">
	        	<button id="save" class="btn bg-olive">저장</button>
	            <button id="excel" class="btn bg-olive" data-toggle="modal" data-target="#myModal">엑셀</button>
	            <button id="add" class="btn bg-olive">추가</button>
	        </div>
	        	
	        <div class="box-body">
	        	<div class="row">
	        		<div id="curri" class="col-md-3">
	        			
	        		</div>
	        		<div class="col-md-9">
	        		</div>
	        	</div>
	        </div>
	        <!-- /.box-body -->
	    </div>
	</section>
	<!-- /.content -->
        
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">엑셀</h4>
	      </div>
	      <div class="modal-body">
	        <input type="file" id="excelUpload">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
<script>
    $("#add").click(function () {
        $("#curri").append(makeTag(true, null, 1, "add"));
    });

    $("#curri").on("click", ".glyphicon-plus", function () {
        var li = $(this).closest("li");
        var depth = parseInt(li.data("depth")) + 1;
        li.append(makeTag(false, null, depth, "add", null, li.data("no")));
    });

    $("#curri").on("click", ".glyphicon-minus", function () {
    	var ul = $(this).closest("ul");
    	remove(ul);
    	
    });
    
    $("#curri").on("change", ".curri_name", function () {
    	var li = $(this).closest("li");
    	var mode = li.data("mode");
    	if(!mode){
    		li.attr("data-mode", "modify");
    	}
    });
    
    $("#save").click(function(){
    	if(!confirm("정말 저장 하시겠습니까?")){ 
    		return;
    	}
    	var list = [];
    	var d = $(".curri");
    	d.each(function(){
    		var mode = $(this).data("mode");
    		if(!mode){return;}
    		var no = $(this).data("no");
    		var pno = $(this).data("pno");
    		var depth = $(this).data("depth"); 
    		var name = $(this).find(".curri_name").val();
    		list.push(new Curriculum(no, pno, name, depth, mode));
    	});
    	console.log(list);
    	if(list.length < 1){
    		return;
    	}
    	$.ajax({
    		url : "/${domain}/curriculum",
	        type : "POST",
	        contentType : "application/json",
	        data : JSON.stringify(list),
	        success : function(data) {
	            alert("가니?");
	        }
    	});
    	location.reload();
    });
    
    $.getJSON("/${domain}/curriculum", function(list){
    	var temp = [];
    	var work;
    	$(list).each(function(){
    		var name = this.curri_name;
    		var depth = this.curri_depth;
    		var no = this.curri_no;
    		if(depth == 1){
    			var root = makeTag(true, name, depth, null, no);
    			work = [root];
    			temp.push(root);
    		}else{
    			var parent = work[depth-2];
    			var child = makeTag(false, name, depth, null, no, this.curri_pno);
    			work[depth-1] = child;
    			parent.children("li:first").append(child);
    		}
    	});
    	for(var i in temp){
    		$("#curri").append(temp[i]);
    	}
    });
    
    
	
	var colors = ["list-group-item-success", "list-group-item-info", "list-group-item-warning", "list-group-item-danger"];


    function Curriculum(no, pno, name, depth, mode) {
    	this.curri_no = no;
    	this.curri_pno = pno;
    	this.curri_name = name;
        this.curri_depth = depth;
        this.mode = mode;
    }
	
	function remove(ul){
		var li = ul.find("li");
		li.each(function(){
			if($(this).data("mode")=="add"){
				$(this).removeAttr("data-mode");
			}else{
				$(this).attr("data-mode", "remove");
			}
		});
	    ul.css("display", "none");
	}
	
	$("#excelUpload").change(handleFile);
	function handleFile(e) {
        var file = e.target.files[0];
        var reader = new FileReader();
        var name = file.name;
        reader.onload = function(e) {
            var data = e.target.result;
            var workbook = XLSX.read(data, {type : 'binary'});
            var sheet_name_list = workbook.SheetNames;
            sheet_name_list.forEach(function(y) {
                var worksheet = workbook.Sheets[y];
                var temp = [];
                var work;
                for (z in worksheet) {
                    if (z[0] === '!')
                        continue;
                    var name = worksheet[z].v;
                    var depth = z.charCodeAt(0) - 64;
            		if(depth == 1){
            			var root = makeTag(true, name, depth, "add");
            			work = [root];
            			temp.push(root);
            		}else{
            			var child = makeTag(false, name, depth, "add");
            			work[depth-1] = child;
            			work[depth-2].children("li:first").append(child);
            		}
                }
                $("#curri > ul").each(function(){
                	remove($(this));
                });
                for(var i in temp){
            		$("#curri").append(temp[i]);
            	}
			});
        };
        reader.readAsBinaryString(file);
    }
	
	function makeTag(isRoot, value, depth, mode, no, pno) {
	    var ulClass = isRoot ? "list-group" : "inner";
	    var liClass = isRoot ? "list-group-item " + colors[parseInt(Math.random()*4)] : "";
	    var divClass = isRoot ? "input-group-lg" : "input-group-sm";
	    var value = value ? "value='" + value + "'" : "";
	    var depth = depth ? "data-depth='" + depth + "' " : "";
	    var mode = mode ? "data-mode='" + mode + "' " : "";
	    var no = no ? "data-no='" + no + "' " : "";
	    var pno = pno ? "data-pno='" + pno + "'" : "";
	    var str = '<ul class="' + ulClass + '">'
	            + '<li class="curri ' + liClass + '" ' + depth + mode + no + pno + '>'
	            + '<div class="input-group ' + divClass + '">'
	            + '<input type="text" class="form-control curri_name" ' + value + '>'
	            + '<div class="input-group-addon">'
	            + '<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'
	            + '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
	            + '</div>'
	            + '</div>'
	            + '</li>'
	            + '</ul>';
	    var tag = $(str);
	    /*
	    if (isRoot) {
	        var dropZone = $('<form action="/" class="dropzone dz-clickable"><div class="dz-message"><span>파일 업로드</span></div></form>');
	        dropZone.dropzone({url: "/"});
	        tag.append($("<li class='list-group-item'>").append(dropZone));
	    }*/
	    return tag; 
	}
</script>

</body>
</html>