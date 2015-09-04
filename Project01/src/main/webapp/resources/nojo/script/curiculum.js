(function (domain){
	function Node(text, href, content) {
		this.text = text;
		this.href = href;
		this.content = content;
	}
	$.getJSON(domain + "/curriculum", function(data) {
		//트리에 사용될 데이터를 알맞는 형식으로 변경
		var list = [];
		var work;
		$(data).each(function() {
			var name = this.curri_name;
			var depth = this.curri_depth;
			var no = this.curri_no;
			var content = this.curri_content;
			var node = new Node(name, no, content);
			if (depth == 1) {
				work = [];
				list.push(node);
			} else {
				if (!work[depth - 2].nodes) {
					work[depth - 2].nodes = [];
				}
				work[depth - 2].nodes.push(node);
			}
			work[depth - 1] = node;
		});
		//트리세팅
		$('#tree').treeview({
			data : list,
			levels : 1,
			onNodeSelected : function(event, data) {
				var p = data;
				while(p.parentId != undefined){
					p = $('#tree').treeview('getParent', p.nodeId);
				}
				parent.$(":hidden[name=curri_no]").val(data.href);
				parent.$(":hidden[name=curri_gpno]").val(p.href);
				$("#curri_title").text(data.text);
				$("#curriContent").text(data.content);
			}
		});
		//기본으로 첫번쨰 트리선택
		$('#tree').treeview('selectNode', 0);
		//검색이벤트
		$("#searchTree").submit(function(e){
			e.preventDefault();
			var text = $("#treeSearchText").val();
			var arr= $('#tree').treeview('search', [ text, {
			  ignoreCase: true,     // case insensitive
			  exactMatch: false,    // like or equals
			  revealResults: true,  // reveal matching nodes
			}]);
			if(arr.length > 0){
				$('#tree').treeview("selectNode", arr[arr.length-1]);
			}
		});
	});
})(domain);