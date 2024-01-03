<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<title>리뷰 게시판 상세페이지</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
	line-height: 1.6;
}

.container {
	width: 800px;
	margin: 40px auto;
}

h1 {
	text-align: center;
	color: #333;
}

.review-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
}

.review-content h2 {
	margin-top: 0;
	color: #007bff;
}

.view-reply {
	/* 이 부분에 박스의 너비와 높이를 조정하는 스타일을 추가하세요 */
	width: 100%; /* 예시로 너비를 100%로 설정 */
	height: 400px; /* 예시로 높이를 400px로 설정 */
	/* 필요에 따라 다른 속성도 조정할 수 있습니다 */
}
</style>
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<script>
		function deletefeedback(fid) {
		
			var confirmDelete = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete :" + confirmDelete);

			if (confirmDelete) {
				$.ajax({
					type : "POST",
					url : "FeedbackDelete.do",
					data : {
						"fid" : fid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "FeedbackList.do";
						} else {
							alert("삭제에 실패했습니다.");
						}
					},
					error : function() {
						alert("관리자에게 문의해주세요.");
					}

				});
			}
		}
		
		function deletefeedbackreply(frid,fid) {
			
			var confirmDelete2 = confirm("진짜 삭제하시겠습니까?");

			if (confirmDelete2) {
				$.ajax({
					type : "POST",
					url : "feedReplyDelete.do",
					data : {
						"frid" : frid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "FeedDetails.do?fid="+fid;
						} else {
							alert("삭제에 실패했습니다.");
						}
					},
					error : function() {
						alert("관리자에게 문의해주세요.");
					}

				});
			}
		}
		
	</script>




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
				<input type="button"
					onclick="location.href='FeedUpdateForm.do?fid=${feedback.fid}'"
					value="글 수정">
				<input type="button" onclick="deletefeedback(${feedback.fid})"
					value="글 삭제">
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
