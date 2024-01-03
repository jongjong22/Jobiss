<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	
    <title>QnA 목록</title>
	
    <style>
		@font-face {
		    font-family: 'MICEGothic Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            font-family: 'MICEGothic Bold';
        }
        
        
        .title{
        	font-family: 'MICEGothic Bold';
        }


        
		.layout {
		    width: 800px;
		    margin: 40px auto;
		    text-align: center; /* Center-align the content within the layout */
		    font-family: 'MICEGothic Bold';
		}
		
		table {
		    margin: 40px auto; /* Center-align the table within the layout */
		    width: 800px;
		}
				
		th, td {
			
			padding: 12px 15px;
			border-bottom: 1px solid #ddd;
			text-align: center;
		}
		
		th {
			background-color: #fff;
			text-align: center !important;
			font-size: 20px;
		}
		
		td{
			font-size: 15px;
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
                <h1 class = "title" align="center">QnA</h1>
            </thead>
            <tbody>
                <c:if test="${not empty list}">
                <tr>
                    <th>제목</th>
                    <th>내용</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                    <c:forEach var="QnA" items="${list}" varStatus="loop">
                        <tr>
                        	<td><a href="QnAcontent.do?rid=${qna.qid}">${qna.qtitle }</a></td>
                            <td>${qna.qcontent }</td>
                            <td>${qna.memail }</td>
                            <fmt:formatDate value="${qna.qreg}"
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
            <button onclick="location.href='QnAform.do'">글작성</button>
        </div>
        <nav aria-label="Page navigation example">
            <ul>
                <c:if test="${startPage > 10 }">
                    <li><a href="QnAlist.do?page=${startPage+1 }">이전</a></li>
                </c:if>
                <c:forEach begin="${startPage}" end="${endPage}" var="pageNum">
                    <li><a href="QnAlist.do?page=${pageNum}">${pageNum }</a></li>
                </c:forEach>
                <c:if test="${endPage < pageCount}">
                    <li><a href="rQnAlist.do?page=${endPage + 1}">다음</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
 <%@ include file="footer.jsp" %>
</body>
</html>
