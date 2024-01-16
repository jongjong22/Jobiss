<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>피드백 작성 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="css/reviewUpdateForm.css">
<script src="./js/feedback.js"></script>

</head>

<body>
	<div class="layout">
		<form action="FeedUpdate.do" method="post">
			<p>피드백 수정</p>
			<input name="ftitle" id="ftitle" type="text" placeholder="글 제목" value ="${feedback.ftitle }">
			<textarea name="fcontent" id="fcontent" rows="8" cols="50" placeholder="글 내용">${content }</textarea>
			
			<input type="submit" onclick="FeedUpdate($('#ftitle').val(),$('#fcontent').val(),${feedback.fid})" value="등록"> 
			<input type="button" onclick="goBack()" value="취소">
		</form>
	</div>
</body>
</html>
