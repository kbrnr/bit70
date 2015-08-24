<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<!-- seat Style -->
    <link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">
    <script src="/resources/plugins/jQueryUI/jquery-ui-1.10.3.min.js"></script>

	<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>${domain} 좌석배치표</h1>
		    <ol class="breadcrumb">
		        <li><a href="#"><i class="fa fa-fw fa-home"></i>Home</a></li>
		        <li><a href="#">${domain}</a></li>
		        <li class="active">배치도</li>
		    </ol>
		</section>
		<!-- Main content -->
		<section class="content">
		    <div class="box box-primary">
		        <div class="box-header with-border">
        		</div>
	        <div class="box-body">
				<div id="container">
					<div id="wrapper">
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
				<button id="save" type="button">저장하기</button>
				
				<div class="position">Position</div>
				<div id="info" style="width: 200px; height: 40px; background-color: #e0a0a0;"></div>
			</div>
		</div>
</section>
<script>
    var array = [];
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

    $(".chair").draggable({
        containment: "div#content",
        cursorAt: {
            top: -2,
            left: -2
        },
        stop: function (e, ui) {
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
//이 이후는 고칠 것.(seat, lobby에 있는 chair Div들이 밖으로 나가면 revert 시키는 것 만들기!!)
			}else if((e.toElement.id == "")) {
				$(".chair").draggable({  revert: true }); 
			}else {
			}
        }
    });

</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>