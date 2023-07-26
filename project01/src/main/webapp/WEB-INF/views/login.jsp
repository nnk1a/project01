<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<script type="text/javascript">
let text = "<p>올바른 아이디를 입력하세요.</p>";
function checkID() {
	let msg = document.getElementById("msg");
	msg.innerHTML += "<p>" + document.getElementById("ID").value + " 아이디를 변경했습니다.</p>";
}
function check() {
	let msg = document.getElementById("msg");
	let id = document.getElementById("ID");
	let pw = document.getElementById("PW");
	if(id.value.length == 0){
		alert("ID를 입력하세요.");
		msg.innerHTML = text;
		id.focus();
		return false;
	}
	if(pw.value.length == 0){
		alert("PW를 입력하세요.");
		pw.focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="login">
		<div><h1>login</h1></div>
		<form action="./login" method="post">
		<div class="id"><input type="text" name="ID" id="ID" required="required" placeholder="ID" onchange="checkID()"></div>
		<div class="pw"><input type="password" name="PW" id="PW" required="required" placeholder="PW"></div>
		<div class="bt"><button onclick="return check()">로그인</button><button>회원가입</button></div>
		<span id="msg"></span>
		</form>
	</div>
</body>
</html>