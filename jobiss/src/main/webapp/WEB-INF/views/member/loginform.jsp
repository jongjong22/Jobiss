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

<style>
  body {
    margin: 0;
    padding: 0;
    background: url('images/background.jpg') no-repeat center center fixed; 
    background-size: cover;
    font-family: 'Arial', sans-serif;
    height: 100%;
    overflow: hidden;
  }
  
   body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7); 
  }

  .loginform {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.7); /* 배경 색상 및 투명도 조절 */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px 0px #000000;
  }
  
  p{
  	margin-top: -3px;
  	margin-bottom: -3px;
  	font-size: 40px;
  	font-family: Alice, Georgia, serif;
  }

  /* 나머지 스타일은 기존 코드에서 가져옵니다. */
</style>

</head>
<body>
	<div class="loginform">
		<form method="post" action="login.do">
			<p>Jobiss</p>
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