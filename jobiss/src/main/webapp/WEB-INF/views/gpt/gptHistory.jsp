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
	<%@ include file="header.jsp"%>
	<c:if test="${!empty msg }">
		<script>
			alert(`${msg}`);
		</script>
	</c:if>

	<c:choose>
		<c:when test="${empty gid }">
			<h3>이전이력이 없습니다.</h3>
		</c:when>

		<c:when test="${!empty gid }">
			<h3 style="margin-left: 20px;">세션번호 : ${gid }</h3>
			<h3 style="margin-left: 20px;">대화날짜 : ${gReg }</h3>
		</c:when>
	</c:choose>
	<div class="main">
		<div class="history_main">
			<c:choose>
				<c:when test="${not empty gptList}">
					<div class="history_content">
						<h4>${member.mname }&nbsp;<br>님의이전이력입니다.
						</h4>
						<table border="1" style="font-size: 15px;">
							<tr>
								<th>세션번호</th>
								<th>대화날짜</th>
							</tr>
							<tr>
								<td><select id="gid" name="gid" size="5"
									onchange="selectGidChange(this)">
										<c:forEach items="${gptList}" var="gpt">
											<option value="${gpt.gid}">${gpt.gid}</option>
										</c:forEach>
								</select></td>
								<td><select id="gid" name="gid" size="5"
									onchange="selectGidChange(this)">
										<c:forEach items="${gptList}" var="gpt">
											<option value="${gpt.gid}">${gpt.gptreg}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
					</div>
				</c:when>
				<c:when test="${empty gptList}">
	값이 없습니다.
			</c:when>
			</c:choose>
		</div>
		<script>
			function selectGidChange(select) {
				var select = select.value;
				location.href = 'gptHistory?gid=' + select + '&' + 'type=now';
			}
		</script>


		<div class="container_main">
			<h1>&nbsp; &lt;성장과정&gt;</h1>
			<table border="1" style="text-align: center;">
				<tr>
					<th>No</th>
					<th>내용</th>
					<th>질문일</th>
					<th>선택</th>
				</tr>
				<c:choose>
					<c:when test="${ not empty growList}">
						<form id="growForm" method="post" action="gptSelect">
							<input type="hidden" id="resumeType" name="resumeType" value="g">

							<c:forEach items="${growList }" var="g">
								<tr>
									<td>${g.gptgid }</td>
									<td><textarea rows="4" cols="50" name="gptgcontent">${g.gptgcontent }</textarea></td>
									<td>${g.gptgreg }</td>
									<td><button type="submit">이전내용 적용하기</button></td>
								</tr>
							</c:forEach>
						</form>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">값이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<h1>&nbsp; &lt;성격 장단점&gt;</h1>
			<table border="1">
				<tr>
					<th>No</th>
					<th>내용</th>
					<th>질문일</th>
					<th>선택</th>
				</tr>
				<c:choose>
					<c:when test="${ not empty characterList}">
						<form id="characterForm" method="post" action="gptSelect">
							<input type="hidden" id="resumeType" name="resumeType" value="c">
							<c:forEach items="${characterList }" var="c">
								<tr>
									<td>${c.gptcid }</td>
									<td><textarea rows="4" cols="50" name="gptccontent">${c.gptccontent }</textarea></td>
									<td>${c.gptcreg }</td>
									<td><button type="submit">이전내용 적용하기</button></td>
								</tr>
							</c:forEach>
						</form>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">이전 이력이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<h1>&nbsp; &lt;지원동기&gt;</h1>
			<table border="1">
				<tr>
					<th>No</th>
					<th>내용</th>
					<th>질문일</th>
					<th>선택</th>
				</tr>
				<c:choose>
					<c:when test="${ not empty motiveList}">
						<form id="motiveForm" method="post" action="gptSelect">
							<input type="hidden" id="resumeType" name="resumeType" value="m">
							<c:forEach items="${motiveList }" var="m">
								<tr>
									<td>${m.gptmid }</td>
									<td><textarea rows="4" cols="50" name="gptmcontent">${m.gptmcontent }</textarea></td>
									<td>${m.gptmreg }</td>
									<td><button type="submit">이전내용 적용하기</button></td>
								</tr>
							</c:forEach>
						</form>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">이전 이력이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<h1>&nbsp; &lt;입사포부&gt;</h1>
			<table border="1">
				<tr>
					<th>No</th>
					<th>내용</th>
					<th>질문일</th>
					<th>선택</th>
				</tr>
				<c:choose>
					<c:when test="${not empty planList}">
						<form id="planForm" method="post" action="gptSelect">
							<input type="hidden" id="resumeType" name="resumeType" value="p">
							<c:forEach items="${planList}" var="p">
								<tr>
									<td>${p.gptpid}</td>
									<td><textarea rows="4" cols="50" name="gptpcontent">${p.gptpcontent}</textarea></td>
									<td>${p.gptpreg}</td>
									<td><button type="submit">이전내용 적용하기</button></td>
								</tr>
							</c:forEach>
						</form>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">이전 이력이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	<div class="button_bottom">
		<button type="button"
			onclick="location.href='gptHistory?gid=${gid}&type=prev' ">&lt;</button>
		<button type="button" onclick="location.href='gptMain' ">이전으로</button>
		<button type="button"
			onclick="location.href='gptHistory?gid=${gid}&type=next' ">&gt;</button>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>