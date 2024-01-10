<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="./js/member.js"></script>

<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/loginform.css">

<title>회원가입</title>
</head>
<body>

	<form method="post" action="logininsert.do">
		<table border=1 width="500" align="center">
			<caption>회원가입</caption>
			<tr>
				<td>아이디</td>
				<td><input type="text" id="memail" name="memail"
					required placeholder="아이디를 입력하세요.">
					<div id="result"></div></td>
				<td colspan="2"><button type="button" onclick="idcheck()">중복체크</button></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="mpw" name="mpw" required
					placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="mname" name="mname" required
					placeholder="이름을 입력하세요."></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" id="mphone" name="mphone" maxlength="11"
					required placeholder="-빼고 번호 입력하세요."></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" id="mage" name="mage" maxlength="2"
					required placeholder="나이를 입력하세요."></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" id="male" name="mgender" value="남"
					required> <label for="male">남</label> <input type="radio"
					id="female" name="mgender" value="여" required> <label
					for="female">여</label></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="2"><input type="text" id="maddress" name="maddress" required
					placeholder="주소를 입력하세요."></td>
					<td>
					 <button type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
					</td>
			</tr>
			<tr>
				<td>경력</td>
				<td><input type="text" id="mcareer" name="mcareer" required
					placeholder="경력을 입력하세요."></td>
			</tr>
			<tr>
				<td>학교 및 전공</td>
				<td><input type="text" id="mschoolname" name="mschoolname"
					required placeholder="학교 이름 입력하세요."></td>
				<td><input type="text" id="mschoolmajor" name="mschoolmajor"
					required placeholder="전공을 입력하세요."></td>
				<td><select name="mschooltype" id="mschooltype">
						<option value="졸업">졸업</option>
						<option value="재학중">재학중</option>
						<option value="중퇴">중퇴</option>
						<option value="휴학">휴학</option>
				</select></td>
			</tr>
			<tr>
				<td>입학 및 졸업</td>
				<td><input type="date" id="mschoolstartreg" name="mschoolstartreg"></td>
				<td colspan="2"><input type="date" id="mschoolendreg" name="mschoolendreg"></td>
			</tr>
			<td>희망직종</td>
			<td><input type="text" id="mjobtype" name="mjobtype" required
				placeholder="희망 직종을 입력하세요."></td>
			<tr>
				<td colspan="4" align="center">
					<button type="submit">가입하기</button>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>