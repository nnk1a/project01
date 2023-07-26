<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="stylesheet" href="./css/menu.css">
<script type="text/javascript">
function edit() {
	if(confirm("수정하시겠습니까?")){
		location.href="./edit?bno=${dto.bno }";
	}
}
</script>
<script type="text/javascript">
function del() {
	let chk = confirm("삭제하시겠습니까?");
	if(chk){
		location.href="./delete?bno=${dto.bno }";
	}
}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="content">
		<div class="title">${dto.btitle }</div>
		<div class="write">
			<div class="bwrite">작성자 : ${dto.m_name }</div>
			<div class="blike">
			<img class="like-img" alt="" src="./img/like.png">${dto.blike }</div>
		</div>
		<div class="date-ip">
			<div class="bdate">작성일자 : ${dto.bdate }</div>
			<div class="bip">${dto.bip }</div>
		</div>
		<div class="bcontent">${dto.bcontent }</div>
		<div class="img">
		<c:if test="${sessionScope.mid eq dto.m_id }">
			<img alt="" src="./img/edit.png" onclick="edit()">&nbsp;
			<img alt="" src="./img/delete.png" onclick="del()">
		</c:if>
			<div class="bt"><button class="btn" onclick="location.href='./board'">목록으로</button></div>
		</div>
	</div>
	<br><br>
	<div class="line"></div>
	<div class="comment">		
		<form action="./reply" method="post">
		<c:if test="${sessionScope.mid != null}">
			${sessionScope.mname} 님
		</c:if>
			<input name="reply" class="reply" type="text" placeholder="댓글을 입력하세요.">
			<button class="input-bt">입력하기</button>
			<input type="hidden" name="bno" value="${dto.bno }">
		</form>
		<table>
		</table>
	</div>
</body>
</html>