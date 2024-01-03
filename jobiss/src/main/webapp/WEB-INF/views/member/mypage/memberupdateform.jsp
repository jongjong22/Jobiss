<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/loginform.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">

<title>회원수정</title>

<style>
	@font-face {
		font-family: 'MICEGothic Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
		font-weight: 700;
		font-style: normal;
	}
	
	a{
   	font-size: 15px;
   	}
   	
</style>


<script>
	$(function() {
		var dbgender = $('#dbgender').val();
		console.log('db : ' + dbgender);

		if (dbgender === '남') {
			$("#male").prop("checked", true);
		} else if (dbgender === '여') {
			$("#female").prop("checked", true);
		}
		
	});
</script>



</head>
<body>
	<input type="hidden" id="dbgender" value="${member.mgender }">

	<div class="mypage_big" style="font-family: 'MICEGothic Bold';">
		<h1>마이페이지</h1>
		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
				<li><a href="mypage.do">MY 자기소개서</a></li>
				<li><a href="myreview.do">MY 리뷰</a></li>
				<li><a href="myqna.do">MY QnA</a></li>
				<li><a href="myfeedback.do">MY FEEDBACK</a></li>
				<li><a href="mycommunity.do">MY 커뮤니티</a></li>
				<li><a href="memberupdate.do">회원정보수정</a></li>
				<li><a href="memberdeleteform.do">회원탈퇴</a></li>
			</ul>
		</nav>
		<form method="post" action="memberupdate.do">
			<table border=1 width="500" align="center">
				<caption>회원수정</caption>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="memail" name="memail"
						value="${member.memail }" readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="mpw" name="mpw" required
						placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="mname" name="mname"
						value="${member.mname }" ></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" id="mphone" name="mphone" maxlength="11"
						value="${member.mphone }" required
						placeholder="전화번호 입력하세요. - 빼고 입력하세요"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" id="mage" name="mage" maxlength="2"
						value="${member.mage }" required placeholder="나이를 입력하세요."></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" id="male" name="mgender" value="남" required> 남 
						<input type="radio" id="female" name="mgender" value="여" required>여
						</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="maddress" name="maddress"
						value="${member.maddress }" required placeholder="주소를 입력하세요."></td>
				</tr>
				<tr>
					<td>경력</td>
					<td><input type="text" id="mcareer" name="mcareer"
						value="${member.mcareer }" required placeholder="경력을 입력하세요."></td>
				</tr>
				<tr>
					<td>학력</td>
					<td><input type="text" id="meducation" name="meducation"
						value="${member.meducation }" required placeholder="학력을 입력하세요."></td>
				</tr>
				<tr>
					<td>전공</td>
					<td><input type="text" id="mmajor" name="mmajor"
						value="${member.mmajor }" required placeholder="전공을 입력하세요."></td>
				</tr>
				<tr>
					<td>자격증</td>
					<td><input type="text" id="mcertification"
						name="mcertification" value="${member.mcertification }" required
						placeholder="자격증을 입력하세요."></td>
				</tr>
				<tr>
					<td>언어</td>
					<td><input type="text" id="mlang" name="mlang"
						value="${member.mlang }" required placeholder="언어를 입력하세요."></td>
				</tr>
				<tr>
					<td>데이터베이스</td>
					<td><input type="text" id="mdb" name="mdb"
						value="${member.mdb }" required placeholder="데이터베이스를 입력하세요."></td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<button type="submit">수정</button>
						<button type="reset">취소</button>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>