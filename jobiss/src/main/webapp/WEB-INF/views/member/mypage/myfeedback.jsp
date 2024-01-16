<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/myfeedback.css">
<title>마이페이지</title>
<style>
	@font-face {
		font-family: 'MICEGothic Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
		font-weight: 700;
		font-style: normal;
	}

.page>a {
	color: black;
}

.page>a:hover {
	background-color: transparent;
}
 a{
   	font-size: 15px;
 }
   
</style>
</head>
<body>
	<div class="myfeedback_big" style="font-family: 'MICEGothic Bold';">
		<h1>마이페이지</h1>
		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
            <li><a href="mypage.do?&&memail=${member.memail }">MY 자기소개서</a></li>
            <li><a href="myreview.do?&&memail=${member.memail }">MY 리뷰</a></li>
            <li><a href="myqna.do?&&memail=${member.memail }">MY QnA</a></li>
            <li><a href="myfeedback.do?&&memail=${member.memail }">MY FEEDBACK</a></li>
            <li><a href="mycommunity.do?&&memail=${member.memail }">MY 커뮤니티</a></li>
            <li><a href="ps.do">이력서 다운받기</a></li>
            <li><a href="memberupdateform.do">회원정보수정</a></li>
            <li><a href="memberdeleteform.do">회원탈퇴</a></li>
			</ul>
		</nav>

		<div class="myfeedback_small">
		<c:choose>
				<c:when test="${not empty fblist}">
			<table border="1" align="center">
				<h1 align="center">내가 쓴 Feedback</h1>
				<tr>
					<th>이메일</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성날짜</th>
				</tr>
				<c:forEach items="${fblist }" varStatus="loop" var="feedback">
					<tr onclick="location.href='FeedDetails.do?&&fid=${feedback.fid}'">
						<td>${feedback.memail }</td>
						<td>${feedback.ftitle }</td>
						<td>${feedback.fcontent }</td>
						<fmt:formatDate value="${feedback.freg}"
                                pattern="yyyy년 MM월 dd일" var="date" />
                            <td>${date}</td>

					</tr>
				</c:forEach>
			</table>

			<div class="page" align="center">
				<c:if test="${startPage > 10 }">
					<a href="myqna.do?page=${pageNum}.do?page=${startPage+1 }">이전</a>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
					<a href="myqna.do?page=${pageNum}">${pageNum }</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="myqna.do?page=${pageNum}.do?page=${endPage + 1}">다음</a>
				</c:if>
			</div>
			</c:when>
			<c:otherwise>
				<h1 align="center">Feedback 글이 없습니다.</h1>
			</c:otherwise>
			</c:choose>
</body>
</html>