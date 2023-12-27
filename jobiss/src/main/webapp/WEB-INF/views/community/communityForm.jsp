<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>커뮤니티 폼</title>

<style>

.container {
	display: flex;
	justify-content: center;
	align-items: flex-end; /* 요소들을 아래쪽으로 정렬합니다 */
	
}

.box {
	width: 200px;
	height: 150px;
	background-color: white;
	border: 2px solid black;
	margin: 5px;
	font-size: 16px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	border-radius: 15px; /* 박스의 모서리를 둥글게 만듦 */
	margin-right: 50px;
}

.box:last-child {
  margin-right: 0;
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
	font-size: 15px;
	margin-bottom: 8px;
	margin-top: 15px;
}

.author {
	margin-top: auto; /* 아래쪽 여백을 최대로 늘려 고정시킵니다 */
	margin-right: 30px; /* 왼쪽으로 이동시킴 */
}

a {
	color: #000;
	text-decoration: none; /* 링크 밑줄 제거 */
}

.back{
	margin-top: -20px;
	width: 100%;
	height: 150px;
	background-color: #333232;
	position: relative;
}

.box1 {
    position: absolute; 
    top: 280px; 
    width: 100%; 
  }


.content{
	color: white;
	font-size: 20px;
	font-weight: bold;
	font-family: "맑은고딕";
	
}

 .spacer {
    height: 500px; 
  }


	
</style>
</head>

<body class = "home">
	<%@ include file="header.jsp" %>
	
	<div class="back">
		
	</div>
	
	<div class="box1">
	<p class="content" align="center">인기글</p>
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
	</div><!-- box1 -->
	
	<div class="spacer"></div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>