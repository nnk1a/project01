<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/signup.css">
<link rel="stylesheet" href="./css/menu.css">
<script type="text/javascript">
function check() {
	let id = document.getElementById("ID");
	let pw = document.getElementById("PW");
	let name = document.getElementById("name");
	if (id.value.length < 4 || id.value.replaceAll(" ", "").length == 0) {
		alert("아이디는 4글자 이상 입력하세요.");
		id.focus();
		return false;
	}
	if (pw.value.length < 4 || pw.value.replaceAll(" ", "").length == 0) {
		alert("패스워드는 4글자 이상 입력하세요.");
		pw.focus();
		return false;
	}
	if (name.value.length < 2 || name.value.replaceAll(" ", "").length == 0) {
		alert("닉네임은 2글자 이상 입력하세요.");
		name.focus();
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="signup">
	<form action="./signup" method="post" onsubmit="return check()">
	<h1>singup</h1>
	<div class="signup2">	
	아이디<br>
	<div><input class="signinput" type="text" name="id" id="ID" required="required" placeholder="아이디를 입력하세요."></div>
	<br>
	비밀번호<br>
	<div><input class="signinput" type="password" name="pw1" id="PW" required="required" placeholder="패스워드를 입력하세요."></div>
	<br>
	비밀번호 확인<br>
	<div><input class="signinput" type="password" name="PW-check" id="PW-check" required="required" placeholder="패스워드를 다시 입력하세요."></div>
	<br>
	이름<br>
	<div><input class="signinput" type="text" name="name" id="name" required="required" placeholder="이름을 입력하세요."></div>
	<br>
	주소<br>
	<div><input class="signinput" type="text" name="addr" id="addr" placeholder="주소를 입력하세요."></div>
	<br>
	mbti<br>
	<select name="mbti">
		<option>선택</option>
		<optgroup label="내향">
			<option value="ISTJ">ISTJ</option>
            <option value="ISTP">ISTP</option>
            <option value="ISFJ">ISFJ</option>
            <option value="ISFP">ISFP</option>
            <option value="INTJ">INTJ</option>
            <option value="INTP">INTP</option>
            <option value="INFJ">INFJ</option>
            <option value="INFP">INFP</option>
		</optgroup>
			<optgroup label="외향">
            <option value="ESTJ">ESTJ</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ESFP">ESFP</option>
            <option value="ENTJ">ENTJ</option>
            <option value="ENTP">ENTP</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENFP">ENFP</option>
        </optgroup>
	</select>
	<br>
	생년월일<br>
	<div><input name="birth" class="signinput" type="date" value="1999-12-09"></div>
	<br>
	성별<br>
	<div>
	<input class="gender" type="radio" name="gender" id="m" value="1"><label for="m">남</label>
	<input class="gender" type="radio" name="gender" id="f" value="0"><label for="f">여</label>
	</div>
	</div><br>
	<button class="bt-signup" type="submit">회원가입</button>
	</form>
	</div>
</body>
</html>