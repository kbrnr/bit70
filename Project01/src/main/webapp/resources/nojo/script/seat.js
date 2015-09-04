//seat 이미지 on 이벤트
function imgError(image) {
    image.onerror = "";
    image.src = "/resources/nojo/images/noImage.png";
    return true;
}

(function (domain){
	$.getJSON(domain + "/seat/ajax", function(list){
			$(list).each(function(){
				var x = this.seat_x;
				var y = this.seat_y;
				var name = this.mem_name;
				var id = this.mem_id;
				var str = "<div class='chair' style='margin-left: "	+ x + "px; margin-top: " + y + "px;'>"
						+ "  <div class='img'>"
						+			name
						+ "	    <img class='realImg' src='" + domain + "/seat/seatImg?userId=" + id + "' onerror='imgError(this);'/>"
						+ "  </div>"
						+ "  <div class='name' data-mem_id='" + id + "' data-trigger='manual' data-placement='left' data-html='true' ></div>"
						+ "</div>";

				var chair = $(str);
				chair.css( { "margin-left" : x+"px", "margin-top" : y+"px"});
				$("#seat").append(str);
			});
			parent.socket.emit("seatReady");
		});
	//Seat에서 on/off표시
	parent.socket.on("onlineUser", function(users){
		for(var i in users){
			console.log("onlineUser: " + users[i]);
			$(".name[data-mem_id='" + users[i] + "']").parent().children().children($(".realImg")).css( { "border" : "4px solid #34ff57"});
		}
	});
	parent.socket.on("offlineUser", function(user){
		console.log("offlineUser: " + user);
		$(".name[data-mem_id='" + user + "']").parent().children().children($(".realImg")).css( {"border" : "2px solid white", "border-radius" : "30px"});
	});
	
	//Seat에서 이해도 점수 표시
	parent.socket.on("seatScore", function(data){
		var target = $(".name[data-mem_id='"+data.mem_id+"']");
		target.attr("data-content", data.comprehension_score);
		target.popover('show');
		setTimeout(function(){
			target.popover('destroy');
		}, 60000);
	});
	
	//Seat에 질문 표시
	parent.socket.on("seatQuestion", function(no){
		var qno = no.qno;
		var href = "<a href='" + domain + "/qna/detail?no="+qno+"'><img class='marginImg' src='/resources/nojo/images/questionMark.png' /></a>";
		var qtarget = $(".name[data-mem_id='"+no.userId+"']").parent().append(href);
 		setTimeout(function(){
			qtarget.children()[2].remove();
		}, 60000);
	});
})(domain);