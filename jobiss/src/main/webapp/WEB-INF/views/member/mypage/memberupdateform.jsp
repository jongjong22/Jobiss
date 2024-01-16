<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" type="text/css" href="css/myupdate.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">

<title>회원수정</title>

<style>
@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

a {
	font-size: 15px;
}
</style>


<script>
	$(function() {
		var dbgender = $('#dbgender').val().trim();
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
		<h1>회원수정</h1>
		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
				<li><a href="mypage.do">MY 자기소개서</a></li>
				<li><a href="myreview.do">MY 리뷰</a></li>
				<li><a href="myqna.do">MY QnA</a></li>
				<li><a href="myfeedback.do">MY FEEDBACK</a></li>
				<li><a href="ps.do">이력서 다운받기</a></li>
				<li><a href="memberupdate.do">회원정보수정</a></li>
				<li><a href="memberdeleteform.do">회원탈퇴</a></li>
			</ul>
		</nav>
		<form method="post" action="memberupdate.do">
			<input type="hidden" id="memail" name="memail"
				value="${member.memail }">
			<table border=1 width="500" align="center">
				<tr>
					<td>아이디</td>
					<td colspan="2" align="center">${member.memail }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input type="password" id="mpw" name="mpw"
						required placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2"><input type="text" id="mname" name="mname"
						value="${member.mname }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td colspan="2"><input type="tel" id="mphone" name="mphone"
						maxlength="11" required placeholder="-빼고 번호 입력하세요."
						value="${member.mphone }"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td colspan="2"><input type="text" id="mage" name="mage"
						maxlength="2" required placeholder="나이를 입력하세요."
						value="${member.mage }"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td >남<input type="radio" id="male" name="mgender"
						value="남" required> 여 <input type="radio" id="female"
						name="mgender" value="여" required>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="2"><input type="text" id="maddress"
						name="maddress" required placeholder="주소를 입력하세요."
						value="${member.maddress }"></td>
				</tr>
				<tr>
					<td>경력</td>
					<td colspan="2"><input type="text" id="mcareer" name="mcareer"
						required placeholder="경력을 입력하세요." value="${member.mcareer }"></td>
				</tr>
				<tr>
					<td>학교</td>
					<td colspan="2"><input type="text" id="mschoolname"
						name="mschoolname" required placeholder="학교 이름 입력하세요."
						value="${member.mschoolname }"></td>
				</tr>
				<tr>
					<td>전공 및 학력</td>
					<td><input type="text" id="mschoolmajor" name="mschoolmajor"
						required placeholder="전공을 입력하세요." value="${member.mschoolmajor }">
					<select name="mschooltype" id="mschooltype">
							<option value="졸업">졸업</option>
							<option value="재학중">재학중</option>
							<option value="중퇴">중퇴</option>
							<option value="휴학">휴학</option>
					</select></td>
				</tr>
				<tr>
					<td>입학 및 졸업</td>
					<td><input type="date" id="mschoolstartreg"
						name="mschoolstartreg" value="${startDate}"> <input
						type="date" id="mschoolendreg" name="mschoolendreg"
						value="${endDate}"></td>
				</tr>
				<td>희망직종</td>
				<td colspan="2"><input type="text" id="mjobtype"
					name="mjobtype" required placeholder="희망 직종을입력하세요."
					value="${member.mjobtype }"></td>
				<tr>
					<td colspan="4" align="center">
						<button type="submit">수정하기</button>
						<button type="reset">취소</button>
					</td>
				</tr>
			</table>
		</form>
</body>
</html>