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
<!-- Custom styles -->
<link rel="stylesheet" href="css/gpt.css">
<style>
</style>
</head>
<body>
	<img src="">
	<h1>chatGPT API</h1>
	<h2>수정할 항목을 선택하세요!!!</h2>
	<table>
		<tr>
			<th>gid</th>
			<th>memail</th>
			<th>선택</th>
		</tr>
		<c:if test="${gidList ne null }">
			<c:forEach items="${gidList }" var="gid">
				<tr>
					<td>${gid }</td>
					<c:if test="${member.memail eq null}">
						<td>master</td>
					</c:if>
					<c:if test="${member.memail ne null}">
						<td>${member.memail }</td>
					</c:if>
					<td><button type="button"
							onclick="location.href='gptHistory?gid=${gid}' ">이전이력</button></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<div class="container_main">
		<table class="table_qRequest">
			<tr>
				<th>&nbsp; &lt;성장과정 : grow&gt;</th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" id="gRequest"
						class="contetn_request" name="gRequest"
						placeholder="기존 입력값이 들어갈 예정임.">${grow.gptgcontent }</textarea></td>
				<td id="gRequestButton">
					<button type="button" class="button_request short"
						onclick="gptRequest('g', $('#gRequest').val(), 'short');">3가지
						수정사항 받기&nbsp;&nbsp;</button>
					<button type="button" class="button_request medium"
						onclick="gptRequest('g', $('#gRequest').val(), 'medium');">🐥이력서
						컨설팅 받기🐥</button>
					<button type="button" class="button_request long"
						onclick="gptRequest('g', $('#gRequest').val(), 'long');">⭐premium컨설팅⭐</button>
					<button type="button" class="button_request test"
						onclick="gptRequest('g', $('#gRequest').val(), 'test');">test
						버튼(짧은대답)</button>
				</td>
				<td><img id="gLoading"
					src="https://studentrights.sen.go.kr/images/common/loading.gif"
					style="width: 387px; height: 320px;"></td>
			</tr>
		</table>
		<div id="gResponse"></div>

		<table class="table_cRequest">
			<tr>
				<th>&lt;성격의 장단점 및 특기 : character&gt;</th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" id="cRequest"
						class="contetn_request" name="cRequest"
						placeholder="기존 입력값이 들어갈 예정임.">${character.gptccontent }</textarea></td>
				<td id="cRequestButton">
					<button type="button" class="button_request short"
						onclick="gptRequest('c', $('#cRequest').val(), 'short');">3가지
						수정사항 받기&nbsp;&nbsp;</button>
					<button type="button" class="button_request medium"
						onclick="gptRequest('c', $('#cRequest').val(), 'medium');">🐥이력서
						컨설팅 받기🐥</button>
					<button type="button" class="button_request long"
						onclick="gptRequest('c', $('#cRequest').val(), 'long');">⭐premium컨설팅⭐</button>
					<button type="button" class="button_request test"
						onclick="gptRequest('c', $('#cRequest').val(), 'test');">test
						버튼(짧은대답)</button>
				</td>
				<td><img id="cLoading"
					src="https://studentrights.sen.go.kr/images/common/loading.gif"
					style="width: 387px; height: 320px;"></td>
			</tr>
		</table>
		<div id="cResponse"></div>

		<table class="table_mRequest">
			<tr>
				<th>&lt;입사동기 : motive&gt;</th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" id="mRequest"
						class="contetn_request" name="mRequest"
						placeholder="기존 입력값이 들어갈 예정임.">${motive.gptmcontent }</textarea></td>
				<td id="mRequestButton">
					<button type="button" class="button_request short"
						onclick="gptRequest('m', $('#mRequest').val(), 'short');">3가지
						수정사항 받기&nbsp;&nbsp;</button>
					<button type="button" class="button_request medium"
						onclick="gptRequest('m', $('#mRequest').val(), 'medium');">🐥이력서
						컨설팅 받기🐥</button>
					<button type="button" class="button_request long"
						onclick="gptRequest('m', $('#mRequest').val(), 'long');">⭐premium컨설팅⭐</button>
					<button type="button" class="button_request test"
						onclick="gptRequest('m', $('#mRequest').val(), 'test');">test
						버튼(짧은대답)</button>
				</td>
				<td><img id="mLoading"
					src="https://studentrights.sen.go.kr/images/common/loading.gif"
					style="width: 387px; height: 320px;"></td>
			</tr>
		</table>
		<div id="mResponse"></div>

		<table class="table_pRequest">
			<tr>
				<th>&lt;입사후 포부 : plan&gt;</th>
			</tr>
			<tr>
				<td><textarea rows="10" cols="100" id="pRequest"
						class="contetn_request" name="pRequest"
						placeholder="기존 입력값이 들어갈 예정임.">${plan.gptpcontent }</textarea></td>
				<td id="pRequestButton">
					<button type="button" class="button_request short"
						onclick="gptRequest('p', $('#pRequest').val(), 'short');">3가지
						수정사항 받기&nbsp;&nbsp;</button>
					<button type="button" class="button_request medium"
						onclick="gptRequest('p', $('#pRequest').val(), 'medium');">🐥이력서
						컨설팅 받기🐥</button>
					<button type="button" class="button_request long"
						onclick="gptRequest('p', $('#pRequest').val(), 'long');">⭐premium컨설팅⭐</button>
					<button type="button" class="button_request test"
						onclick="gptRequest('p', $('#pRequest').val(), 'test');">test
						버튼(짧은대답)</button>
				</td>
				<td><img id="pLoading"
					src="https://studentrights.sen.go.kr/images/common/loading.gif"
					style="width: 387px; height: 320px;"></td>
			</tr>
		</table>
		<div id="pResponse"></div>


	</div>

	<script>
		$(document).ready(function() {

			$('#gLoading').hide();
			$('#cLoading').hide();
			$('#mLoading').hide();
			$('#pLoading').hide();
			$('#gRequestButton').show();
			$('#cRequestButton').show();
			$('#mRequestButton').show();
			$('#pRequestButton').show();
			var msg = '';
			if (msg !== null && msg !== '') {
				msg = `${mainMsg}`;
				console.log('msg : ' + msg);
				alert(msg);
			}

		});
		function gptRequest(resumeType, keyword, lengthType) {
			console.log('keyword = ' + keyword);
			console.log('resumeType = ' + resumeType);
			console.log('lengthType = ' + lengthType);
			$('#' + resumeType + 'Loading').show();
			$('#' + resumeType + 'RequestButton').hide();
			const data = {
				keyword : keyword,
				resumeType : resumeType,
				lengthType : lengthType,
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
								$('#gLoading').hide();
								$('#cLoading').hide();
								$('#mLoading').hide();
								$('#pLoading').hide();
								$('#gRequestButton').show();
								$('#cRequestButton').show();
								$('#mRequestButton').show();
								$('#pRequestButton').show();
								var resumeType = response.resumeType;
								var resultContent = response.resultContent;

								console.log(response);

								if ((resultContent === null)
										|| (resultContent === undefined)) {
									alert(response.msg);
									return false;
								}
								var formHtml = '<form id="' + resumeType + 'Form" method="post" action="gptSelect">'
										+ '<table style="margin-bottom:20px;">'
										+ '<tr>'
										+ '<td><input type="hidden" id="' + resumeType + '" name="resumeType" value="' + resumeType + '" /></td>'
										+ '<td><input type="hidden" id="gpt' + resumeType + 'content" name="gpt' + resumeType + 'content" value="' + resultContent + '" /></td>'
										+ '</tr>'
										+ '<tr>'
										+ '<th>수정안 - &nbsp;</th>'
										+ '<td><textarea rows="10" cols="100" class="contetn_response" placeholder="기존 입력값이 들어갈 예정임.">'
										+ resultContent
										+ '</textarea></td>'
										+ '<td><button type="submit" id="selectRequest" name="selectRequest" class="button_select" value="' + resumeType + '">선택</button></td>'
										+ '</tr>' + '</table>' + '</form>';

								$('#' + resumeType + 'Response')
										.after(formHtml);
							});
		}
	</script>


	<%@ include file="footer.jsp"%>


</body>

</html>