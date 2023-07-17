<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="./css/board.css">
</head>
<body>
	<h1>보드</h1>
	<img alt="" src="./img/image.png">
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일자</th>
			<th>좋아요</th>
		</tr>
		<c:forEach items="${list }" var="row">
		<tr onclick="location.href='./detail?bno=${row.bno}'">
			<td class="td1">${row.bno }</td>
			<td class="title">${row.btitle }</td>
			<td class="td1">${row.bwrite }</td>
			<td class="td2">${row.bdate }</td>
			<td class="td1">${row.blike }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>