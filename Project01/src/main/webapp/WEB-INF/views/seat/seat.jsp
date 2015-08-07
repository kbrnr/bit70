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
<script src="/resources/nojo/script/jquery-ui.min.js"></script>

</head>
<body>
	<h2>${domain}좌석배치표</h2>
	<!-- Ajax나 Angular js로 만들어야 하는 초기화다!!! -->
	<div class="resetDiv">[초기화]</div>
	<div id="content">
	<!-- onmouseup="UpdateInfo (event);" -->
		<div class="seatDiv" ></div>
		<!-- ondrag="UpdateInfo (event);" -->
		<div class="listDiv">
			<ul id="draggable" class="connectedSortable">
				<c:forEach items="${list}" var="vo">
					<li class="draggable ui-state-default"><span>${vo.mem_name}</span></li>
				</c:forEach>
			</ul>
			<%-- 				<c:forEach items="${list}" var="vo">
				<div class="draggable ui-widget-content">${vo.mem_name}</div>
				</c:forEach> --%>
		</div>
	</div>
	<input type="submit" value="저장하기" />
	<div class="position">Position</div>
	<div id="info" style="width: 200px; height: 40px; background-color: #e0a0a0;"></div>
	<div class="axix" style="width: 200px; height: 40px; background-color: #e0a0a0;"></div>
	<br />
	<script>
		/* 	var gridster;
		 var log = document.getElementById('log');
		
		 gridster = $("listDiv ul").gidster({
		 widget_base_dimensions: [100, 55],
		 widget_margins: [5, 5],
		 draggable: {
		 start: function(e, ui, $widget) {
		 log.innerHTML = 'START position: ' + ui.position.top +' '+ ui.position.left + "<br >" + log.innerHTML;
		 },

		 drag: function(e, ui, $widget) {
		 log.innerHTML = 'DRAG offset: ' + ui.pointer.diff_top +' '+ ui.pointer.diff_left + "<br >" + log.innerHTML;
		 },

		 stop: function(e, ui, $widget) {
		 log.innerHTML = 'STOP position: ' + ui.position.top +' '+ ui.position.left + "<br >" + log.innerHTML;
		 }
		 }
		 }).data('gridster');
		 */
		 var xcnr = "";
		 var ycnr = "";
		 
/* 				$(".draggable").draggable({
					containment : "div#content",
					cursorAt : {
						top : 0,
						left : 32
					}
				}); */
/* 				$(".listDiv").on("drag", function UpdateInfo(event){
					var message = "";
					if ('offsetX' in event) {
						message = "offsetX: " + event.offsetX + ", offsetY: "
								+ event.offsetY + "<br />";
					$(".axix").append("offsetX: " + event.offsetX + ", offsetY: " + event.offsetY);
					} else {
						message = "Your browser does not support this example!";
					}
					var info = document.getElementById("info");
					info.innerHTML = message;
				}); */
				$(".listDiv").on("drag", function UpdateInfo(event){
					var message = "";
					if ('offsetX' in event) {
						message = "offsetX: " + event.offsetX + ", offsetY: "
								+ event.offsetY + "<br />";
				$(".seatDiv").bind('drop', function (e){
					$(".axix").text("offsetX: " + e.offsetX + ", offsetY: " + e.offsetY);
				})
					/* $(".axix").append("offsetX: " + event.offsetX + ", offsetY: " + event.offsetY); */
					} else {
						message = "Your browser does not support this example!";
					}
					var info = document.getElementById("info");
					info.innerHTML = message;
				});
				
				$(".draggable").draggable({
					containment : "div#content",
					cursorAt : {
						top : -1,
						left : -1
					},
					stop: function(event, ui){
						
					}
				});
				
				$(".seatDiv").droppable({
					tolerance: "intersect"
				});

				$(".draggable").mouseup(function(e){
 					xcnr = e.offsetX;
					ycnr = e.offsetY; 
 					$(".log").append(xcnr+ ',' + ycnr+' ');
 					/* e.returnValue = true; */
					/* $(".log").append = 'STOP position: '+ e.offsetX +' '+ e.offsetY + "<br >"; */
				});

/* 				$(".draggable").parent().parent().parent().children("#seatDiv").mouseup(function(e){
					console.log(e);
				}); */
		/* 			$( ".draggable" ).draggable( "option", "refreshPositions", true ); */

		/* 		$(".draggable").droppable({
		 drop: function( event, ui ) {
		
		 }
		 });
		
		 $(".draggable").on("drop", function( event, ui){
		
		 }); */

		/* 		on("drop", function(event, ui){
		 offset {
		 log.innerHTML = 'STOP position: ' + offset.left
		 + ' ' + offset.top + "<br >"
		 + log.innerHTML;
		 }
		 }); */
		 
	/* 	function UpdateInfo(event) {
			var message = "";
			if ('offsetX' in event) {
				message = "offsetX: " + event.offsetX + ", offsetY: "
						+ event.offsetY + "<br />";
			} else {
				message = "Your browser does not support this example!";
			}

			var info = document.getElementById("info");
			info.innerHTML = message;
		} */

		/* 		var offsetX = (event.offsetX || event.layerX);
		 var offsetY = (event.offsetY || event.layerY); */
	</script>
</body>
</html>