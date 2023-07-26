<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/edit.css">
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
		<h1>수정하기</h1>
		<form action="./edit" method="post" onsubmit="return check()">
			<input type="text" name="btitle" value="${dto.btitle }" id="title">
			<textarea id="summernote" name="bcontent">${dto.bcontent }</textarea>
			<button class="btn2" type="submit">작성완료</button>
			<input type="hidden" name="bno" value="${dto.bno }">
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