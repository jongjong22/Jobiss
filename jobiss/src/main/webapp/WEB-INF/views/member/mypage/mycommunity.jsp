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
            <li><a href="myreview.do?&&memail="${review.memail}"">내가 쓴 리뷰</a></li>
            <li><a href="myqna.do">내가 쓴 QnA</a></li>
            <li><a href="myfeedback.do">내가 쓴 FEEDBACK</a></li>
            <li><a href="mycommunity.do">내가 쓴 커뮤니티</a></li>
            <li><a href="memberupdateform.do">회원정보수정</a></li>
            <li><a href="memberdeleteform.do">회원탈퇴</a></li>
        </ul>
    </nav>

	<div class="mypage_small">
		<table border="1" align="center">
			<h1 align="center">내가 쓴 커뮤니티</h1>
		<tr>
			<th>이메일</th>
			<th>제목</th>
			<th>내용</th>
			<th>이미지</th>
			<th>작성날짜</th>
		</tr>
		
</body>
</html>