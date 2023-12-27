<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link rel="stylesheet" type="text/css" href="css/mypage.css">
<title>마이페이지</title>
</head>
<body>
	<div class="mypage_big">
	<h1>마이페이지</h1>
	<nav>
        <ul>
            <li><a href="main.do">홈</a></li>
            <li><a href="mypage.do">내가 쓴 자기소개서</a></li>
            <li><a href="myreview.do">내가 쓴 리뷰</a></li>
            <li><a href="myqna.do">내가 쓴 QnA</a></li>
            <li><a href="myfeedback.do">내가 쓴 FEEDBACK</a></li>
            <li><a href="mycommunity.do">내가 쓴 커뮤니티</a></li>
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