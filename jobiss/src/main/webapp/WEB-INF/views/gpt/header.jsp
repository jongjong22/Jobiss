<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<title>header</title>
<link rel="shortcut icon" href="images/gt_favicon.png">

<!-- Bootstrap -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.no-icons.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Icons -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<!-- Fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Alice|Open+Sans:400,300,700">
<!-- Custom styles -->
<link rel="stylesheet" href="css/headfoot.css">
<style>
#logo {
	margin-top: -30px;
	margin-bottom: -70px;
	padding-top: -30px;
	padding-bottom: -30px;
	line-height: 1;
}

.info {
	overflow: hidden;
	float: right;
	margin-top: -40px;
}

.info>.info01>li {
	display: block;
	float: left;
	padding-right: 20px
}

.info>.info01>li>a {
	font-size: 15px;
	color: black;
}
</style>
</head>
<body class="home">
	<header id="header">
		<div id="head" class="parallax" parallax-speed="2">
			<h1 id="logo" class="text-center">
				<span class="title">Jobiss</span>
				<!-- <a href="">anthony.russel42@example.com</a></span> -->
			</h1>
		</div>

		<nav class="navbar navbar-default navbar-sticky">
			<div class="container-fluid">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<div class="navbar-collapse collapse">

					<ul class="nav navbar-nav" style="margin-right: 100px;">
						<li><a href="main.do">HOME</a></li>
						<li><a href="QnAlist.do">Q&A</a></li>
						<li><a href="reviewList.do">REVIEW</a></li>
						<li><a href="FeedbackList.do">FEEDBACK</a></li>
						<li><a href="community.do">공지사항</a></li>
						<li><a href="masterMemberList.do">관리자</a></li>
						<li><a href="gptMain">GPT</a></li>
					</ul>

				</div>
				<!--/.nav-collapse -->
				<!-- 세션 로그인이 없을경우 -->


				<div class="info" style="font-size: 20px; font-weight: bold;">
					<ul class="info01">
						<c:if test="${empty sessionScope.member.memail}">
							<li><a href="loginform.do">로그인</a></li>
						</c:if>
						<!-- 세션에 로그인 정보가 있을 경우 -->
						<c:if test="${not empty sessionScope.member.memail}">
             ${sessionScope.member.mname}님 환영합니다!
						<li><a href="mypage.do">MYPAGE</a></li>
							<li><a href="logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
				<!--info -->
			</div>
		</nav>
	</header>

	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="assets/js/template.js"></script>
</body>
</html>