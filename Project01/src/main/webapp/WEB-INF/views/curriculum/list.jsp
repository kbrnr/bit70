<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/nojo/script/xlsx.core.min.js"></script>
<style>
div {
	float: left;
}
</style>
</head>
<body>
	<div>
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a href="#">
					Home
					<span class="badge">14</span>
				</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>
	</div>
	<div>
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation"><a href="#">Home</a></li>
			<li role="presentation" class="active"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>
	</div>
	<div>
		<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><a href="#">Messages</a></li>
		</ul>
	</div>

	<div class="col-md-9">
		<input type="file" id="fileInput" />
	</div>




	<script>
		function Curriculum(value, depth) {
			this.value = value;
			this.depth = depth;
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
					$.ajax({
						type : "POST",
						contentType : "application/json",
						data : JSON.stringify(list),
						success : function(data) {
							alert("가니?");
						}
					});
				});
			};
			reader.readAsBinaryString(file);
		}
		$("#fileInput").change(handleFile);
	</script>



</body>
</html>