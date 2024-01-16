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
			<p>작성자: ${feedback.memail}</p>
			<fmt:formatDate value="${feedback.freg}" pattern="yyyy년 MM월 dd일" var="date1" />
			<p>작성일: ${date1}</p>
			<h2>내용</h2>
			<p>${content}</p>
		</div>


		<div class="add-review-button">
			<c:if test="${member.memail eq feedback.memail }">
				<button onclick="location.href='FeedUpdateForm.do?fid=${feedback.fid}'">글 수정</button>
				<button onclick="deletefeedback(${feedback.fid})">글 삭제</button>
			</c:if>
		</div>

		<div class="review-content">
		<!-- 댓글 작성 폼 --> 
		<form action="feedReplyWrite.do" method="post" class="view-reply" onsubmit="return check1()"> 
			<input type="hidden" id="memail" name="memail" value="${sessionScope.member.memail }"> 
			<input type="hidden" name="fid" value="${feedback.fid }">
			
			<textarea name="frcontent" id="frcontent" rows="6" cols="50" style="resize: vertical; width: 100%;" placeholder="댓글을 작성해주세요"></textarea> 
			<br>  
 				<div class="add-review-button">
       				 <button type="submit">댓글 작성</button>
    			</div>
		</form> 
		</div>
		
		<div class="review-reply">
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
							<td>${feedbackreply.frcontent}</td>
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

	</div>


</body>
</html>
