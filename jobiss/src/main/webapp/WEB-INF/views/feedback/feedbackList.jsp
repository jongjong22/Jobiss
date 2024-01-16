<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/feedbackList.css">
<title>피드백 게시판 목록</title>
    
    
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
                        	  <td>
                  			  <c:choose>
                    		    <c:when test="${feedback.fcontent.length() > 30}">
                          		  ${feedback.fcontent.substring(0, 30)}....
                      		  </c:when>
                      		  <c:otherwise>
                           		  ${feedback.fcontent}
                       		 </c:otherwise>
                  			  </c:choose>
              			    </td>
                            
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
