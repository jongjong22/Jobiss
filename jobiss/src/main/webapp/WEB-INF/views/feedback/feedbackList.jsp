<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	
    <title>피드백 게시판 목록</title>
	
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        
        .title{
        	font-family: "맑은고딕"
        }

        .layout {
            width: 800px;
            margin: 40px auto;
        }
        
		.layout {
			width: 800px;
			margin: 40px auto;
		}
		
		table {
			width: 100%;
			border-collapse: collapse;
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			border-radius: 8px;
			overflow: hidden;
		}
		
		th, td {
			padding: 12px 15px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}
		
		th {
			background-color: #f2f2f2;
		}
		
		tbody tr:hover {
			background-color: #f9f9f9;
		}
		
		tbody td:first-child {
			font-weight: bold;
		}
		
		nav ul {
			list-style: none;
			display: flex;
			justify-content: center;
			margin-top: 20px;
		}
		
		nav ul li {
			margin-right: 5px;
		}
		
		.add-review-button {
			display: flex;
			justify-content: flex-end;
			margin-bottom: 10px;
			margin-top: 10px;
		}

        .add-review-button > button{
        	border-radius: 10px;
        	border: 1 solid black;
        	background-color: transparent;
        	padding: 5px 10px 5px 10px;
        	
        }
        
    </style>
    
</head>

<body class="home">
	<%@ include file="header.jsp" %>
    <div class="layout">
        <table>
            <thead>
                <h1 class = "title" align="center">FEEDBACK</h1>
            </thead>
            <tbody>
                <c:if test="${not empty Flist}">
                <tr>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                    <c:forEach var="feedback" items="${Flist}" varStatus="loop">
                        <tr>
                        	<td><a href="FeedDetails.do?fid=${feedback.fid}">${feedback.ftitle }</a></td>
                            <td>${feedback.fcontent }</td>
                            <td>${feedback.memail }</td>
                            <fmt:formatDate value="${feedback.freg}"
                                pattern="yyyy년 MM월 dd일" var="date" />
                            <td>${date}</td>    
                        </tr>
                    </c:forEach>
                </c:if>
                
                <c:if test="${empty Flist}">
                	<h1 style="text-align: center; margin-top: 150px; color:red;">작성된 글이 없습니다.</h1>
                </c:if>
            </tbody>
        </table>
        <div class="add-review-button">
            <button onclick="location.href='FeedWriteForm.do'">글작성</button>
        </div>
        <nav aria-label="Page navigation example">
            <ul>
                <c:if test="${startPage > 10 }">
                    <li><a href="FeedbackList.do?page=${startPage+1 }">이전</a></li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <li><a href="FeedbackList.do?page=${pageNum}">${pageNum }</a></li>
                </c:forEach>
                <c:if test="${endPage < pageCount}">
                    <li><a href="FeedbackList.do?page=${endPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
 <%@ include file="footer.jsp" %>
</body>
</html>
