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
	<!-- 유저의 입력이 없는경우 -->
	<c:if test="${result.resultType eq 'requestNull' }">
		<script>
			alert(${"msg"});
			history.go(-1);
		</script>

	</c:if> 
	<!-- GPT의 답변이 없는경우 -->
	<c:if test="${result.resultType eq 'resultNull' }">
		<script>
			alert(${"msg"});
			history.go(-1);
		</script>
	</c:if>
</body>
</html>