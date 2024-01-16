<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="./js/mypage.js"></script>

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<!-- 자기소개서 css -->
<link rel="stylesheet" type="text/css" href="css/myps.css">
<title>마이페이지</title>

<style>
@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

a {
	font-size: 15px;
}
</style>

</head>
<body>
	<div class="mypage_main" style="font-family: 'MICEGothic Bold';">

		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
				<li><a href="mypage.do?&&memail=${member.memail }">MY 자기소개서</a></li>
				<li><a href="myreview.do?&&memail=${member.memail }">MY 리뷰</a></li>
				<li><a href="myqna.do?&&memail=${member.memail }">MY QnA</a></li>
				<li><a href="myfeedback.do?&&memail=${member.memail }">MY
						FEEDBACK</a></li>
				<li><a href="ps.do">이력서 다운받기</a></li>
				<li><a href="memberupdateform.do">회원정보수정</a></li>
				<li><a href="memberdeleteform.do">회원탈퇴</a></li>
				<!-- 추가적인 메뉴 항목을 필요에 따라 추가할 수 있습니다. -->
			</ul>
		</nav>
		<div class="resume_main">
			<h1>마이페이지</h1>

			<div class="caption_main">
				<div class="caption_left">
					<h2>내가 쓴 자기소개서</h2>
				</div>
				<div class="caption_right" style="margin-right: 40px;">
					<h2>Gpt가 추천한 글</h2>
				</div>
			</div>


			<div class="grow_main">
				<table class="grow_left">
					<tr>
						<th>성장과정</th>
						<td style="text-align: center; "><textarea rows="19"
								cols="100" name="grow">${ps.psgcontent}</textarea>
							<button type="button"
								onclick="psgupdate(${ps.pid},$('textarea[name=grow]').val() )"
								align="center">수정</button></td>
					</tr>
				</table>
				<div class="grow_right_main">
					<c:forEach var="gptgrow" items="${gglist }">
						<form id="growform">
							<table class="grow_right">
								<tr>
									<td><textarea rows="5" cols="50" value="11"
											name="gptgcontent">${gptgrow.gptgcontent}</textarea>
										<button type="button"
											onclick="updateGptgrow(${gptgrow.gptgid })">선택</button>성장과정</td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
				<!-- grow select가 없을 때 -->
				<c:if test="${empty gglist}">
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="7" cols="50" value="11"
										name="gptgcontent">gpt한테 물어보신 성장과정 글이 없습니다</textarea> 성장과정</td>
							</tr>
						</table>
					</form>

					<!-- 두번째 글 -->
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="6" cols="50" value="11"
										name="gptgcontent">gpt한테 물어보신 성장과정 글이 없습니다</textarea> 성장과정</td>
							</tr>
						</table>
					</form>
				</c:if>

			</div>
			<!-- grow_main 끝 -->

			<div class="grow_main">
				<!-- character_main 시작  -->
				<table class="grow_left">
					<tr>
						<th>성격장단점</th>
						<td style="text-align: center;"><textarea rows="19"
								cols="100" name="character">${ps.psccontent}</textarea>
							<button type="button"
								onclick="pscupdate(${ps.pid},$('textarea[name=character]').val() )"
								align="center">수정</button></td>
					</tr>
				</table>
				<div class="grow_right_main">
					<c:forEach var="gptcharacter" items="${gclist }">
						<form id="growform">
							<table class="grow_right">
								<tr>
									<td><textarea rows="5" cols="50" value="11"
											name="gptccontent">${gptcharacter.gptccontent}</textarea>
										<button type="button"
											onclick="updateGptcharacter(${gptcharacter.gptcid })">선택</button>성격장단점</td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
				<!-- grow select가 없을 때 -->
				<c:if test="${empty gclist}">
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="7" cols="50" value="11"
										name="gptccontent">gpt한테 물어보신 성격장단점 글이 없습니다</textarea> 성격장단점</td>
							</tr>
						</table>
					</form>

					<!-- 두번째 글 -->
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="6" cols="50" value="11"
										name="gptccontent">gpt한테 물어보신 성격장단점 글이 없습니다</textarea> 성격장단점</td>
							</tr>
						</table>
					</form>
				</c:if>

			</div>
			<!-- character_main 끝 -->


			<div class="grow_main">
				<!-- motive_main 시작  -->
				<table class="grow_left">
					<tr>
						<th>지원동기</th>
						<td style="text-align: center;"><textarea rows="19"
								cols="100" name="motive">${ps.psmcontent}</textarea>
							<button type="button"
								onclick="psmupdate(${ps.pid},$('textarea[name=motive]').val() )"
								align="center">수정</button></td>
					</tr>
				</table>
				<div class="grow_right_main">
					<c:forEach var="gptmotive" items="${gmlist }">
						<form id="growform">
							<table class="grow_right">
								<tr>
									<td><textarea rows="5" cols="50" value="11"
											name="gptmcontent">${gptmotive.gptmcontent}</textarea>
										<button type="button"
											onclick="updateGptmotive(${gptmotive.gptmid })">선택</button>지원동기</td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
				<!-- grow select가 없을 때 -->
				<c:if test="${empty gmlist}">
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="7" cols="50" value="11"
										name="gptmcontent">gpt한테 물어보신 지원동기 글이 없습니다</textarea> 지원동기</td>
							</tr>
						</table>
					</form>

					<!-- 두번째 글 -->
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="6" cols="50" value="11"
										name="gptmcontent">gpt한테 물어보신 지원동기 글이 없습니다</textarea> 지원동기</td>
							</tr>
						</table>
					</form>
				</c:if>
			</div>
			<!-- motive_main 끝 -->

			<div class="grow_main">
				<!-- plan_main 시작  -->
				<table class="grow_left">
					<tr>
						<th>입사후포부</th>
						<td style="text-align: center;"><textarea rows="19"
								cols="100" name="plan">${ps.pspcontent}</textarea>
							<button type="button"
								onclick="pspupdate(${ps.pid},$('textarea[name=plan]').val() )"
								align="center">수정</button></td>
					</tr>
				</table>
				<div class="grow_right_main">
					<c:forEach var="gptplan" items="${gplist }">
						<form id="growform">
							<table class="grow_right">
								<tr>
									<td><textarea rows="5" cols="50" value="11"
											name="gptpcontent">${gptplan.gptpcontent}</textarea>
										<button type="button"
											onclick="updateGptplan(${gptplan.gptpid })">선택</button>입사후포부</td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</div>
				<!-- grow select가 없을 때 -->
				<c:if test="${empty gplist}">
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="7" cols="50" value="11"
										name="gptpcontent">gpt한테 물어보신 입사후포부 글이 없습니다</textarea> 입사후포부</td>
							</tr>
						</table>
					</form>

					<!-- 두번째 글 -->
					<form id="growform">
						<table class="grow_right">
							<tr>
								<td><textarea rows="6" cols="50" value="11"
										name="gptpcontent">gpt한테 물어보신 입사후포부 글이 없습니다</textarea> 입사후포부</td>
							</tr>
						</table>
					</form>
				</c:if>
			</div>
			<!-- plan_main 끝 -->


		</div>
		<!-- resume_main 끝 -->
	</div>
	<!-- mypage_main 끝 -->
</body>
</html>