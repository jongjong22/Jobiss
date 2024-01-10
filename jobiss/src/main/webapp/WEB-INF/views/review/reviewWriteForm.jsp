<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성 게시판</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script> 
    <script src="./js/review.js"></script>
    <link rel="stylesheet" type="text/css" href="css/reviewWriteForm.css">
</head>

    

<body>

<%@ include file="header.jsp"%>

    <div class="layout">
        <form action="reviewWrite.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
            <input name="rtitle" id="rtitle" type="text" placeholder="글 제목">
            <textarea name="rcontent" id="rcontent" rows="8" cols="50" placeholder="글 내용"></textarea>
          	<input type="file" id="rsuccess1" name="rsuccess1">	
            <div class="form-actions">
                <input type="submit" value="등록">
                <input type="button" onclick="goBack()" value="취소">
            </div>
        </form>
     
     
    </div>
    
<%@ include file="footer.jsp"%>
</body>
</html>
