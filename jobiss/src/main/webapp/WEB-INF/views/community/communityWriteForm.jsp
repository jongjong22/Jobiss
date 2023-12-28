<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/communityWriteForm.css">
<title>글작성</title>
</head>
<body>
	<div calss="card">
		<div class="card-header1">
			<!-- 커뮤니티를 클릭 시 첫 페이지인 community.do로 이동 -->
			<h1>
				<a href="community.do">커뮤니티</a>
			</h1>
		</div>

		<div class="card-write">
			<div class="myinfo">
				작성자<input type="text" placeholder="이름을 입력 하세요."> 
			</div>

			<div class="title-w">
				제목<input type="text" placeholder="제목을 입력하세요.">
			</div>

			<div class="msg">
				내용
				<textarea placeholder="내용을 입력 하세요."></textarea>
				<input type="file" name="" id="">
			</div>
		</div>
		<div class="btn-w"><a href="#">작성</a></div>
	</div>
</body>
</html>