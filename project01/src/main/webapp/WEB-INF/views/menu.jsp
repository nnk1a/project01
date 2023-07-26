<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<nav>
	<div id="menu">
		<ul>
			<li onclick="link('index')">메인</li>
			<li onclick="link('board')">게시판</li>
			<li onclick="link('board2')">게시판2</li>
			<li onclick="link('mooni')">문의사항</li>
			<li onclick="link('notice')">공지</li>
			<c:choose>
				<c:when test="${sessionScope.mname eq null}">
					<li class="login" onclick="link('login')">login</li>
				</c:when>
				<c:otherwise>
					<li class="name" onclick="link('myInfo')">${sessionScope.mname }(${sessionScope.mid }) 님</li>
					<li class="login" onclick="link('logout')">logout</li>
				</c:otherwise>
			</c:choose>			
		</ul>
	</div>
	</nav>
	<div style="height: 20px; width: 100%"></div>
	<script>
	function link(url) {
		location.href="./"+url
	}
	</script>