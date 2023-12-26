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
<body>
	<div class="container_main">
		<h1>chatGPT API</h1>
		<h2>수정할 항목을 선택하세요!!!</h2>
		<form method="post" action="gptSelect" id="growForm">
			<table class="table_request">
				<tr>
					<th>&lt;성장과정 : grow&gt;</th>
				</tr>
				<tr>
					<td><textarea rows="10" cols="100" id="gRequest"
							name="gRequest" placeholder="기존 입력값이 들어갈 예정임.">${grow.gptgcontent }</textarea>
						<button type="button" id="gRequestButton" name="gRequestButton"
							onclick="gptRequest('g', $('#gRequest').val());">컨설팅 받기</button></td>
				</tr>
				<tr id="gResponse">

				</tr>
				</form>
				<tr>
					<th>&lt;성격의 장단점 및 특기 : character&gt;</th>
				</tr>
				<tr>
					<td><textarea rows="10" cols="100" id=cRequest
							name="characterRequest" placeholder="기존 입력값이 들어갈 예정임."></textarea>
						<button onclick="gptRequest('c', $('#characterRequest').val());">컨설팅
							받기</button></td>
				</tr>
				<tr>
					<th>&lt;직무역량 : plan&gt;</th>
				</tr>
				<tr>
					<td><textarea rows="10" cols="100" id="planRequest"
							name="planRequest" placeholder="기존 입력값이 들어갈 예정임."></textarea>
						<button onclick="gptRequest('p', $('#planRequest').val());">컨설팅
							받기</button></td>
				</tr>
				<tr>
					<th>&lt;입사지원 동기 : motive&gt;</th>
				</tr>
				<tr>
					<td><textarea rows="10" cols="100" id="motiveRequest"
							name="motiveRequest" placeholder="기존 입력값이 들어갈 예정임."></textarea>
						<button onclick="gptRequest('m', $('#motiveRequest').val());">컨설팅
							받기</button></td>
				</tr>
			</table>






			<table class="table_response">
				<tr>
					<!-- 				<td><textarea rows="20" cols="50" id="result" name="result"></textarea> -->
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

		function gptRequest(resumeType, keyword) {
			console.log('keyword = ' + keyword);
			console.log('resumeType = ' + resumeType);
			const data = {
				keyword : keyword,
				resumeType : resumeType,
			};
			$
					.ajax({
						url : "gptRequest",
						method : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),

					})
					.then(
							function(response) {
								$('#loading').hide();
								var resumeType = response.resumeType;
								var resultContent = response.resultContent;

								console.log(response);
							

								if ((resultContent === null) || (resultContent === undefined)) {
									alert(response.msg);
									return false;
								}
								var html = '';
								html += '<tr><td><textarea rows="10" cols="100" id="' + resumeType + 'Response" name="' + resumeType + 'Response" placeholder="기존 입력값이 들어갈 예정임.">'
										+ resultContent
										+ '</textarea></td></tr>';
								html += '<tr><td><form id="'
										+ resumeType
										+ 'Form" method="post" action="gptSelect" onsubmit="return submitForm(\''
										+ resumeType + 'Form\')">';
								html += '<input type="hidden" id="' + resumeType + '" name="resumeType" value="' + resumeType + '" />';
								html += '<input type="hidden" id="gpt' + resumeType + 'content" name="gpt' + resumeType + 'content" value="' + resultContent + '" />';
								html += '<button type="submit" id="selectRequest" name="selectRequest" value="' +
								resultContent +
							        '">선택</button></form></td></tr>';
								$('#' + resumeType + 'Response').after(html);
							});
		}
	</script>
	<script>
		function gptSelect(resumeType) {
			onsubmit();
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