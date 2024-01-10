<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 수정 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/review.js"></script>
<link rel="stylesheet" type="text/css" href="css/reviewUpdateForm.css">
 
</head>

<body>
	<div class="layout">
		<form action="reviewUpdate.do" method="post">
			<input type="hidden" value="${review.memail}" name="memail">
			<input type="hidden" value="${review.rid}" name="rid">
			 
			<input name="rtitle" id="rtitle" type="text" placeholder="글 제목" value="${review.rtitle}">
			<textarea name="rcontent" id="rcontent" rows="8" cols="50" placeholder="글 내용">${review.rcontent}</textarea>

			<input type="button" onclick="reviewUpdate($('#rtitle').val(),$('#rcontent').val(),${review.rid})" value="등록"> 
			<input type="button" onclick="goBack()" value="취소">
		</form>
	</div>
</body>
</html>
