<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/signup.css">
<link rel="stylesheet" href="./css/menu.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#idCheck").click(function() {
		let id = $("#ID").val();
		if(id == "" || id.length < 5){
			//alert("아이디는 5글자 이상이어야 합니다.");
			$("#ID").css("border", "1px solid red");
			$("#resultMSG").text("아이디는 5글자 이상이어야 합니다.");
			$("#resultMSG").css("color", "red").css("font-weight", "bold");
			$("#ID").focus();
		} else {
			$.ajax({
				url: "./checkID",
				type: "post",
				data: {"id": id}, //checkID?id=poseidon
				dataType: "json",
				success: function(data){
					//alert(data.result);
					if(data.result == 1){
						$("#ID").css("border", "1px solid red");
						$("#ID").focus();
						$("#resultMSG").text("이미 등록된 아이디입니다.");
						$("#resultMSG").css("color", "red").css("font-weight", "bold");
					} else{
						$("#ID").css("border", "1px solid #FFE0B2");
						$("#resultMSG").text("사용 가능한 아이디입니다.");
						$("#resultMSG").css("color", "green");
					}					
				},
				error: function(request, status, error){
					$("#resultMSG").text("오류가 발생했습니다. 가입할 수 없습니다.");
					//console.log(request);
				}
			});
		}
		return false;
	});
});
</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="signup">
	<form action="./signup" method="post" onsubmit="return check()">
	<h1>singup</h1>
	<div class="signup2">	
	아이디<br>
	<div><input class="signinput" type="text" name="id" id="ID" required="required" placeholder="아이디를 입력하세요.">
	<button id="idCheck">중복확인</button><br><span id="resultMSG"></span></div>
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