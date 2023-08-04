<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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
//Jquery
$(function() {
	$(".loginBtn").click(function(){
		let checkID = true;
        let checkPW = true;
		let id = $("#ID").val();
		let pw = $("#PW").val();
		if(id.length < 2){
            alert("아이디를 입력하세요. (2글자 이상)");
            $('#ID').focus();
            checkID = !checkID;
        }
        if(pw.length < 4){
            alert("비밀번호를 입력하세요. (4글자 이상)");
            $('#PW').focus();
            checkPW = !checkPW;
        }
        if(checkID && checkPW){
            //alert("로그인을 진행합니다.")
            let form = $('<form></form>');
            form.attr("method", "post");
            form.attr("action", "./login");

            form.append($("<input/>", {type:'hidden', name:'ID', value:id}));
            form.append($("<input/>", {type:'hidden', name:'PW', value:pw}));

            form.appendTo("body");
            form.submit();
        }
	});	
});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="login">
		<div><h1>login</h1></div>
		<form action="./login" method="post" onsubmit="return check()"></form>
		<div class="idDiv"><input type="text" name="ID" id="ID" required="required" placeholder="ID" onchange="checkID()"></div>
		<div class="pwDiv"><input type="password" name="PW" id="PW" required="required" placeholder="PW"></div>
		<div class="bt"><button class="loginBtn" type="button">로그인</button><button onclick="location.href='./signup'">회원가입</button></div>
		<span id="msg"></span>		
	</div>
	
</body>
</html>