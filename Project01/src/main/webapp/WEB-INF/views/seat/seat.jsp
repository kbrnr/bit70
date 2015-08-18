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

</head>
<body>
<h2>${domain} 좌석배치표</h2>

<div id="container">
	<div id="seat">
		<c:forEach items="${list }" var="vo">
			<c:if test="${vo.seat_x != 0}">
				<div class="chair" style="margin-left: ${vo.seat_x}px; margin-top: ${vo.seat_y}px;">
					<div class="img"><img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}"/></div>
						<span class="hidden memId">${vo.mem_id}</span>
	                	<span>${vo.mem_name}</span>
				</div>
			</c:if>		
		</c:forEach>
	</div>
	<div id="lobby">
		<c:forEach items="${list }" var="vo">
			<c:if test="${vo.seat_x == 0}">
				<div class="chair" style="position: relative;">
					<div class="img"><img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}" /></div>
						<span class="hidden memId">${vo.mem_id}</span>
	                	<span>${vo.mem_name}</span>
				</div>
			</c:if>		
		</c:forEach>
	</div>
</div>
<br />
<button id="save" type="button">저장하기</button>

<div class="position">Position</div>
<div id="info" style="width: 200px; height: 40px; background-color: #e0a0a0;"></div>

<script>


$(".lol").on("click", function(e) {
    e = e || window.event;

    var target = e.target || e.srcElement,
        rect = target.getBoundingClientRect(),
        offsetX = e.clientX - rect.left,
        offsetY = e.clientY - rect.top;

    console.log([offsetX, offsetY]);
});




    var array = [];
    var xxx = "";
    var chair = $(".chair");

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
    			alert("성공했습니다.");
    		}
    	});
    });

    $("#container").on("drag", function (event) {
        var message = "";
        if ('offsetX' in event) {
            message = "offsetX: " + event.offsetX + ", offsetY: " + event.offsetY + "<br />";
        } else {
            message = "Your browser does not support this example!";
        }
        $("#info").html(message);
    });

    $(".seat").on('drop', function (e) {
    	//console.log(e);
    	/* 
        var chair = $(".chair");
        array = [];
        for (var i = 0; i < chair.length; i++) {
            var id = $("#chair span:nth(" + (i * 2) + ")").text();
            var x = e.offsetX;
            var y = e.offsetY;
            array.push(new Seat(id, x, y));
	        console.log(id, x, y);
        } */
    });
    
    
    $(".chair").draggable({
        containment: "div#content",
        cursorAt: {
            top: -2,
            left: -2
        },
        stop: function (e, ui) {
        	console.log("e");
        	console.log(e);
        	console.log("ui");
        	console.log(ui);
//        	if(!(e.toElement == $(".seat")[0])){
        		//팅구는로직
        		//z-index :1000으로 놓고, 기존에 있던 자리를 저장한  후. 거기서 이동하는 포지션- . 돌아가는 것..
        		 /* $( ".chair").animate({  revert: true }); */
        		 // $(".chair").draggable({  revert: "invalid" }); 
//        		return;
//        	}
			if((e.toElement.id == "lobby")) {
	        	var li = ui.helper[0];
	        	var id = $(li).find(".memId").text();
	            var x = null;
	            var y = null;
	            array.push(new Seat(id, x, y));
			}else if((e.toElement.id == "seat")) {
				var li = ui.helper[0];
	        	var id = $(li).find(".memId").text();
	            var x = e.offsetX;
	            var y = e.offsetY;
	            array.push(new Seat(id, x, y));
			}else if((e.toElement.id == "")) {
				$(".chair").draggable({  revert: true }); 
			}else {
				
			}
            
/*         	var li = ui.helper[0];
        	var id = $(li).find(".memId").text();
            var x = e.offsetX;
            var y = e.offsetY;
            array.push(new Seat(id, x, y));
            console.log(array);  */
            
        }
    });

    $(".seat").droppable({
        //tolerance: "intersect"
    });

    $(".chair").mouseup(function (e) {
        xcnr = e.offsetX;
        ycnr = e.offsetY;
        $(".info").append(xcnr + ',' + ycnr + ' ');
    });
    
    $(".realImg").before(function(e){
    	console.log($(".realImg"));
    	//이미지 타입 지정
    	console.log($(".realImg").context.contentType);
    	$(".realImg").context.contentType.append("image/png");
    /* 	$.ajax({
    		url: "/${domain}/seat/seatImg?userId=a",
    		method : "get",
   			dataType: "text/html",
    		contentType : "image/png",
    		success: function(data){
    		}
    		}); */
    	});
</script>
</body>
</html>