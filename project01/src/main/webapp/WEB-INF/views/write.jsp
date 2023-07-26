<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<link rel="stylesheet" href="./css/write.css">
<link rel="stylesheet" href="./css/menu.css">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
function check() {
	let title = document.getElementById("title");
	let content = document.getElementById("summernote");
	if (title.value.length == 0 || title.value.replaceAll(" ", "").length == 0) {
		alert("제목을 입력하세요.");
		title.focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="write-div">
		<h1>글쓰기</h1>
		<form action="./write" method="post" onsubmit="return check()">
			<input type="text" name="title" id="title">
			<textarea id="summernote" name="content"></textarea>
			<button class="btn2" type="submit">글쓰기</button>
		</form>
	</div>
	<script type="text/javascript">
    $(document).ready(function() {
        $('#summernote').summernote({
        	height: 400
        });
    });
  </script>
</body>
</html>