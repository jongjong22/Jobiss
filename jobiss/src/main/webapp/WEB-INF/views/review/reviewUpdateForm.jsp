<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>리뷰 수정 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/board.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

.layout {
	width: 500px;
	margin: 40px auto 0;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.layout form {
	display: flex;
	flex-direction: column;
}

.layout input[type="text"], .layout textarea, .layout input[type="file"]
	{
	width: 100%;
	box-sizing: border-box;
	margin-top: 10px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

.layout input[type="submit"], .layout input[type="reset"] {
	margin-top: 20px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.layout input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
}

.layout input[type="submit"]:hover {
	background-color: #45a049;
}

.layout input[type="reset"] {
	background-color: #f44336;
	color: #fff;
}

.layout input[type="reset"]:hover {
	background-color: #d32f2f;
}
</style>
</head>

<body>
	<div class="layout">
		<form action="reviewUpdate.do" method="post">
		<input type="hidden" value="${review.memail}" name="memail">
		<input type="hidden" value="${page}" name="page">
		<input type="hidden" value="${rid}" name="rid">
		
			<input name="rtitle" id="rtitle" type="text" placeholder="글 제목" value="${review.rtitle}">
			
			<textarea name="rcontent" id="rcontent" rows="8" cols="50" placeholder="글 내용" >${review.rcontent}</textarea>
				
			<input type="file" id="rsuccess" name="rsuccess">
			
			<div class="form-actions">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
</body>
</html>
