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
<script src="./js/jquery-3.7.0.min.js"></script>
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
$(function() {
	$(".commentBox").hide();
	$("#openComment").click(function() {
		$(".commentBox").show('slow');
		$("#openComment").remove();
	});
});
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
	<div class="commentsList">
	<div class="line2"><img class="comment-img" alt="" src="./img/comment.png">댓글 <small>[${fn:length(commentsList)}]</small></div>
	<c:choose>
		<c:when test="${fn:length(commentsList) gt 0}">
		<div class="comments">
		<c:forEach items="${commentsList }" var="c">
			<div class="Box">
			<div>
				<div class="n"><b>${c.m_name }</b>  <small>(${c.c_date })</small></div>
				<!-- <div class="delete">삭제</div> -->
			</div>
				<div class="c">${c.c_comment }</div>
			</div>
		</c:forEach>
		</div>
		</c:when>
		<c:otherwise>
		<div><h3>댓글이 없습니다.</h3></div>
		</c:otherwise>
	</c:choose>	
	<div class="line2"></div>
		<form action="./comment" method="post">
		<c:if test="${sessionScope.mid != null}">
		<button type="button" id="openComment">댓글창 열기</button>
		<div class="commentBox">
			<b>${sessionScope.mname}</b> 님
			<input name="comment" id="commenttextarea" class="reply" placeholder="댓글을 입력하세요."></input>
			<button type="submit" id="comment" class="input-bt">입력하기</button>
			<input type="hidden" name="bno" value="${dto.bno }">
		</div>
		</c:if>
		</form>	
	</div>
</body>
</html>