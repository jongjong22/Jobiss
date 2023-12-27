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
<title>QnA 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>QnA 상세 정보</h1>

		<div class="container_detailmember">
			<table border="1">
				<tr>
					<th>게시글 번호</th>
					<th>이메일</th>
					<th>제목</th>
					<th>내용</th>
					<th>삭제 여부</th>
					<th>작성 날짜</th>
				</tr>

				<tr>
					<td>${qna.qid }</td>
					<td>${qna.memail }</td>
					<td>${qna.qtilte }</td>
					<td>${qna.qcontent }</td>
					<td>${qna.qdrop }</td>
					<fmt:formatDate value="${qna.qreg }" pattern="YYYY년 MM월 dd일"
						var="date" />
					<td>${date }</td>
				</tr>
			</table>
				<button class="button-style" onClick="masterQnADelete('${qna.qid}')">글 삭제</button>
		</div>
	</div>
</body>
</html>