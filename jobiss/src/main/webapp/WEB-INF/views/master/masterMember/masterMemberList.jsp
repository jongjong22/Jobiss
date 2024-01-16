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
<title>회원 관리</title>
</head>
<body>


	<c:if test="${not empty loginErr}">
		<script>
			alert('${loginErr}');
			location.href = "main.do";
		</script>

	</c:if>

	<div class="Big_container">
		<h1>회원 관리</h1>

		<div class="container1">
			<c:if test="${not empty mlist}">
				<table border="1">
					<tr>
						<th>이메일</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>나이</th>
						<th>성별</th>
						<th>가입 날짜</th>
						<th>탈퇴 여부</th>
					</tr>

					<c:forEach var="member" items="${mlist }" varStatus="loop">
						<tr onclick="openMemberDetails('${member.memail}')">
							<td>${member.memail }</td>
							<td>${member.mname }</td>
							<td>${member.mphone }</td>
							<td>${member.mage }</td>
							<td>${member.mgender }</td>
							<fmt:formatDate value="${member.mreg }" pattern="YYYY년 MM월 dd일"
								var="date" />
							<td>${date }</td>
							<td>${member.mdrop }</td>
						</tr>
					</c:forEach>
				</table>
		</div>

		<ul class="center" align="center">
			<c:if test="${startPage > 10}">
				<li><a href="masterMemberList.do?page=${startPage +1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
				<li><a href="masterMemberList.do?page=${pageNum}">${pageNum }</a></li>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<li><a href="masterMemberList.do?page=${endPage + 1}">Next</a></li>
			</c:if>
		</ul>

		<div class="search">
			<form action="masterMemberSearch.do" method="post"
				onsubmit="return checkSearchForm()">
				<select class="search" name="searchtype">
					<option value="memail">이메일</option>
					<option value="mname">이름</option>
				</select> <input type="text" id="keyword" name="keyword"
					placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
				<input type="submit" value="검색">
			</form>
		</div>
		</c:if>

		<c:if test="${empty mlist }">
			<h1>가입된 회원이 없습니다.</h1>
		</c:if>
	</div>
</body>
</html>