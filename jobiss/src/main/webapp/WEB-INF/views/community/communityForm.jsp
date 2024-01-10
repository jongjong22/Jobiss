<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/community.css">

<title>커뮤니티 폼</title>

</head>

<body class="home">
	<%@ include file="header.jsp"%>

	<div class="back"></div>

	<div class="box1">
		<p class="content" align="center">Weekly Best</p>
		<div class="container">
			<div class="box">
				<div class="category-tag">커리어</div>
				<a href="#"><div class="box-content">실수 줄이는 팁</div></a>
				<div class="author">작성자: 홍길동</div>
				<!-- 작성자 정보를 출력하는 요소 -->
			</div>
			<div class="box">
				<div class="category-tag">취업</div>
				<a href="#"><div class="box-content">다음 카페 모임</div></a>
				<div class="author">작성자: 아무개</div>
				<!-- 작성자 정보를 출력하는 요소 -->
			</div>
			<div class="box">
				<div class="category-tag">토론</div>
				<a href="#"><div class="box-content">자유 토론</div></a>
				<div class="author">작성자: 누구게</div>
				<!-- 작성자 정보를 출력하는 요소 -->
			</div>
		</div>
	</div>
	<!-- box1 -->

	<div class="spacer"></div>

	<div class="layout">
	<form action="">
		<select name="searchtype">
			<option>검색유형</option>
			<option value="memail">작성자</option>
			<option value="ctitle">제목</option>
			<option value="creg">작성일</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어를 입력하세요." maxlength="10">
		<input type="submit" value="검색">
	</form>	
		<table>
			<!-- <thead>
                <h1 align="center">커뮤니티</h1>
            </thead> -->
			<tbody>
				 <c:if test="${not empty communityList}">
				<tr>
					<th>조회수</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="community" items="${communityList}" varStatus="loop">
					<tr>
						<td>${community.creadcount }</td>
						<td><a href="communityDetail.do?cid=${community.cid }">${community.ctitle }</a></td>
						<td>${community.memail }</td>
						<td>${community.creg }</td>
					</tr>
				</c:forEach>
				  </c:if>

				<c:if test="${empty communityList}">
                	<h1 style="text-align: center; margin-top: 150px; color:red;">작성된 글이 없습니다.</h1>
                </c:if>
			</tbody>
		</table>
		<div class="add-review-button">
			<button onclick="location.href='communityWriteForm.do'">글작성</button>
			<button onclick="location.href='main.do'">Home</button>
		</div>
		<nav aria-label="Page navigation example">
			<ul>
				<c:if test="${startPage > 10 }">
					<li><a href="community.do?page=${startPage+1 }">이전</a></li>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
					<li><a href="community.do?page=${pageNum}">${pageNum }</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<li><a href="community.do?page=${endPage + 1}">다음</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>