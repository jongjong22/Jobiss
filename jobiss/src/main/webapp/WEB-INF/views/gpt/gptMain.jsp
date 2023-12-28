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

<!-- Custom styles -->
<link rel="stylesheet" href="css/gpt.css">

<style>

</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container_main">
		<h1>chatGPT API</h1>
		<h2>수정할 항목을 선택하세요!!!</h2>

		<table class="table_request">


			<tr >
				<th>&lt;성장과정 : grow&gt;</th>
				<td><textarea rows="7" cols="100" id="gRequest" name="gRequest"
						placeholder="기존 입력값이 들어갈 예정임.">${grow.gptgcontent }</textarea>
					<button type="button" id="requestButton" name="gRequestButton"
						onclick="gptRequest('g', $('#gRequest').val());">컨설팅 받기</button></td>
				<td id="loading"><img
					src="https://studentrights.sen.go.kr/images/common/loading.gif">
				</td>
			</tr>
			<tr id="gResponse">
			</tr>
			<tr></tr>
			<tr>
				<th>&lt;성격의 장단점 및 특기 : character&gt;</th>
				<td><textarea rows="7" cols="100" id=cRequest name="cRequest"
						placeholder="기존 입력값이 들어갈 예정임."></textarea>
					<button onclick="gptRequest('c', $('#cRequest').val());">컨설팅
						받기</button></td>
			</tr>

			<tr>
				<th>&lt;입사지원 동기 : motive&gt;</th>
				<td><textarea rows="7" cols="100" id="mRequest" name="mRequest"
						placeholder="기존 입력값이 들어갈 예정임."></textarea>
					<button onclick="gptRequest('m', $('#mRequest').val());">컨설팅
						받기</button></td>
			</tr>
			<tr>
				<th>&lt;입사후 포부 : plan&gt;</th>
				<td><textarea rows="7" cols="100" id="pRequest" name="pRequest"
						placeholder="기존 입력값이 들어갈 예정임."></textarea>
					<button onclick="gptRequest('p', $('#pRequest').val());">컨설팅
						받기</button></td>
			</tr>


		</table>






		<!-- 		<table class="table_response"> -->
		<!-- 			<tr> -->
		<!-- 				<td><textarea rows="20" cols="50" id="result" name="result"></textarea> -->
		<!-- 				<td> -->
		<!-- 					<div id="result"></div> -->

		<!-- 					<div id="loading"> -->
		<!-- 						<img -->
		<!-- 							src="https://studentrights.sen.go.kr/images/common/loading.gif"> -->
		<!-- 					</div> -->
		<!-- 				</td> -->
		<!-- 			</tr> -->
		<!-- 		</table> -->

	</div>
	<script>
		$(document).ready(function() {

			$('#loading').hide();
			$('#requestButton').show();
			// 메인값 없을경우 예외처리
			var msg = '';
			if (msg !== null && msg !== '') {
				msg = `${mainMsg}`;
				console.log('msg : ' + msg);
				alert(msg);
			}

		});
		function gptRequest(resumeType, keyword) {
			console.log('keyword = ' + keyword);
			console.log('resumeType = ' + resumeType);
			$('#loading').show();
			$('#requestButton').hide();
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
								$('#requestButton').show();
								var resumeType = response.resumeType;
								var resultContent = response.resultContent;

								console.log(response);

								if ((resultContent === null)
										|| (resultContent === undefined)) {
									alert(response.msg);
									return false;
								}
								var html = '';

								html += '<tr></tr><tr><td></td><td><textarea rows="7" cols="100" id="' + resumeType + 'Response" name="' + resumeType + 'Response" placeholder="기존 입력값이 들어갈 예정임.">'
										+ resultContent
										+ '</textarea><button type="submit" id="selectRequest" name="selectRequest" value="' +
										resultContent +
								        '">선택</button></td></tr>';
								html += '<tr><td><form id="'
										+ resumeType
										+ 'Form" method="post" action="gptSelect" onsubmit="return submitForm(\''
										+ resumeType + 'Form\')">';
								html += '<input type="hidden" id="' + resumeType + '" name="resumeType" value="' + resumeType + '" />';
								html += '<input type="hidden" id="gpt' + resumeType + 'content" name="gpt' + resumeType + 'content" value="' + resultContent + '" />';
								html += '</form></td></tr>';
								$('#' + resumeType + 'Response').after(html);
							});
		}
	</script>
	<script>
		function gptSelect(resumeType) {
			onsubmit();
		}
	</script>

<%@ include file="footer.jsp" %>


</body>

</html>