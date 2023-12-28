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
<title>피드백 글 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>피드백 관리</h1>

		<div class="container1">
			<c:if test="${not empty flist}">
				<table border="1">
					<tr>
						<th>글 번호</th>
						<th>이메일</th>
						<th>제목</th>
						<th>삭제 여부</th>
						<th>작성 날짜</th>
					</tr>

					<c:forEach var="feedback" items="${flist }" varStatus="loop">
						<tr onClick="openFeedback('${feedback.fid}')">
							<td>${feedback.fid }</td>
							<td>${feedback.memail }</td>
							<td>${feedback.ftitle }</td>
							<td>${feedback.fdrop }</td>
							<fmt:formatDate value="${feedback.freg }" pattern="YYYY년 MM월 dd일"
								var="date" />
							<td>${date }</td>
						</tr>
					</c:forEach>
				</table>
		</div>

		<ul class="center" align="center">
			<c:if test="${startPage > 10}">
				<li><a href="masterFeedbackList.do?page=${startPage +1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<li><a href="masterFeedbackList.do?page=${pageNum}">${pageNum }</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><a href="masterFeedbackList.do?page=${endPage + 1}">Next</a></li>
			</c:if>
		</ul>

		<div class="search">
			<form action="masterSearchFeedback.do" method="post" onsubmit="return checkSearchForm()">
				<select class="search" name="searchtype">
					<option value="memail">이메일</option>
					<option value="ftitle">제목</option>
					<option value="fcontent">내용</option>
				</select> <input type="text" id="keyword" name="keyword"
					placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
				<input type="submit" value="검색">
			</form>
		</div>
		</c:if>
		
		<c:if test="${empty flist }">
			<h1>작성된 글이 없습니다.</h1>
		</c:if>
	</div>
</body>
</html>