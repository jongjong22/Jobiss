<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Sergey Pozhilov (GetTemplate.com)">
<title>Jobiss</title>

<link rel="shortcut icon" href="img/gt_favicon.png">

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
<link rel="stylesheet" href="css/styles.css">

<!--[if lt IE 9]> <script src="assets/js/html5shiv.js"></script> <![endif]-->
<style>

@font-face {
	font-family: 'MICEGothic Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	font-weight: 700;
	font-style: normal;
}

.item img {
	width: 100%; /* Make the images responsive within each slide */
	height: auto;
}

#footer {
	margin-top: 100px;
}

.text-center {
	margin-top: 40px;
}
/* Remove background color from the carousel control buttons */
.carousel-control.left, .carousel-control.right {
	background: none;
}

/* Set the color of the carousel control buttons (optional) */
.carousel-control.left {
	color: #fff; /* Change the color to your preference */
}

.carousel-control.right {
	color: #fff; /* Change the color to your preference */
}

.carousel-inner .item.active img:hover {
	transform: scale(1.5); /* Set the scale factor as desired */
	margin-top: 70px;
}

.carousel-inner .item img:hover {
	transform: none;
}

#imageSlider .carousel-inner .item img {
	width: 70%; /* Set the width as 70% of the container width */
	height: auto;
	max-width: 100%;
	/* Ensure the image does not exceed its natural size */
	object-fit: contain;
	/* Maintain the aspect ratio while fitting within the container */
	margin-left: 50px;
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
				<img class="img-circle" src="images/guy.jpg" alt=""> <span
					class="title">Jobiss</span> <span class="tagline">취업 정보 자비즈~<br>
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

					<ul class="nav navbar-nav">
						<li><a href="main.do">HOME</a></li>
						<li><a href="#">Q&A</a></li>
						<li><a href="reviewList.do">REVIEW</a></li>
						<li><a href="FeedbackList.do">FEEDBACK</a></li>
						<li><a href="community.do">커뮤니티</a></li>
						<li><a href="masterMemberList.do">관리자</a></li>
						<li><a href="gptMain">GPT</a></li>
					</ul>

				</div>
				<!--/.nav-collapse -->
				<!-- 세션 로그인이 없을경우 -->


				<div class="info">
					<ul class="info01">
						<c:if test="${empty sessionScope.member.memail}">
							<li><a href="loginform.do">로그인</a></li>
						</c:if>
						<!-- 세션에 로그인 정보가 있을 경우 -->
						<c:if test="${not empty sessionScope.member.memail}">
             ${sessionScope.member.mname}님 환영합니다
						<li><a href="mypage.do">MYPAGE</a></li>
						<li><a href="logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
				<!--info -->
			</div>
		</nav>
	</header>

	<main id="main">

		<div class="container">

			<div class="row section topspace">
				<div class="col-md-12">
					<p class="lead text-center text-muted">
						Let me tell you something my friend. hope is a dangerous thing.
						hope can drive a man insane. you <a href="about.html">measure</a>
						yourself by the people who measure themselves by you. it only took
						me <a href="sidebar-right.html">six days</a>.
					</p>
				</div>
			</div>
			<!-- / section -->

			<div class="row section recentworks topspace">

				<h2 class="section-title" style="font-family: 'MICEGothic Bold';">
					<span>BEST 자기소개서</span>
				</h2>

				<div id="imageSlider" class="carousel slide" data-ride="carousel"
					data-interval="false" data-touch="true">
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<div class="row">
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 1">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 2">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 3">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="row">
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 4">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 5">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
								<div class="col-xs-4">
									<img src="images/resume.jpg" alt="Slide 6">
									<p class="text-center">
										<a href="" class="btn btn-action">Read more</a>
									</p>
								</div>
								<!-- Add more images as needed -->
							</div>
						</div>
						<!-- Add more slides as needed -->
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#imageSlider" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#imageSlider"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</div>
			<!-- /container -->
	</main>

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-3 widget">
					<h3 class="widget-title">Contact</h3>
					<div class="widget-body">
						<p>
							+234 23 9873237<br> <a href="mailto:#">some.email@somewhere.com</a><br>
							<br> 234 Hidden Pond Road, Ashland City, TN 37015
						</p>
					</div>
				</div>

				<div class="col-md-3 widget">
					<h3 class="widget-title">Follow me</h3>
					<div class="widget-body">
						<p class="follow-me-icons">
							<a href=""><i class="fa fa-twitter fa-2"></i></a> <a href=""><i
								class="fa fa-dribbble fa-2"></i></a> <a href=""><i
								class="fa fa-github fa-2"></i></a> <a href=""><i
								class="fa fa-facebook fa-2"></i></a>
						</p>
					</div>
				</div>

				<div class="col-md-3 widget">
					<h3 class="widget-title">Text widget</h3>
					<div class="widget-body">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Atque, nihil natus explicabo ipsum quia iste aliquid repellat
							eveniet velit ipsa sunt libero sed aperiam id soluta officia
							asperiores adipisci maxime!</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Atque, nihil natus explicabo ipsum quia iste aliquid repellat
							eveniet velit ipsa sunt libero sed aperiam id soluta officia
							asperiores adipisci maxime!</p>
					</div>
				</div>

				<div class="col-md-3 widget">
					<h3 class="widget-title">Form widget</h3>
					<div class="widget-body">
						<p>
							+234 23 9873237<br> <a href="mailto:#">some.email@somewhere.com</a><br>
							<br> 234 Hidden Pond Road, Ashland City, TN 37015
						</p>
					</div>
				</div>

			</div>
			<!-- /row of widgets -->
		</div>
	</footer>

	<footer id="underfooter">
		<div class="container">
			<div class="row">

				<div class="col-md-6 widget">
					<div class="widget-body">
						<p>234 Hidden Pond Road, Ashland City, TN 37015</p>
					</div>
				</div>

				<div class="col-md-6 widget">
					<div class="widget-body">
						<p class="text-right">
							Copyright &copy; 2014, Your awesome name here<br> Design: <a
								href="http://www.gettemplate.com" rel="designer">Initio by
								GetTemplate</a>
						</p>
					</div>
				</div>

			</div>
			<!-- /row of widgets -->
		</div>
	</footer>
	<!-- JavaScript libs are placed at the end of the document so the pages load faster -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="assets/js/template.js"></script>

	<script>
		$(document).ready(function() {
			$('#imageSlider').carousel();
		});
	</script>
</body>
</html>