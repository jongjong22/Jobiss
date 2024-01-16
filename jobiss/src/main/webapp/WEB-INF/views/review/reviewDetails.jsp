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
<link rel="stylesheet" type="text/css" href="css/feedback.css">

<title>리뷰 게시판 상세페이지</title>

</head>
<body>

	<%@ include file="header.jsp" %>

<div class="container">

    <div class="review-content" style="text-align: right;">        
        <h2 class="reviewtitle" style="text-align: center;">${review.rtitle}</h2>
        <p>작성자: ${review.memail}</p>
        <fmt:formatDate value="${review.rreg}" pattern="yyyy년 MM월 dd일" var="date1" />
        <p>작성일: ${date1}</p>
        <p style="text-align: left;">${content}</p>
    </div>

    <div class="add-review-button" style="text-align: right;">
        <c:if test="${member.memail eq review.memail }">
            <button onclick="location.href='reviewUpdateForm.do?rid=${review.rid}'" >글 수정</button>
            <button onclick="deletereview(${review.rid})">글 삭제</button>
        </c:if>
    </div>
</div>


		<!-- 댓글 작성 폼 -->
		<div class="review-content">	
			<form action="replyWrite.do" method="post" class="view-reply" onsubmit="return check1()"> 
			<input type="hidden" id="memail" name="memail" value="${sessionScope.member.memail }"> 
			<input type="hidden" name="rid" value="${review.rid}">
			
			<textarea name="rrcontent" id="rrcontent" rows="6" cols="50" style="resize: vertical; width: 100%;" placeholder="댓글을 작성해주세요"></textarea> 
			<br>  
			
 			<div class="add-review-button">
       				 <button type="submit">댓글 작성</button>
    		</div>
		</form> 
</div>
		
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
