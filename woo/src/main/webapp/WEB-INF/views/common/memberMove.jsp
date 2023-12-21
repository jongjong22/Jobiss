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
	<c:if test="${result eq 1 }">
		<script>
			location.href="main.do"
		</script>
	</c:if>
	
	<c:if test="${result ne 1 }">
		<script>
			alert("수정실패");
		</script>
	</c:if>
	
</body>
</html>