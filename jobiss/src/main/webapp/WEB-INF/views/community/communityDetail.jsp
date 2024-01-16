<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<title>커뮤니티 상세페이지</title>
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

.review-content h4 {
	margin-top: 0;
	color: #007bff;
}

.view-reply {
	/* 이 부분에 박스의 너비와 높이를 조정하는 스타일을 추가하세요 */
	width: 100%; /* 예시로 너비를 100%로 설정 */
	height: 400px; /* 예시로 높이를 400px로 설정 */
	/* 필요에 따라 다른 속성도 조정할 수 있습니다 */
}
.add-review-button {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
	margin-top: 10px;
}

.add-review-button>button {
	border-radius: 10px;
	border: 1 solid black;
	background-color: transparent;
	padding: 5px 10px 5px 10px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="container">
		<h1>공지사항</h1>

		<div class="review-content">
			<h2>제목</h2>
			<p>${community.ctitle}</p>

			<h2>내용</h2>
			<p>${community.ccontent}</p>
			<h4>작성일</h4>
			<p><fmt:formatDate value="${community.creg}" pattern="yyyy-MM-dd" /></p>
		</div>

		<div class="add-review-button">
			<c:if test="${member.memail eq 'master' }">
				<%-- <button type="button"
					onclick="location.href='communityUpdateForm.do?cid=${community.cid}'"
					value="글 수정"> --%>
				<%-- <button onclick="location.href='communityUpdateForm.do?cid=${community.cid}'">글수정</button>	 --%>
				<%-- <button type="button" onclick="location.href='deleteCommunity.do?cid=${community.cid}'" --%>
				<button onclick="location.href='deleteCommunity.do?cid=${community.cid}'">글삭제</button>	
			</c:if>
			<button onclick="location.href='main.do'">Home</button>	
		</div>




		<%-- <div class="review-content">
			<!-- 댓글 내용 -->
			<c:if test="${not empty community}">
				<table border="1" align="center">
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제 버튼</th>
					</tr>

					<c:forEach var="commu" items="${community}" varStatus="loop">
						<tr>
							<td>${content }</td>
							<td>${commu.memail }</td>
							<fmt:formatDate value="${commu.frreg}"
								pattern="yyyy년 MM월 dd일" var="date" />
							<td>${date}</td>

							<c:if test="${member.memail eq commu.memail }">
								<td><input type="button"
									onclick="deletefeedbackreply${commu.cid}"
									value="댓글 삭제"></td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</div> --%>



		<!-- 댓글 작성 폼 -->

		<%-- <form action="feedReplyWrite.do" method="post" class="view-reply">
			<input type="hidden" name="memail"
				value="${sessionScope.member.memail }"> <input type="hidden"
				name="cid" value="${community.cid }">

			<textarea name="frcontent" rows="6" cols="50"
				style="resize: vertical; width: 100%;" placeholder="댓글을 작성해주세요"></textarea>
			<br> <input type="submit" value="댓글 작성">
		</form> --%>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>


















