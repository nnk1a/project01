<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="./css/board.css">
<link rel="stylesheet" href="./css/menu.css">
<script type="text/javascript">
function linkPage(pageNo){
	location.href = "./board?pageNo="+pageNo;
}	
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div>
	<h1>게시판</h1>
	<c:choose>
		<c:when test="${fn:length(list) gt 0 }">
		<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list }" var="row">
		<tr onclick="location.href='./detail?bno=${row.bno}'">
			<td class="td1">${row.bno }</td>
			<td class="title">${row.btitle }
			<small>
			<c:if test="${row.commentcount ne 0 }">
				[${row.commentcount }]
			</c:if>
			</small>
			</td> 
			<td class="td1">${row.m_name }</td>
			<td class="td2">${row.bdate }</td>
			<td class="td1">${row.blike }</td>
		</tr>
		</c:forEach>
		</table>
		<div class="page">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
		</div>
		</c:when>
		<c:otherwise>게시글이 없습니다.</c:otherwise>
	</c:choose>
	<!-- 로그인을 했다면 글쓰기 버튼이 보여요 -->	
	<c:if test="${sessionScope.mname ne null }">
		<button class="write-bt" onclick="location.href='./write'">작성하기</button>
	</c:if>
	</div>
</body>
</html>