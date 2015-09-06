<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/frameHeader.jsp"%>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<!-- seat Style -->
<link rel="stylesheet" type="text/css" href="/resources/nojo/css/seatStyle.css">

<script>
.space {
	height:50px; 
}
</script>
<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		<small></small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#">
				<i class="fa fa-fw fa-home"></i> Home
			</a></li>
		<li class="active">${domain}</li>
		<li class="active">배치도</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title"><i class="fa fa-fw  fa-line-chart"></i>${domain} 배치도</h3>
		</div>
		<div class="box-body">
			<div id="seatContainer">
				<div id="seatWrapper">
					<div id="seat">
						<c:forEach items="${list }" var="vo">
							<c:if test="${vo.seat_x != 0}">
								<div class="chair" data-mem_id="${vo.mem_id}" style="margin-left: ${vo.seat_x}px; margin-top: ${vo.seat_y}px;">
									<div class="img">${vo.mem_name}<div class="name"></div><span class="hidden memId">${vo.mem_id}</span>
										<img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}" onerror="imgError(this);" />
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
				<div id="lobby">
					<c:forEach items="${list }" var="vo">
						<c:if test="${vo.seat_x == 0}">
							<div class="chair" data-mem_id="${vo.mem_id}" style="margin-left: ${vo.seat_x}px; margin-top: ${vo.seat_y}px;">
								<div class="img">${vo.mem_name}<div class="name"></div><span class="hidden memId">${vo.mem_id}</span>
									<img class="realImg" alt="" src="/${domain}/seat/seatImg?userId=${vo.mem_id}" onerror="imgError(this);" />
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			
			<button id="save" type="button" class="btn btn-primary btn-lg" >저장하기</button>
			
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
    
	//seat 이미지 on 이벤트
	function imgError(image) {
    image.onerror = "";
    image.src = "/resources/nojo/images/noImage.png";
    return true;
	}

</script>

<%@include file="/WEB-INF/views/include/frameFooter.jsp"%>