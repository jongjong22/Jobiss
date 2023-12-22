<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
	<!-- 세션 로그인이 없을경우 -->
	<c:if test="${empty sessionScope.member.memail}">
	메인입니다.
	<input type="button" value="로그인" onclick="location.href='loginform.do'">
	
	</c:if>
	 <!-- 세션에 로그인 정보가 있을 경우 -->
        <c:if test="${not empty sessionScope.member.memail}">
             ${sessionScope.member.mname}님
            <br>
            <a href="logout.do">로그아웃</a>
        </c:if>
  	<button onclick="location.href='gptMain' ">종윤GPT테스트</button>
  <input type="button" onClick="location.href='masterMemberList.do'" value="창민이동">
</body>
</html>