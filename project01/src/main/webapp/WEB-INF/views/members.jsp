<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
<link rel="stylesheet" href="./css/members.css">
<link rel="stylesheet" href="./css/menu.css">
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div>
		<h1>회원 게시판</h1>
		<table>
		<tr>
			<th>회원 번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>주소</th>
			<th>생년월일</th>
			<th>MBTI</th>
			<th>성별</th>
		</tr>
		<c:forEach items="${list }" var="m">
		<tr>
			<td class="td1">${m.no }</td>
			<td class="title">${m.id }</td>
			<td class="td2">${m.name }</td>
			<td class="td2">${m.addr }</td>
			<td class="td1">${m.birth }</td>
			<td class="td1">${m.mbti }</td>
			<td class="td2">${m.gender }</td>
		</tr>
		</c:forEach>
		</table>
		<button onclick="location.href='./signup'">회원가입 하기</button>	
	</div>
</body>
</html>