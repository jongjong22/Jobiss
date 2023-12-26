<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			</form>
		</div>

		<div class="action-buttons">
			<c:if test="${member.memail eq review.memail }">
				<input type="button" onclick="reviewUpdateForm.do(${review.rid})"
					value="글 수정">
				<input type="button" onclick="deletereview(${review.rid})"
					value="글 삭제">
			</c:if>
		
		</div>



	</div>
</body>
</html>
