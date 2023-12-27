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


	<script>
		function deletereview(rid) {
		
			var confirmDelete = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete : " + confirmDelete);

			if (confirmDelete) {
				$.ajax({
					type : "POST",
					url : "reviewDelete.do",
					data : {
						"rid" : rid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "reviewList.do";
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
		<h1>리뷰 상세 페이지</h1>

		<div class="review-content">
			<form action="reviewUpdateForm.do" method="post">
				<h2>제목</h2>
				<p>${review.rtitle}</p>

				<h2>내용</h2>
				<p>${review.rcontent}</p>
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
		</form>






		<h2 align="center">댓글</h2>
		<div class="view-reply">
			<!-- 댓글 내용 -->
			<c:if test="${not empty list}">
				<tr>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="reviewreply" items="${list}" varStatus="loop">
					<tr>
						<td>${reviewreply.rrcontent }</td>
						<td>${reviewreply.memail }</td>
						<fmt:formatDate value="${reviewreply.rrreg}"
							pattern="yyyy년 MM월 dd일" var="date" />
						<td>${date}</td>
					</tr>
				</c:forEach>
			</c:if>

			<!--  페이징 처리 -->
			<c:if test="${listcount > 0}">
				<nav aria-label="Page navigation example"
					style="text-align: center;">
					<ul>
						<c:if test="${startPage > 10}">
							<a href="replyList.do?page=${startPage + 1}">이전</a>
						</c:if>
						<c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
							<a href="replyList.do?page=${pageNum}">${pageNum}</a>
						</c:forEach>
						<c:if test="${endPage < pageCount}">
							<a href="replyList.do?page=${endPage + 1}">다음</a>
						</c:if>
					</ul>
				</nav>
			</c:if>



			<!-- 댓글 작성 폼 -->
			<form action="replyWrite.do" method="post" class="view-reply">
			<input type="hidden" value="${member.memail }">
			<input type="hidden" value="${review.rid }">
			
				<textarea name="rrcontent" rows="6" cols="50"
					style="resize: vertical; width: 100%;" placeholder="댓글을 작성해주세요"></textarea>
				<br> <input type="submit" value="댓글 작성">
			</form>

			<div class="action-buttons">
				<c:if test="${member.memail eq reviewreply.memail }">

					<input type="button"
						onclick="location.href='replyUpdate.do?rid=${reviewreply.rrid}'"
						value="댓글 수정">

					<input type="button"
						onclick="deletereviewreply(${reviewreply.rrid})" value="댓글 삭제">
				</c:if>
			</div>
		</div>




	</div>
</body>
</html>
