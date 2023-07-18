<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="content">
		<div class="title">제목 : ${dto.btitle }</div>
		<div class="write">
			<div class="bwrite">작성자 : ${dto.bwrite }</div>
			<div class="blike">좋아요 : ${dto.blike }</div>
		</div>
		<div class="date">작성일자 : ${dto.bdate }</div>
		<div class="bcontent">${dto.bcontent }</div>
	</div>
</body>
</html>