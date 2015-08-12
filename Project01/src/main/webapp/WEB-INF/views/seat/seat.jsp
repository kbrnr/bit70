<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>seat Page</title>
    <link rel="stylesheet" type="text/css" href="/resources/nojo/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/nojo/css/jquery-ui.structure.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/nojo/css/jquery-ui.theme.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="/resources/plugins/jQueryUI/jquery-ui-1.10.3.min.js"></script>

<style>
	/*div{ border: thin solid black;}*/
	
	#container{
		height: 400px;
	}
	#seat{width:40%; float:left;}
	#lobby{width:40%;float:left;}
	.chair{border: thin solid black; width: 80px; position: absolute;}
</style>
</head>
<body>
<h2>${domain}좌석배치표</h2>

<!-- <div id="container">
	<div id="seat">여기는시트
	
	</div>
	<div id="lobby">여기는로비
	</div>
	<div class="chair">여기는 학생</div>


</div> -->


<div id="content">
	<div class="resetDiv">[초기화]</div>
		<div class="seatDiv">
			<ul id="draggable" class="connectedSortable">
				<c:forEach items="${list}" var="vo">
					<c:if test="${vo.seat_x != null}">
						<div class="resultDiv" style="position:absolute; left:${vo.seat_x}px; top:${vo.seat_y}px; ">
			                <li class="draggable ui-state-default">
			                	<span class="hidden memId">${vo.mem_id}</span>
			                	<span>${vo.mem_name}1</span>
			                </li>
		                </div>
					</c:if>
		</c:forEach>
					</ul>
				</div>
			<c:forEach items="${list}" var="vo">
				<c:if test="${vo.seat_x == null}">
					<div class="seatDiv"></div>
				    <div class="listDiv">
				        <ul id="draggable" class="connectedSortable">
				            <c:forEach items="${list}" var="vo">
				                <li class="draggable ui-state-default">
				                
				                	<span class="hidden memId">${vo.mem_id}2</span>
				                	<span>${vo.mem_name}</span>
				                </li>
				            </c:forEach>
				        </ul>
				    </div>
				</c:if>
			
		</c:forEach>
<%-- 		<c:choose>
		    <div class="seatDiv"></div>
		    <div class="listDiv">
		        <ul id="draggable" class="connectedSortable">
		            <c:forEach items="${list}" var="vo">
		                <li class="draggable ui-state-default">
		                
		                	<span class="hidden memId">${vo.mem_id}</span>
		                	<span>${vo.mem_name}</span>
		                </li>
		            </c:forEach>
		        </ul>
		    </div>
	    </c:choose> --%>
	</div> 
 <button id="save" type="button">저장하기</button>

<div class="position">Position</div>
<div id="info" style="width: 200px; height: 40px; background-color: #e0a0a0;"></div>
<br/> 
<script>
    var array = [];
    var xxx = "";
    var draggable = $(".draggable");

    var xcnr = "";
    var ycnr = "";
    
    function Seat(id, x, y){
    	this.mem_id = id;
    	this.seat_x = x;
    	this.seat_y = y;
    }
    
    $("#save").click(function(){
    	$.ajax({
    		method : "post",
    		contentType : "application/json",
    		dataType : "text",
    		data :  JSON.stringify(array),
    		success : function(data){
    			alert("성공");
    		}
    	});
    });

    $(".listDiv").on("drag", function (event) {
        var message = "";
        if ('offsetX' in event) {
            message = "offsetX: " + event.offsetX + ", offsetY: " + event.offsetY + "<br />";
        } else {
            message = "Your browser does not support this example!";
        }
        $("#info").html(message);
    });

    $(".seatDiv").on('drop', function (e) {
    	//console.log(e);
    	/* 
        var draggable = $(".draggable");
        array = [];
        for (var i = 0; i < draggable.length; i++) {
            var id = $("#draggable span:nth(" + (i * 2) + ")").text();
            var x = e.offsetX;
            var y = e.offsetY;
            array.push(new Seat(id, x, y));
	        console.log(id, x, y);
        } */
    });
    //==============================================================================================
    	$(".resultDiv").append(function(e) {
    		appendTo: "resultDiv";
            var x = e.offsetX;
       	 	var y = e.offsetY;
    	});
   	//==============================================================================================	
    
    
    $(".draggable").draggable({
        containment: "div#content",
        cursorAt: {
            top: -1,
            left: -1
        },
        stop: function (e, ui) {
        	console.log(e);
        	console.log(ui);
        	if(!(e.toElement == $(".seatDiv")[0])){
        		//팅구는로직
        		//z-index :1000으로 놓고, 기존에 있던 자리를 저장한  후. 거기서 이동하는 포지션- . 돌아가는 것..
        		 /* $( ".draggable").animate({  revert: true }); */
        		 $(".draggable").draggable({  revert: "invalid" });
        		return;
        	}
        	var li = ui.helper[0];
        	var id = $(li).find(".memId").text();
            var x = e.offsetX;
            var y = e.offsetY;
            array.push(new Seat(id, x, y));
            console.log(array); 
        }
    });

    $(".seatDiv").droppable({
        //tolerance: "intersect"
    });

    $(".draggable").mouseup(function (e) {
        xcnr = e.offsetX;
        ycnr = e.offsetY;
        $(".log").append(xcnr + ',' + ycnr + ' ');
    });
</script>
</body>
</html>