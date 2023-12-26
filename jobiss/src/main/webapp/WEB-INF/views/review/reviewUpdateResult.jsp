<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<body>
	<c:if test="${updateResult == 1 }">
		<script type="text/javascript">
			alert("글수정 성공!");
			location.href = "reviewList.do?page=1";
		</script>
	</c:if>

	<c:if test="${updateResult != 1 }">
		<script type="text/javascript">
			alert("글수정 실패");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>