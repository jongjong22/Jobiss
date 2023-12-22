<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 폼</title>
</head>

<style>
.container {
	display: flex;
	justify-content: center;
	align-items: flex-end; /* 요소들을 아래쪽으로 정렬합니다 */
}

.box {
	width: 130px;
	height: 100px;
	background-color: #ccc;
	margin: 5px;
	font-size: 13px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	border-radius: 8px; /* 박스의 모서리를 둥글게 만듦 */
}

.box-content {
	text-align: center;
	font-weight: bold; /* 텍스트를 굵게 설정 */
}

.category-tag {
	background-color: #f2f2f2;
	border: 1px solid #ddd;
	padding: 2px 5px;
	border-radius: 8px; /* 모서리를 둥글게 만듦 */
	font-size: 12px;
	margin-bottom: 8px;
	margin-top: 3px;
}

.author {
	margin-top: auto; /* 아래쪽 여백을 최대로 늘려 고정시킵니다 */
	margin-right: 30px; /* 왼쪽으로 이동시킴 */
}

a {
	color: #000;
	text-decoration: none; /* 링크 밑줄 제거 */
}
</style>

<body>
	<p align="center">인기글</p>
	<div class="container">
		<div class="box">
			<div class="category-tag">커리어</div>
			<a href="#"><div class="box-content">실수 줄이는 팁</div></a>
			<div class="author">작성자: 홍길동</div>
			<!-- 작성자 정보를 출력하는 요소 -->
		</div>
		<div class="box">
			<div class="category-tag">취업</div>
			<a href="#"><div class="box-content">다음 카페 모임</div></a>
			<div class="author">작성자: 아무개</div>
			<!-- 작성자 정보를 출력하는 요소 -->
		</div>
		<div class="box">
			<div class="category-tag">토론</div>
			<a href="#"><div class="box-content">자유 토론</div></a>
			<div class="author">작성자: 누구게</div>
			<!-- 작성자 정보를 출력하는 요소 -->
		</div>
	</div>
</body>

</html>