<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	
    <title>리뷰게시판 목록</title>
	
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
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

        .add-review-button button {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;

        }
        
    </style>
    
</head>

<body class="home">
	<%@ include file="header.jsp" %>
    <div class="layout">
        <table>
            <thead>
                <h1 align="center">후기 게시판</h1>
            </thead>
            <tbody>
                <c:if test="${not empty list}">
                <tr>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                    <c:forEach var="review" items="${list}" varStatus="loop">
                        <tr>
                        	<td><a href="reviewDetails.do?rid=${review.rid}">${review.rtitle }</a></td>
                            <td>${review.rcontent }</td>
                            <td>${review.memail }</td>
                            <fmt:formatDate value="${review.rreg}"
                                pattern="yyyy년 MM월 dd일" var="date" />
                            <td>${date}</td>    
                        </tr>
                    </c:forEach>
                </c:if>
                
                <c:if test="${empty list}">
                	<h1 style="text-align: center; margin-top: 150px; color:red;">작성된 글이 없습니다.</h1>
                </c:if>
            </tbody>
        </table>
        <div class="add-review-button">
            <button onclick="location.href='reviewWriteForm.do'">글작성</button>
            <button onclick="location.href='main.do'">Home</button>
        </div>
        <nav aria-label="Page navigation example">
            <ul>
                <c:if test="${startPage > 10 }">
                    <li><a href="reviewList.do?page=${startPage+1 }">이전</a></li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <li><a href="reviewList.do?page=${pageNum}">${pageNum }</a></li>
                </c:forEach>
                <c:if test="${endPage < pageCount}">
                    <li><a href="reviewList.do?page=${endPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
 <%@ include file="footer.jsp" %>
</body>
</html>
