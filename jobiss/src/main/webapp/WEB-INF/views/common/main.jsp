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
		<tr>
			<th>글갯수 : ${count }</th>
		</tr>
	</table>
	<button onclick="location.href='insert.do'">작성</button>

</body>
</html>