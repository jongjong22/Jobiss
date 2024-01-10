<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>피드백 작성 게시판</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="./js/feedback.js"></script>
    <link rel="stylesheet" type="text/css" href="css/feedWriteForm.css">
   
</head>

<body>
    <div class="layout">
        <form action="FeedWrite.do" method="post" onsubmit="return check()">
        	<p>WRITE</p>
            <input name="ftitle" id="ftitle" type="text" placeholder="글 제목">
            <textarea name="fcontent" id="fcontent" rows="8" cols="50" placeholder="글 내용"></textarea>
            <div class="form-actions">
                <input type="submit" value="등록">
            	<input type="button" onclick="goBack()" value="취소">
            </div>
        </form>
    </div>
</body>
</html>
