<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<!-- seat Style -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">
<script src="/resources/plugins/jQueryUI/jquery-ui-1.10.3.min.js"></script>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>${domain}좌석배치표</h1>
	<ol class="breadcrumb">
		<li><a href="#">
				<i class="fa fa-fw fa-home"></i>Home
			</a></li>
		<li><a href="#">${domain}</a></li>
		<li class="active">배치도</li>
	</ol>
</section>
<!-- Main content -->
<section class="content">
	<div class="box box-primary">
		<div class="box-header with-border"></div>
		<div class="box-body">
			<div id="seatContainer">
				<div id="seatWrapper">
					<div id="seat">
						<c:forEach items="${list }" var="vo">
							<c:if test="${vo.seat_x != 0}">
								<div class="chair" data-mem_id="${vo.mem_id}" style="margin-left: ${vo.seat_x}px; margin-top: ${vo.seat_y}px;">
									<div class="img">
										<img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}" />
									</div>
									<span class="hidden memId">${vo.mem_id}</span> <span class="name">${vo.mem_name}</span>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div id="lobby">
					<c:forEach items="${list }" var="vo">
						<c:if test="${vo.seat_x == 0}">
							<div class="chair" data-mem_id="${vo.mem_id}" style="position: relative;">
								<div class="img">
									<img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}" />
								</div>
								<div class="name">${vo.mem_name}</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<button id="save" type="button">저장하기</button>
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

    $(".chair").draggable({
        containment: "div#parent",
        cursorAt: {
            top: -2,
            left: -2
        },
        stop: function (e, ui) {
			if((e.toElement.id == "lobby")) {
	        	var id = ui.helper[0].attributes[1].value;
	            var x = null;
	            var y = null;
	            array.push(new Seat(id, x, y));
			}else if((e.toElement.id == "seat")) {
				var id = ui.helper[0].attributes[1].value;
	            var x = e.offsetX;
	            var y = e.offsetY;
	            
	            array.push(new Seat(id, x, y));
			}else {
				alert("잘못된 영역입니다!")
	        	var id = ui.helper[0].attributes[1].value;
	            var x = null;
	            var y = null;
	            array.push(new Seat(id, x, y));
			}
        }
    });

</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>