<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/nav.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="css/masterMemberList.css">
<script src="./js/master.js"></script>
<style>
.center {
	margin-left: 46%;
}

.center>li {
	float: left;
	display: block;
	padding: 5px;
}
</style>
<title>회원 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>후기 글 관리</h1>

		<div class="container1">
			<table border="1">
				<tr>
					<th>이메일</th>
					<th>제목</th>
					<th>인증 여부</th>
					<th>삭제 여부</th>
					<th>요청 날짜</th>
				</tr>

				<c:if test="${not empty rlist}">
					<c:forEach var="review" items="${rlist }" varStatus="loop">
						<tr onClick="openReview('${review.rid}')">
							<td>${review.memail }</td>
							<td>${review.rtitle }</td>
							<td>${review.rconfirm }</td>
							<td>${review.rdrop }</td>
							<fmt:formatDate value="${review.rreg }" pattern="YYYY년 MM월 dd일"
								var="date" />
							<td>${date }</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${empty rlist }">
					<h1>작성된 글이 없습니다.</h1>
				</c:if>
			</table>
		</div>

		<ul class="center" align="center">
			<c:if test="${startPage > 10}">
				<li><a href="masterReviewList.do?page=${startPage +1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<li><a href="masterReviewList.do?page=${pageNum}">${pageNum }</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><a href="masterReviewList.do?page=${endPage + 1}">Next</a></li>
			</c:if>
		</ul>

		<div class="search">
			<form action="masterSearchReview.do" method="post">
				<select class="search" name="searchtype">
					<option value="">검색 유형 선택</option>
					<option value="memail">이메일</option>
					<option value="rtitle">제목</option>
					<option value="rcontent">내용</option>
				</select> <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
</body>
</html>