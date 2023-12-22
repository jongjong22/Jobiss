<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatGPT API</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/gpt.css">
</head>

<body>
	<h1>chatGPT API</h1>
	<h3>무엇이든 질문해보세요 !!</h3>
	<div class="container_main">
		<table class="table_request" border="1">
			<tr>
				<td><textarea rows="5" cols="50" id="keywords" name="keywords"
						placeholder="내용을 입력하세요."></textarea>
					<button onclick="chatGPT()">입력</button></td>
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
</body>

</html>