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
<script src="./js/master.js"></script>
<title>QnA 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>QnA 관리</h1>

		<div class="container1">
			<c:if test="${not empty qnalist}">
				<table border="1">
					<tr>
						<th>글 번호</th>
						<th>이메일</th>
						<th>제목</th>
						<th>작성 날짜</th>
						<th>삭제 여부</th>
					</tr>

					<c:forEach var="qna" items="${qnalist }" varStatus="loop">
						<tr onclick="openQnADetails('${qna.qid}')">
							<td>${qna.qid }</td>
							<td>${qna.memail }</td>
							<td>${qna.qtilte }</td>
							<fmt:formatDate value="${qna.qreg}" pattern="YYYY년 MM월 dd일"
								var="date" />
							<td>${date }</td>
							<td>${qna.qdrop }</td>
						</tr>
					</c:forEach>
				</table>
		</div>

		<ul class="center" align="center">
			<c:if test="${startPage > 10}">
				<li><a href="masterQnAList.do?page=${startPage +1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<li><a href="masterQnAList.do?page=${pageNum}">${pageNum }</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><a href="masterQnAList.do?page=${endPage + 1}">Next</a></li>
			</c:if>
		</ul>

		<div class="search">
			<form action="masterQnASearch.do" method="post" onsubmit="return checkSearchForm()">
				<select class="search" name="searchtype">
					<option value="memail">이메일</option>
					<option value="qtilte">제목</option>
					<option value="qcontent">내용</option>
				</select> <input type="text" id="keyword" name="keyword"
					placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
				<input type="submit" value="검색">
			</form>
		</div>
		</c:if>

		<c:if test="${empty qnalist }">
			<h1>작성된 QnA글이 없습니다.</h1>
		</c:if>
	</div>
</body>
</html>