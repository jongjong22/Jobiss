<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <script type="text/javascript" src="path/to/script.js"></script>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<title>마이페이지</title>

<style>
.mypage_main {
	text-align: center;
}

.resume_main {
	display: flex;
	align-items: flex-start;
	margin-left: 15%;
	max-width: 85%;
}

.resume_left {
	flex: 1;
	margin-top: 10%;
	margin-right: 2.5%;
	/* 수정: 우측 마진을 추가하여 .resume_right와의 간격 조절 (전체의 반으로 조절) */
}

.resume_right {
	flex: 0.5; /* 수정: .resume_left보다 작아지도록 수정 (전체의 반으로 설정) */
	margin-top: 10%;
	margin-left: 2.5%;
	/* 수정: 좌측 마진을 추가하여 .resume_left와의 간격 조절 (전체의 반으로 조절) */
	margin-right: 5%;
	/* 수정: 우측 마진을 추가하여 .resume_left와의 간격 조절 (전체의 반으로 조절) */
	width: 100%;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

textarea {
	width: 100%;
}

form {
	display: flex;
	flex-direction: column;
}

button {
	margin-top: 10px;
}
</style>

</head>
<body>
	<div class="mypage_main">
		<h1>마이페이지</h1>
		<h1>내가 쓴 자기소개서</h1>
		<nav>
			<ul>
				<li><a href="main.do">홈</a></li>
				<li><a href="mypage.do?&&memail=${member.memail }">내가 쓴
						자기소개서</a></li>
				<li><a href="myreview.do?&&memail=${member.memail }">내가 쓴
						리뷰</a></li>
				<li><a href="myqna.do?&&memail=${member.memail }">내가 쓴 QnA</a></li>
				<li><a href="myfeedback.do?&&memail=${member.memail }">내가 쓴
						FEEDBACK</a></li>
				<li><a href="mycommunity.do?&&memail=${member.memail }">내가
						쓴 커뮤니티</a></li>
				<li><a href="memberupdateform.do">회원정보수정</a></li>
				<li><a href="memberdeleteform.do">회원탈퇴</a></li>
				<!-- 추가적인 메뉴 항목을 필요에 따라 추가할 수 있습니다. -->
			</ul>
		</nav>
		<div class="resume_main">

			<div class="resume_left">
				<table border="1">
					<form action="#">

						<tr>
							<th>성장과정</th>
							<th><textarea rows="15" cols="100">${ps.psgcontent }</textarea>
							<button type="submit">수정</button>
						</tr>
					<tr>
						<th>성격장단점</th>
						<th><textarea rows="15" cols="100">${ps.psccontent }</textarea>
						<button type="submit">수정</button>
					</tr>
					<tr>
						<th>지원동기</th>
						<th><textarea rows="15" cols="100">${ps.psmcontent }</textarea>
						<button type="submit">수정</button>
					</tr>

					<tr>
						<th>입사후포부</th>
						<th><textarea rows="15" cols="100">${ps.pspcontent }</textarea>
						<button type="submit">수정</button>
					</tr>
					</form>
				</table>
				<!-- left div -->
			</div>



			<!--  grow select 선택 -->
			<div class="resume_right">
				<c:forEach var="gptgrow" items="${gglist }">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptgcontent">${gptgrow.gptgcontent}</textarea>
									<button type="submit">선택</button>성장과정
									<input type="hidden" name="selectedId" value="${gptgrow.gptgid}">
									</td>
							</tr>
						</table>
					</form>
				</c:forEach>
				
				<!-- grow select가 없을 때 -->
				<c:if test="${empty gglist}">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptgcontent">gpt한테 물어보신 성장과정 글이 없습니다</textarea>
									<button type="submit">선택</button> 성장과정</td>
							</tr>
						</table>
					</form>
					
					<!-- 두번째 글 -->
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptgcontent">gpt한테 물어보신 성장과정 글이 없습니다</textarea>
									<button type="submit">선택</button> 성장과정</td>
							</tr>
						</table>
					</form>
				</c:if>





				<!-- character select 선택  -->
				<c:forEach var="gptcharacter" items="${gclist }">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="22"
										name="gptccontent">${gptcharacter.gptccontent }</textarea>
									<button type="submit">선택</button>성격장단점
									  <input type="hidden" name="selectedId" value="${gptcharacter.gptcid}">
                    </td>
									
									
							</tr>
						</table>
					</form>
				</c:forEach>

				
				<!-- character select가 없을 때 -->
				<c:if test="${empty gclist}">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptccontent">gpt한테 물어보신 성격장단점 글이 없습니다</textarea>
									<button type="submit">선택</button>성격장단점</td>
							</tr>
						</table>
					</form>
					
					<!-- 두번째 글 -->
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptccontent">gpt한테 물어보신 성격장단점 글이 없습니다</textarea>
									<button type="submit">선택</button>성격장단점</td>
							</tr>
						</table>
					</form>
				</c:if>

				<!-- motive select 선택 -->
				<c:forEach var="gptmotive" items="${gmlist }">
				<form action="#">
					<table border="1">
						<tr>
							<td><textarea rows="5" cols="50" value="22"
									name="gptmcontent">${gptmotive.gptmcontent }</textarea>
								<button type="submit">선택</button>지원동기
								<input type="hidden" name="selectedId" value="${gptmotive.gptmid}">
								</td>
						</tr>
					</table>
				</form>
				</c:forEach>

				<!-- motive select가 없을 때 -->
				<c:if test="${empty gmlist}">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptmcontent">gpt한테 물어보신 지원동기 글이 없습니다</textarea>
									<button type="submit">선택</button>지원동기</td>
							</tr>
						</table>
					</form>
					
					<!-- 두번째 글 -->
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptmcontent">gpt한테 물어보신 지원동기 글이 없습니다</textarea>
									<button type="submit">선택</button>지원동기</td>
							</tr>
						</table>
					</form>
				</c:if>

				<!-- plan select 선택 -->
				<c:forEach var="gptplan" items="${gplist}">
				<form action="#">
					<table border="1">
						<tr>
							<td><textarea rows="5" cols="50" value="22"
									name="gptgcontent">${gptplan.gptpcontent }</textarea>
								<button type="submit">선택</button>입사후포부
								<input type="hidden" name="selectedId" value="${gptplan.gptpid}">
								</td>
						</tr>
					</table>
				</form>
				</c:forEach>
				
				<!-- plan select가 없을 때 -->
				<c:if test="${empty gplist}">
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptpcontent">gpt한테 물어보신 입사후포부 글이 없습니다</textarea>
									<button type="submit">선택</button>입사후포부</td>
							</tr>
						</table>
					</form>
					
					<!-- 두번째 글 -->
					<form action="#" method="post">
						<table border="1">
							<tr>
								<td><textarea rows="5" cols="50" value="11"
										name="gptpcontent">gpt한테 물어보신 입사후포부 글이 없습니다</textarea>
									<button type="submit">선택</button>입사후포부</td>
							</tr>
						</table>
					</form>
				</c:if>


			
			</div>
		</div>
</body>
</html>