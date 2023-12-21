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
	<h1>수정수정</h1>
	<form action="update.do" method="post">
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>나이</th>
				<th colspan="2">관리</th>
			</tr>
			<tr>
				<td><input type="text" value="${member.id }" name="id" id="id"
					readonly="readonly"></td>
				<td><input type="text" value="${member.name }" name="name"
					id="name"></td>
				<td><input type="text" value="${member.age }" name="age"
					id="age"></td>
				<td>
					<button type="submit">확인</button>
				</td>
				<td>
					<button type="button" onclick="location.href='main.do' ">처음으로</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>