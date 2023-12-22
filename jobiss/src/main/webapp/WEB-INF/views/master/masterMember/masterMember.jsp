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
<title>회원 정보</title>
</head>
<body>

	<div class="Big_container">
		<h1>회원 상세 정보</h1>

		<div class="container1">
			<table border="1">
				<tr>
					<th>이메일</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>나이</th>
					<th>성별</th>
					<th>주소</th>
					<th>경력</th>
					<th>학력</th>
					<th>전공</th>
					<th>자격증</th>
					<th>언어</th>
					<th>데이터베이스</th>
					<th>가입 날짜</th>
					<th>삭제 여부</th>
					<th>삭제 버튼</th>
				</tr>

				<tr>
					<td>${member.memail }</td>
					<td>${member.mname }</td>
					<td>${member.mphone }</td>
					<td>${member.mage }</td>
					<td>${member.mgender }</td>
					<td>${member.maddress }</td>
					<td>${member.mcareer }</td>
					<td>${member.meducation }</td>
					<td>${member.mmajor }</td>
					<td>${member.mcertification }</td>
					<td>${member.mlang }</td>
					<td>${member.mdb }</td>
					<fmt:formatDate value="${member.mreg }" pattern="YYYY년 MM월 dd일"
						var="date" />
					<td>${date }</td>
					<td>${member.mdrop }</td>
					<td>
						<button onClick="masterMemberDelete('${member.memail}')">회원
							삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>