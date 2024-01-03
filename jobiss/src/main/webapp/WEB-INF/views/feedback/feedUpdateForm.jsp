<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>피드백 작성 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/board.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: rgba(0, 0, 0, 0.7);
	margin: 0;
	padding: 0;
}

.layout {
	width: 800px;
	margin: 120px auto 0;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.layout form {
	display: flex;
	flex-direction: column;
}

.layout input[type="text"], .layout textarea, .layout input[type="file"]
	{
	width: 100%;
	box-sizing: border-box;
	margin-top: 10px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
}

.layout input[type="submit"], .layout input[type="button"] {
	margin-top: 20px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-left: 90px;
}

.form-actions {
	margin-left: 190px;
}

.layout input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
}

.layout input[type="submit"]:hover {
	background-color: #45a049;
}

.layout input[type="button"] {
	background-color: #f44336;
	color: #fff;
}

.layout input[type="button"]:hover {
	background-color: #d32f2f;
}

p {
	margin-top: -3px;
	margin-bottom: -3px;
	font-size: 35px;
	font-family: Alice, Georgia, serif;
	text-align: center;
}
</style>

<script>
	function goBack() {
		history.go(-1);
	}
	
	
	function FeedUpdate(ftitle,fcontent,fid) {
		var Checkconfirm = confirm('업데이트 하시겠습니까?');
		
		if(Checkconfirm){
			$.ajax({
				type : 'POST',
				url : 'FeedUpdate.do',
				data : { ftitle : ftitle,
						 fcontent : fcontent,
						 fid : fid},
				success : function(result){
					if(result === "Y"){
						alert('업데이트 성공');
						location.href = 'FeedDetails.do?fid='+fid;
					}else{
						alert('업데이트 실패');
					}
				},
				error : function(error){
					console.error('Error',error);
				}
			});
		}
		
	}
</script>

</head>

<body>
	<div class="layout">
		<form action="FeedUpdate.do" method="post">
			<p>WRITE</p>
			<input name="ftitle" id="ftitle" type="text" placeholder="글 제목" value ="${feedback.ftitle }">
			<textarea name="fcontent" id="fcontent" rows="8" cols="50" placeholder="글 내용">${content }</textarea>
			
			<input type="button" onclick="FeedUpdate($('#ftitle').val(),$('#fcontent').val(),${feedback.fid})" value="등록"> 
			<input type="button" onclick="goBack()" value="취소">
		</form>
	</div>
</body>
</html>
