<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/feedbackList.css">
	
    <title>리뷰게시판 목록</title>
    
</head>

<body class="home">
	<%@ include file="header.jsp" %>
	
    <div class="layout">
        <table>
            <thead>
                <h1 class = "title" align="center">REVIEW</h1>
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
               			    <td>
                  			  <c:choose>
                    		    <c:when test="${review.rcontent.length() > 30}">
                          		  ${review.rcontent.substring(0, 30)}....
                      		  </c:when>
                      		  <c:otherwise>
                           		  ${review.rcontent}
                       		 </c:otherwise>
                  			  </c:choose>
              			    </td>
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
