<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/gptHistory.css">
</head>

<body>

	<c:choose>
		<c:when test="${member.memail eq null}">
			<h3>null초기값 : master</h3>
		</c:when>

		<c:when test="${member.memail ne null}">
			<h3>ID : ${member.memail }</h3>
		</c:when>
	</c:choose>
	<c:if test="${not empty gid} ">
	${gid }
		</c:if>
	<c:if test="${gid ne null} ">
	${gid }
		</c:if>
	${gid }
	<div class="container_main">
		<h1>성장과정</h1>
		<table border="1">
			<tr>
				<th>지원번호</th>
				<th>내용</th>
				<th>질문일</th>
				<th>작업</th>
			</tr>
			<c:choose>
				<c:when test="${ not empty growList}">
					<c:forEach items="${growList }" var="g">
						<tr>
							<td>${g.gptgid }</td>
							<td><textarea rows="4" cols="50">${g.gptgcontent }</textarea></td>
							<td>${g.gptgreg }</td>
							<td><button>작업</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">값이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<h1>성격 장단점</h1>
		<table border="1">
			<tr>
				<th>지원번호</th>
				<th>내용</th>
				<th>질문일</th>
				<th>작업</th>
			</tr>
			<c:choose>
				<c:when test="${ not empty characterList}">

					<c:forEach items="${characterList }" var="c">
						<tr>
							<td>${c.gptcid }</td>
							<td><textarea rows="4" cols="50">${c.gptccontent }</textarea></td>
							<td>${c.gptcreg }</td>
							<td><button>작업</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">값이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<h1>지원동기</h1>
		<table border="1">
			<tr>
				<th>지원번호</th>
				<th>내용</th>
				<th>질문일</th>
				<th>작업</th>
			</tr>
			<c:choose>
				<c:when test="${ not empty motiveList}">
					<c:forEach items="${motiveList }" var="m">
						<tr>
							<td>${m.gptmid }</td>
							<td><textarea rows="4" cols="50">${m.gptmcontent }</textarea></td>
							<td>${m.gptmreg }</td>
							<td><button>작업</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">값이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<h1>입사포부</h1>
		<table border="1">
			<tr>
				<th>지원번호</th>
				<th>내용</th>
				<th>질문일</th>
				<th>작업</th>
			</tr>
			<c:choose>
				<c:when test="${not empty planList}">
					<c:forEach items="${planList}" var="p">
						<tr>
							<td>${p.gptpid}</td>
							<td><textarea rows="4" cols="50">${p.gptpcontent}</textarea></td>
							<td>${p.gptpreg}</td>
							<td><button>작업</button></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">값이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>