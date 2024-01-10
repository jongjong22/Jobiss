<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="./js/review.js"></script>
<link rel="stylesheet" type="text/css" href="css/reviewDetails.css">

<title>리뷰 게시판 상세페이지</title>

</head>
<body>

	<%@ include file="header.jsp" %>

	<div class="container">

		<div class="review-content">		
			<h2 class="reviewtitle">${review.rtitle}</h2>
			<p>${content}</p>
		</div>

		<div class="action-buttons">
			<c:if test="${member.memail eq review.memail }">
				<input type="button"
					onclick="location.href='reviewUpdateForm.do?rid=${review.rid}'"
					value="글 수정">
				<input type="button" onclick="deletereview(${review.rid})"
					value="글 삭제">
			</c:if>
		</div>

				<!-- 댓글 작성 폼 -->

		<form action="replyWrite.do" method="post" class="view-reply">
			<input type="hidden" name="memail" value="${sessionScope.member.memail }"> 
			<input type="hidden" name="rid" value="${review.rid }">
			
			<div style="position: relative;">
		        <textarea name="rrcontent" rows="3" cols="50" style="resize: none; width: 100%;"></textarea>
		        <input class="summit" type="submit" value="등록" 
		        	style="position: absolute; bottom: 10px; right: 10px; background-color: #808080;
		        			border: none; border-radius: 5px; color: white;">
		    </div>
		</form>

		
		<div class="review-reply">
			<!-- 댓글 내용 -->
			<c:if test="${not empty Rlist}">
				<table border = "1" align = "center">
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제 버튼</th>
					</tr>
					<c:forEach var="reviewreply" items="${Rlist}" varStatus="loop">
						<tr>
							<td>${reviewreply.rrcontent }</td>
							<td>${reviewreply.memail }</td>
							<fmt:formatDate value="${reviewreply.rrreg}" pattern="yyyy년 MM월 dd일" var="date" />
							<td>${date}</td>
							
							<c:if test="${member.memail eq reviewreply.memail }">
							<td><input type="button" onclick="deletereviewreply(${reviewreply.rrid}, ${review.rid})" value="댓글 삭제"></td>
							</c:if>
							
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div>
		

	</div>
	
	<%@ include file="footer.jsp"%>

</body>
</html>
