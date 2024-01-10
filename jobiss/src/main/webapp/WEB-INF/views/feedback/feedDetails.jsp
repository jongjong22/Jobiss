<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/feedback.css">
<script src="./js/feedback.js"></script>
<title>리뷰 게시판 상세페이지</title>

</head>
<body>

	<%@ include file="header.jsp" %>

	<div class="container">
		<h1>피드백 상세 페이지</h1>

		<div class="review-content">
			<h2>제목</h2>
			<p>${feedback.ftitle}</p>

			<h2>내용</h2>
			<p>${feedback.fcontent}</p>
		</div>

		<div class="action-buttons">
			<c:if test="${member.memail eq feedback.memail }">
				<input type="button" onclick="location.href='FeedUpdateForm.do?fid=${feedback.fid}'" value="글 수정">
				<input type="button" onclick="deletefeedback(${feedback.fid})" value="글 삭제">
			</c:if>
		</div>



		
		<div class="review-content">
			<!-- 댓글 내용 -->
			<c:if test="${not empty Flist}">
				<table border = "1" align = "center">
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제 버튼</th>
					</tr>
					
					<c:forEach var="feedbackreply" items="${Flist}" varStatus="loop">
						<tr>
							<td>${content }</td>
							<td>${feedbackreply.memail }</td>
							<fmt:formatDate value="${feedbackreply.frreg}" pattern="yyyy년 MM월 dd일" var="date" /> 
							<td>${date}</td>
							
							<c:if test="${member.memail eq feedbackreply.memail }">
							<td><input type="button" onclick="deletefeedbackreply(${feedbackreply.frid}, ${feedback.fid})" value="댓글 삭제"></td>
							</c:if>
						</tr> 
					</c:forEach>
 				</table> 
			</c:if>
		</div> 
		
		

 		<!-- 댓글 작성 폼 --> 

 		<form action="feedReplyWrite.do" method="post" class="view-reply"> 
			<input type="hidden" name="memail" value="${sessionScope.member.memail }"> 
			<input type="hidden" name="fid" value="${feedback.fid }">
			
			<textarea name="frcontent" rows="6" cols="50" style="resize: vertical; width: 100%;" placeholder="댓글을 작성해주세요"></textarea> 
			<br>  
 			<input type="submit" value="댓글 작성"> 
		</form> 

	</div>

</body>
</html>
