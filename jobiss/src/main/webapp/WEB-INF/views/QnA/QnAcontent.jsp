<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<title>QnA 상세페이지</title>
<style>
/* body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
	/* line-height: 1.6; */
/* } */ 

@font-face {
	font-family: 'MICEGothic Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	font-weight: 700;
	font-style: normal;
}
		    
.container {
	width: 600px;
}


.reviewtitle{
	color: black !important;
	font-size: 20px;
	font-weight: bold;
	font-family: 'MICEGothic Bold';

}

.review-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
	width: 600px !important;
	margin-left: 225px;
	font-family: 'MICEGothic Bold';
}

.review-content h2 {
	margin-top: 0;
	color: #007bff;
}

.view-reply {
	/* 이 부분에 박스의 너비와 높이를 조정하는 스타일을 추가하세요 */
	width: 600px !important; /* 예시로 너비를 100%로 설정 */
	height: 125px; /* 예시로 높이를 400px로 설정 */
	/* 필요에 따라 다른 속성도 조정할 수 있습니다 */
	margin-left: 225px;
	font-family: 'MICEGothic Bold';
}

textarea{
	border-radius: 10px;
	border: 2px solid #808080;
	background-color: #fff;
}


.review-reply{
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
	width: 600px !important;
	margin-left: 225px;
	font-family: 'MICEGothic Bold';
}
</style>
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<script>
		function deleteQnA(qid) {
		
			var confirmDelete = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete :" + confirmDelete);

			if (confirmDelete) {
				$.ajax({
					type : "POST",
					url : "QnAdelete.do",
					data : {
						"qid" : qid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "QnAlist.do";
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
		
		function deleteQnAreply(rqid,qid) {
			
			var confirmDelete1 = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete1 : " + confirmDelete1);

			if (confirmDelete1) {
				$.ajax({
					type : "POST",
					url : "replyDelete.do",
					data : {
						"rqid" : rqid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "QnAcontent.do?qid=" +qid;
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


	<%@ include file="header.jsp"%>

	<div class="container">

		<div class="review-content">		
			<h2 class="reviewtitle">${qna.qtitle}</h2>
			<p>${qna.qcontent}</p>
		</div>

		<div class="action-buttons">
			<c:if test="${member.memail eq qna.memail }">
				<input type="button"
					onclick="location.href='QnAupdateform.do?qid=${qna.qid}'"
					value="글 수정">
				<input type="button" onclick="deleteQnA(${qna.qid})"
					value="글 삭제">
			</c:if>
		</div>

				<!-- 댓글 작성 폼 -->

		<form action="replyWrite.do" method="post" class="view-reply">
			<input type="hidden" name="memail" value="${sessionScope.member.memail }"> 
			<input type="hidden" name="qid" value="${qna.qid }">
			
			<div style="position: relative;">
		        <textarea name="rqcontent" rows="3" cols="50" style="resize: none; width: 100%;"></textarea>
		        <input class="summit" type="submit" value="등록" 
		        	style="position: absolute; bottom: 10px; right: 10px; background-color: #808080;
		        			border: none; border-radius: 5px; color: white;">
		    </div>
		</form>

		
		<div class="review-reply">
			<!-- 댓글 내용 -->
			<c:if test="${not empty Qlist}">
				<table border = "1" align = "center">
					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>삭제 버튼</th>
					</tr>
					<c:forEach var="reviewreply" items="${Qlist}" varStatus="loop">
						<tr>
							<c:if test="${member.memail ne reviewreply.memail }">
							<td>${reviewreply.rqcontent }</td>
							</c:if>
							<c:if test="${member.memail eq reviewreply.memail }">
							<td><input type="text" value="${reviewreply.rqcontent}"></td>
							</c:if>
							<td>${reviewreply.memail }</td>
							<fmt:formatDate value="${reviewreply.rqreg}"
								pattern="yyyy년 MM월 dd일" var="date" />
							<td>${date}</td>
							<c:if test="${member.memail eq reviewreply.memail }">
							<td><input type="button"
									onclick="deletereviewreply(${reviewreply.rqid}, ${qna.qid})" value="댓글 삭제"></td>
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
