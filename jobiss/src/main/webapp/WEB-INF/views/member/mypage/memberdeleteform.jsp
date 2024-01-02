<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link rel="stylesheet" type="text/css" href="css/mypage.css">
<title>마이페이지</title>
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
</head>
<body>
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
            <li><a href="memberupdateform.do">회원정보수정</a></li>
            <li><a href="memberdeleteform.do">회원탈퇴</a></li>
        </ul>
    </nav>

		<form method="post" action="memberdelete.do">
			<table border=1 width="500" align="center">
				<caption>회원 탈퇴</caption>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="mpw" name="mpw" required
						placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">탈퇴</button>
						<button type="reset">취소</button>
					</td>
				</tr>
				</table>
				
		
</body>
</html>