<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>이름</th>
			<th>나이</th>
			<th colspan="2">관리</th>
		</tr>
		<c:forEach items="${list }" var="member">
			<tr>
				<td>${member.id }</td>
				<td>${member.name }</td>
				<td>${member.age }</td>
				<td>
					<button onclick="location.href='updateForm.do?id=${member.id }'">수정</button>
				</td>
				<td>
					<button onclick="location.href='delete.do?id=${member.id }'">삭제</button>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<th>글갯수 : ${count }</th>
		</tr>
	</table>
	<button onclick="location.href='insert.do'">작성</button>

</body>
</html>