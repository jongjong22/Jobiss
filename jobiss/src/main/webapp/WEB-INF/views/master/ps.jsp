<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style type="text/css">
/* 폰트 불러오기 */
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800&display=swap')
	;

@charset "UTF-8";

* { /*   * = 문서 전체 적용    */
	font-family: 'Montserrat';
}

body, h1, h2 {
	margin: 0px;
	padding: 0px;
}

body {
	min-width: fit-content;
}

h1 {
	font-size: 36px;
	font-weight: bold; /* 두께 지정 */
	margin-bottom: 8px;
}

h2 {
	font-size: 20px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	border-bottom: 1px solid #ebebeb; /* 줄긋기 */
	padding-bottom: 5px;
}

.name-text {
	font-size: 16px;
	color: #7c7c7c;
	font-weight: bold;
}

.about-me-text {
	font-size: 10px;
	line-height: 16px; /* 줄간 간격 */
}

.mainbox {
	width: 610px;
	padding: 30px;
	margin: 30px;
	margin-right: auto;
	margin-left: auto; /* 박스 가운데 정렬 */
	border: 1px solid #ebebeb; /* 직선 넣기 */
	box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15); /* 박스 그림자 */
}

section {
	margin-bottom: 24px;
}

.title-box {
	text-align: right; /* 오른쪽 정렬 */
}

.float-wrap { /* 겹치지 않도록 */
	overflow: hidden;
	margin-bottom: 4px;
}

.title-text {
	font-size: 17px;
	font-weight: bold;
	color: #282828;
	float: left;
}

.year-text {
	font-size: 15px;
	font-weight: bold;
	color: #282828;
	float: right;
}

.mshool-text {
	font-size: 14px;
	font-weight: bold;
	color: #282828;
	float: left;
}

.desc-text {
	font-size: 12px;
	margin-bottom: 6px;
}

.desc-subtext {
	font-size: 10px;
	color: #282828;
	padding-left: 16px;
	margin-bottom: 8px;
}

footer {
	text-align: center;
	background-color: #1e1e1e;
	padding: 20px;
	font-size: 12px;
	color: #919191;
}
</style>

<title>이력서</title>
<!-- 문서 제목 -->
</head>
<body>
	<%
	response.setContentType("application/vnd.word; charset=UTF-8");
	response.setHeader("Content-Disposition", "inline; filename=Jobiss.doc;");
%>
	<!-- 컨텐츠 내용 -->
	<div class="mainbox">
		<!-- mainbox 그룹 정의 -->
		<div class="title-box">
			<!-- title-box 그룹 정의 -->
			<h1>${member.mname }</h1>
			<!-- h1 = 가장 크게 표시 -->
			<p class="name-text">${member.mjobtype }</p>
			<!-- <p>: 단락 구분 -->
		</div>

		<section>
			<div>
				<table>
					<tr>
						<td>경력</td>
						<td style="margin-left:10px;">${member.mcareer }</td>
						<td style="margin-left:50px;">나이</td>
						<td>${member.mage }</td>
						<td style="margin-left:50px;">성별</td>
						<td>${member.mgender }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td style="margin-left:10px;">${member.mphone }</td>
						<td style="margin-left:50px;">주소</td>
						<td>${member.maddress }</td>
					</tr>
				</table>
			</div>
		</section>
		<br>
		<section>
			<h2>About Me</h2>
			<!-- 제목2 -->
			<div class="float-wrap">
				<p class="title-text">학력</p>
				<fmt:formatDate value="${member.mschoolstartreg }" var="startreg" pattern="YYYY.MM"/>
				<fmt:formatDate value="${member.mschoolendreg }" var="endreg" pattern="YYYY.MM"/>
				<p class="desc-text">${startreg } ~ ${endreg }   &nbsp;&nbsp;     ${member.mschoolname }    &nbsp;&nbsp;     ${member.mschooltype} (${member.mschoolmajor })</p>
			</div>

			<div class="float-wrap">
				<p class="title-text">자격증</p>
				<p class="desc-subtext">ex)2000.00 ~ 2000.00     &nbsp;&nbsp;     운전면허자격증    &nbsp;&nbsp;     발급기관 </p>
			</div>

			<div class="float-wrap">
				<p class="title-text">경력</p>
				<p class="desc-subtext">ex)2000.00 ~ 2000.00     &nbsp;&nbsp;     회사이름</p>
			</div>

			<p class="title-text">Skill set</p>
			<p class="desc-text">Language : </p>
			<p class="desc-text">OS : </p>
			<p class="desc-text">Framework+Library : </p>
			<p class="desc-text">Database : </p>
			<p class="desc-text">Development Tool : </p>
			<p class="desc-text">ETC : </p>
		</section>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<section>
			<!-- ABOUT ME 묶는 태그 -->
			<h2>자기 소개서</h2>
			<!-- 제목2 -->
			<div class="float-wrap">
				<p class="title-text">성장 과정</p>
			</div>
			<p class="desc-text">${ps.psgcontent }</p>

			<div class="float-wrap">
				<p class="title-text">성격 장단점</p>
			</div>
			<p class="desc-text">${ps.psccontent }</p>

			<div class="float-wrap">
				<p class="title-text">지원동기</p>
			</div>
			<p class="desc-text">${ps.psmcontent }</p>

			<div class="float-wrap">
				<p class="title-text">입사 후 포부</p>
			</div>
			<p class="desc-text">${ps.pspcontent }</p>
		</section>
	</div>
			<p align="center">지원서 상의 모든 기재 사항은 사실과 다름이 없음을 확인합니다.</p>
			<fmt:formatDate value="${ps.psreg }" var="psreg" pattern="YYYY년 MM월 dd일"/>
			<p align="right" style="font-size:13px;">${psreg}</p>
</body>
</html>