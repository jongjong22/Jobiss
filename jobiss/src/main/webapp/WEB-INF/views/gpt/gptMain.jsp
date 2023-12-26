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
</body>

</html>