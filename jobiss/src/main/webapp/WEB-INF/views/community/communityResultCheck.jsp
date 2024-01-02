<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 체크</title>
</head>
<body>

	<c:if test="${sizeCheck eq -1}">
		<script>
			alert('설정범위 초과');
			location.href = "community.do";
		</script>
	</c:if>
	
	<c:if test="${extensionCheck eq -1}">
		<script>
			alert('지원하지 않는 파일 형식입니다.');
			location.href = "community.do";
		</script>
	</c:if>

</body>
</html>