<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/nav.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="css/masterMemberList.css">
<script src="./js/master.js"></script>
<title>커뮤니티 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>커뮤니티 상세 정보</h1>

		<div class="container_detailmember">
			<table border="1">
				<tr>
					<th>게시글 번호</th>
					<th>이메일</th>
					<th>제목</th>
					<th>내용</th>
					<th>이미지</th>
					<th>조회수</th>
					<th>삭제 여부</th>
					<th>요청 날짜</th>
				</tr>

				<tr>
					<td>${community.cid }</td>
					<td>${community.memail }</td>
					<td>${community.ctitle }</td>
					<td>${community.ccontent }</td>
					<td><img src="./images/${community.cimage }" width="50" height="50"
										class="toggle-image">
					</td>
					<td>${community.creadcount }</td>
					<td>${community.cdrop }</td>
					<fmt:formatDate value="${community.creg }" pattern="YYYY년 MM월 dd일"
						var="date" />
					<td>${date }</td>
				</tr>
			</table>
				<button class="button-style" onClick="masterCommunityDelete('${community.cid}')">커뮤니티 글 삭제</button>
		</div>
	</div>
</body>
</html>