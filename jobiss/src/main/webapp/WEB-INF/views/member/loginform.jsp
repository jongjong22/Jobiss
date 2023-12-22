<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/login.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- js 불러오기  -->
<script src="js/login.js"></script>

<title>로그인</title>
</head>
<body>
	<div class="loginform">
		<form method="post" action="login.do">
			<label for="username">ID</label> <input type="text" id="memail"
				name="memail" required><br> <label for="password">Password</label>
			<input type="password" id="mpw" name="mpw" required><br>

			<button type="button" id="button" onclick='login($("#memail").val(), $("#mpw").val())'>로그인</button>
			<input type="button" id="memberinsert" name="memberinsert"
				value="회원가입" onclick="location.href='logininsertform.do'">
				
					<!-- Google 로그인 아이콘과 버튼 -->
					<!-- 만들거임 ㅠㅠ -->
			</div>
		</form>
	</div>
</body>
</html>