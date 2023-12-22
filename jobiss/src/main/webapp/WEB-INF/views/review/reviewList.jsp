<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    </style>
</head>
<body>
    <div class="layout">
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>제목임니다</td>
                    <td>내용임니다</td>
                </tr>
            </tbody>
        </table>

        <nav aria-label="Page navigation example">
            <ul>
                <c:if test="${page.startPage > page.pagePerBlk }">
                    <li><a href="viewList?page=${page.startPage }">Previous</a></li>
                </c:if>
                <c:forEach begin="${page.startPage + 1}" end="${page.endPage + 1}" var="pageNum">
                    <li><a href="viewList?page=${pageNum}">${pageNum }</a></li>
                </c:forEach>
                <c:if test="${page.endPage < page.totalPage}">
                    <li><a href="viewList?page=${page.endPage + 1}">Next</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</body>
</html>
