<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="login">
		<div><h1>login</h1></div>
		<form action="./login" method="post">
		<div class="id"><input type="text" name="ID" required="required" placeholder="ID"></div>
		<div class="pw"><input type="password" name="PW" required="required" placeholder="PW"></div>
		<div class="bt"><button>로그인</button><button>회원가입</button></div>
		</form>
	</div>
</body>
</html>