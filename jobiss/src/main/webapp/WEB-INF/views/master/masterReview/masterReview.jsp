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
<title>후기 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>후기 상세 정보</h1>

		<div class="container_detailmember">
			<table border="1">
				<tr>
					<th>게시글 번호</th>
					<th>이메일</th>
					<th>제목</th>
					<th>내용</th>
					<th>파일</th>
					<th>인증 여부</th>
					<th>삭제 여부</th>
					<th>요청 날짜</th>
				</tr>

				<tr>
					<td>${review.rid }</td>
					<td>${review.memail }</td>
					<td>${review.rtitle }</td>
					<td>${review.rcontent }</td>
					<td>${review.rsuccess }</td>
					<td>${review.rconfirm }</td>
					<td>${review.rdrop }</td>
					<fmt:formatDate value="${review.rreg }" pattern="YYYY년 MM월 dd일"
						var="date" />
					<td>${date }</td>
				</tr>
			</table>
				<button onClick="masterReviewDelete('${review.rid}')">후기삭제</button>
				<button onClick="masterReviewConfirm('${review.rid}')">글 작성 수락</button>
		</div>
	</div>
</body>
</html>