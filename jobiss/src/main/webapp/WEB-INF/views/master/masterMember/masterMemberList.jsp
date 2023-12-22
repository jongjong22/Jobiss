<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="css/masterMemberList.css">
<script src="./js/master.js"></script>
<title>회원 관리</title>
</head>
<body>

	<div class="Big_container">
		<h1>회원 관리</h1>

		<div class="container1">
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

				<c:if test="${not empty mlist}">
					<c:forEach var="member" items="${mlist }" varStatus="loop">
						<tr onclick = "openMemberDetails('${member.memail}')">
							<td>${member.memail }</td>
							<td>${member.mname }</td>
							<td>${member.mphone }</td>
							<td>${member.mage }</td>
							<td>${member.mgender }</td>
							<fmt:formatDate value="${member.mreg }" pattern="YYYY년 MM월 dd일" var="date"/>
							<td>${date }</td>
							<td>${member.mdrop }</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${empty mlist }">
					<h1>가입된 회원이 없습니다.</h1>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>