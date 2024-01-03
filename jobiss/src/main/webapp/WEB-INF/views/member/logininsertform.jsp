<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- css 적용 -->
 <link rel="stylesheet" type="text/css" href="css/loginform.css">

<title>회원가입</title>
</head>
<body>
	<form method="post" action="logininsert.do">
		<table border=1 width="500" align="center" >
			<caption>회원가입</caption>
			<tr >
				<td>아이디</td>
				<td><input type="text" id="memail" name="memail" required placeholder="아이디를 입력하세요.">
				</td>
				<td><input type="button" value="증복검사" name="memail"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mpw" name="mpw" required placeholder="비밀번호를 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="mname" name="mname" required placeholder="이름을 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" id="mphone" name="mphone" maxlength="11" required placeholder="-빼고 번호 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" id="mage" name="mage" maxlength="2"required placeholder="나이를 입력하세요."></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
				<input type="radio" id="male" name="mgender" value="남" required> <label for="male">남</label> 
				<input type="radio" id="female" name="mgender" value="여" required> <label for="female">여</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="maddress" name="maddress" required placeholder="주소를 입력하세요."></td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="text" id="mcareer" name="mcareer" required placeholder="경력을 입력하세요."></td>
			</tr>
			<tr>
				<td>학력</td>
				<td><input type="text" id="meducation" name="meducation" required placeholder="학력을 입력하세요."></td>
			</tr>
			<tr>
				<td>전공</td>
				<td><input type="text" id="mmajor" name="mmajor" required placeholder="전공을 입력하세요."></td>
			</tr>
			<tr>
				<td>자격증</td>
				<td><input type="text" id="mcertification" name="mcertification" required placeholder="자격증을 입력하세요."></td>
			</tr>
			<tr>
				<td>언어</td>
				<td><input type="text" id="mlang" name="mlang" required placeholder="언어를 입력하세요."></td>
			</tr>
			<tr>
				<td>데이터베이스</td>
				<td><input type="text" id="mdb" name="mdb" required placeholder="데이터베이스를 입력하세요."></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit">가입하기</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
		</form>
</body>
</html>