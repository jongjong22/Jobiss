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
<title>chatGPT API</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<link rel="stylesheet" href="css/gpt.css">

<style>
    h1{
    	font-family: "Segoe Print";
    	font-weight: "500";
    	margin-top: "20px";
    }
    
	.qna{
	margin-top: 10px;
	margin-left: 250px;
	font-family: "Segoe Print";
	}
	
	#footer {
	margin-top: 100px;
	}
	
	.info {
	overflow: hidden;
	float: right;
	margin-top: -40px;
	}
	
	.info>.info01>li {
		display: block;
		float: left;
		padding-right: 10px
	}
	
	.info>.info01>li>a {
		font-size: 15px;
		color: black;
	}
</style>
</head>

<body class= "home">
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

					<ul class="nav navbar-nav">
						<li><a href="#">Q&A</a></li>
						<li><a href="#">REVIEW</a></li>
						<li><a href="#">FEEDBACK</a></li>
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
						<li><a href="#">MYPAGE</a></li>
						<li><a href="logout.do">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
				<!--info -->
			</div>
		</nav>
	</header>
	<h1 class = "question">취업질문 GPT</h1>
	<p class = "qna">ANY QUESTION</p>
	<div class="container_main">
		<table class="table_request">
			<tr>
				<td><textarea rows="1" cols="50" id="keywords" name="keywords"
						placeholder="내용을 입력하세요." style="resize: none; overflow: hidden;"></textarea>
					<button onclick="chatGPT()" style="background: none; border: none;">
						<img class="img-circle" src="images/search01.png" alt="">
					</button></td>
			</tr>
		</table>
		<table class="table_response">
			<tr>
				<!-- 			<td><textarea rows="20" cols="50" id="result" name="result"></textarea> -->
				<td>
					<div id="result"></div>

					<div id="loading">
						<img
							src="https://studentrights.sen.go.kr/images/common/loading.gif">
					</div>
				</td>
			</tr>
		</table>
	</div>


	<script>
		$(document).ready(function() {
			$('#loading').hide();
		});

		function chatGPT() {
			const api_key = "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" // <- API KEY 입력
			const keywords = document.getElementById('keywords').value
			$('#loading').show();

			const messages = [ {
				role : 'system',
				content : 'You are the interviewer.'
			}, {
				role : 'user',
				content : keywords + '위 문장의 문제점을 지적해주고, 짧게 3개로 간추려서 대답해줘 한국어로.'
			}, ]

			const data = {
				model : 'gpt-3.5-turbo',
				temperature : 0.5,
				n : 1,
				messages : messages,
			}

			$.ajax({
				url : "https://api.openai.com/v1/chat/completions",
				method : 'POST',
				headers : {
					Authorization : "Bearer " + api_key,
					'Content-Type' : 'application/json',
				},
				data : JSON.stringify(data),
			}).then(function(response) {
				$('#loading').hide();
				console.log(response)
				let result = document.getElementById('result')
				let pre = document.createElement('pre')

				pre.innerHTML = "\n\n" + response.choices[0].message.content
				result.appendChild(pre)

				document.getElementById('keywords').value = ''
			});
		}
	</script>
	
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

</body>

</html>