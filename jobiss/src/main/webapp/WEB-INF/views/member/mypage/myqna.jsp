<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<link rel="stylesheet" type="text/css" href="css/myqna.css">
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
	<div class="mypage_big" style="font-family: 'MICEGothic Bold';">
		<h1>마이페이지</h1>
		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
            <li><a href="mypage.do?&&memail=${member.memail }">MY 자기소개서</a></li>
            <li><a href="myreview.do?&&memail=${member.memail }">MY 리뷰</a></li>
            <li><a href="myqna.do?&&memail=${member.memail }">MY QnA</a></li>
            <li><a href="myfeedback.do?&&memail=${member.memail }">MY FEEDBACK</a></li>
            <li><a href="mycommunity.do?&&memail=${member.memail }">MY 커뮤니티</a></li>
            <li><a href="memberupdateform.do">회원정보수정</a></li>
            <li><a href="memberdeleteform.do">회원탈퇴</a></li>
			</ul>
		</nav>

		<div class="mypage_small">
		<c:choose>
				<c:when test="${not empty qnalist}">
			<table border="1" align="center">
				<h1 align="center">내가 쓴 QnA</h1>
				<tr>
					<th>이메일</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성날짜</th>
				</tr>
				<c:forEach items="${qnalist }" varStatus="loop" var="qna">
					<tr onclick="location.href='#'">
						<td>${qna.memail }</td>
						<td>${qna.qtitle }</td>
						<td>${qna.qcontent }</td>
						<fmt:formatDate value="${qna.qreg}"
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
				<h1 align="center">QnA가 없습니다.</h1>
			</c:otherwise>
			</c:choose>
</body>
</html>