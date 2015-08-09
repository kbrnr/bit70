<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/resources/nojo/css/dropzone.css" rel="stylesheet" type="text/css"/>
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/nojo/script/xlsx.core.min.js"></script>
    <script src="/resources/nojo/script/dropzone.js"></script>
</head>
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
        padding-left: 15px;
        padding-top: 5px;
        list-style: none;
    }
</style>
<body>


<div class="content-wrapper">
    <div class="container">
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
            <div class="box box-default">
                <div class="box-header with-border">
                    <h3 class="box-title">Blank Box</h3>
                    <div class="pull-right">
                    	<button id="save" class="btn bg-olive">저장</button>
                        <button class="btn bg-olive">엑셀</button>
                        <button id="add" class="btn bg-olive">추가</button>
                    </div>
                    <div class="clearfix"></div>
                </div>
                	
                <div class="box-body"></div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.container -->
</div>
<!-- /.content-wrapper -->

<script>
    $("#add").click(function () {
        $(".box-body").append(makeTag(true, null, 1));
    });

    $(".box-body").on("click", ".glyphicon-plus", function () {
        var li = $(this).closest("li");
        var depth = parseInt(li.find("[name=curri_depth]").val()) + 1;
        li.append(makeTag(false), null, depth);
    });

    $(".box-body").on("click", ".glyphicon-minus", function () {
        $(this).closest("ul").remove();
    });
    
    $("#save").click(function(){
    	var list = [];
    	var d = $(".box-body ul li .input-group");
    	d.each(function(){
    		var curri_name = $(this).children("[name=curri_name]").val();
    		var curri_depth = $(this).children("[name=curri_depth]").val();
    		list.push(new Curriculum(curri_name, curri_depth));
    	});
    	
    	$.ajax({
    		url : "/${domain}/curriculum",
	        type : "POST",
	        contentType : "application/json",
	        data : JSON.stringify(list),
	        success : function(data) {
	            alert("가니?");
	        }
    	});
    });
    
    $.getJSON("/${domain}/curriculum", function(list){
    	var temp = [];
    	var work;
    	$(list).each(function(){
    		var name = this.curri_name;
    		var depth = this.curri_depth;
    		if(depth == 1){
    			var root = makeTag(true, name, depth);
    			work = [root];
    			temp.push(root);
    		}else{
    			var child = makeTag(false, name, depth);
    			work[depth-1] = child;
    			work[depth-2].children("li:first").append(child);
    		}
    	});
    	for(var i in temp){
    		$(".box-body").append(temp[i]);
    	}
    });
	
    var colors = ["list-group-item-success", "list-group-item-info", "list-group-item-warning", "list-group-item-danger"];
	function makeTag(isRoot, value, depth) {
	    var ulClass = isRoot ? "list-group" : "inner";
	    var liClass = isRoot ? "class='list-group-item " + colors[parseInt(Math.random()*4)] + "'" : "";
	    var divClass = isRoot ? "input-group-lg" : "input-group-sm";
	    var value = value ? "value='" + value + "'" : "";
	    var depth = depth ? "value='" + depth + "'" : "";
	    var str = '<ul class="' + ulClass + '">'
	            + '<li ' + liClass + '>'
	            + '<div class="input-group ' + divClass + '">'
	            + '<input type="text" class="form-control" name="curri_name" ' + value + '>'
	            + '<input type="hidden" class="form-control" name="curri_depth" ' + depth + '>'
	            + '<div class="input-group-addon">'
	            + '<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'
	            + '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
	            + '</div>'
	            + '</div>'
	            + '</li>'
	            + '</ul>';
	    var tag = $(str);
	    if (isRoot) {
	        var dropZone = $('<form action="/" class="dropzone dz-clickable"><div class="dz-message"><span>파일 업로드</span></div></form>');
	        dropZone.dropzone({url: "/"});
	        tag.append($("<li class='list-group-item'>").append(dropZone));
	    }
	    return tag;
	}
    
    function Curriculum(name, depth) {
        this.curri_name = name;
        this.curri_depth = depth;
    }

    function handleFile(e) {
        var file = e.target.files[0];
        var reader = new FileReader();
        var name = file.name;
        reader.onload = function(e) {
            var data = e.target.result;
            var workbook = XLSX.read(data, {
                type : 'binary'
            });
            var sheet_name_list = workbook.SheetNames;
            sheet_name_list.forEach(function(y) {
                var worksheet = workbook.Sheets[y];
                var list = [];
                var work;
                for (z in worksheet) {
                    if (z[0] === '!')
                        continue;
                    var depth = z.charCodeAt(0) - 64;
                    var curri = new Curriculum(worksheet[z].v, depth);
                    if (depth == 1) {
                        work = [];
                        list.push(curri);
                    } else {
                        if (!work[depth - 2].children) {
                            work[depth - 2].children = [];
                        }
                        work[depth - 2].children.push(curri);
                    }
                    work[depth - 1] = curri;
                }
			});
        };
        reader.readAsBinaryString(file);
    }
    

</script>

</body>
</html>