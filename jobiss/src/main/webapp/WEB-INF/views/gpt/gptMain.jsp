<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatGPT API</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!-- Custom styles -->
<link rel="stylesheet" href="css/gpt.css">
</head>
<body>
	<%@ include file="header.jsp"%>

	<c:if test="${not empty loginErr}">
		<script>
		alert(`${loginErr}`);
		location.href="main.do";
	   </script>
	</c:if>
	<div id="chart_div"></div>

	<c:if test="${not empty readCount}">
		<div class="chart-data"></div>
	</c:if>


	<div class="caption_main">
		<h1>AI 이력서 컨설팅</h1>
	</div>
	<div class="main">
		<div class="history_main">
			<c:choose>
				<c:when test="${not empty gptList}">
					<div class="history_content">
						<h4>${member.mname }&nbsp;<br>님의이전이력입니다.
						</h4>
						<table border="1">
							<tr>
								<th>세션번호</th>
								<th>대화날짜</th>
							</tr>
							<tr>
								<td><select id="gid" name="gid" size="5"
									onchange="selectGidChange(this)">
										<c:forEach items="${gptList}" var="gpt">
											<option value="${gpt.gid}">${gpt.gid}</option>
										</c:forEach>
								</select></td>
								<td><select id="gid" name="gid" size="5"
									onchange="selectGidChange(this)">
										<c:forEach items="${gptList}" var="gpt">
											<option value="${gpt.gid}">${gpt.gptreg}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
					</div>
				</c:when>
				<c:when test="${empty gptList}">
대화 이력이 존재하지 않습니다.
			</c:when>
			</c:choose>
		</div>
		<script>
			function selectGidChange(select) {
				var select = select.value;
				location.href = 'gptHistory?gid=' + select + '&' + 'type=now';
			}
		</script>





		<div class="container_main">
			<table class="table_gRequest">
				<tr>
					<th>&nbsp; &lt;성장과정&gt;</th>
				</tr>
				<tr>
					<td><textarea id="gRequest" class="content_request" rows="5"
							cols="68" name="gRequest" placeholder="컨설팅 받을 이력서 내용을 입력하세요.">${grow.gptgcontent }</textarea></td>
					<td id="gRequestButton" class="button-container">
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
					<td><img id="gLoading" class="loading"
						src="https://studentrights.sen.go.kr/images/common/loading.gif"
						style="width: 100%; height: 100%;"></td>
				</tr>
			</table>
			<div id="gResponse"></div>
			<table class="table_cRequest">
				<tr>
					<th>&lt;성격의 장단점 및 특기&gt;</th>
				</tr>
				<tr>
					<td><textarea id="cRequest" class="content_request" rows="5"
							cols="68" name="cRequest" placeholder="컨설팅 받을 이력서 내용을 입력하세요.">${character.gptccontent }</textarea></td>
					<td id="cRequestButton" class="button-container">
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
					<td><img id="cLoading" class="loading"
						src="https://studentrights.sen.go.kr/images/common/loading.gif"
						style="width: 100%; height: 100%;"></td>
				</tr>
			</table>
			<div id="cResponse"></div>
			<table class="table_mRequest">
				<tr>
					<th>&lt;입사동기&gt;</th>
				</tr>
				<tr>
					<td><textarea id="mRequest" class="content_request" rows="5"
							cols="68" name="mRequest" placeholder="컨설팅 받을 이력서 내용을 입력하세요.">${motive.gptmcontent }</textarea></td>
					<td id="mRequestButton" class="button-container">
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
					<td><img id="mLoading" class="loading"
						src="https://studentrights.sen.go.kr/images/common/loading.gif"
						style="width: 100%; height: 100%;"></td>
				</tr>
			</table>
			<div id="mResponse"></div>
			<table class="table_pRequest">
				<tr>
					<th>&lt;입사후 포부&gt;</th>
				</tr>
				<tr>
					<td><textarea id="pRequest" class="content_request" rows="5"
							cols="68" name="pRequest" placeholder="컨설팅 받을 이력서 내용을 입력하세요.">${plan.gptpcontent }</textarea></td>
					<td id="pRequestButton" class="button-container">
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
					<td><img id="pLoading" class="loading"
						src="https://studentrights.sen.go.kr/images/common/loading.gif"
						style="width: 100%; height: 100%;"></td>
				</tr>
			</table>
			<div id="pResponse"></div>
		</div>
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
// 										+ '<td><input type="hidden" id="gpt' + resumeType + 'content" name="gpt' + resumeType + 'content" value="' + resultContent + '" /></td>'
										+ '</tr>'
										+ '<tr>'
										+ '<th>수정안 - &nbsp;</th>'
										+ '<td><textarea rows="5" cols="65"  id="gpt' + resumeType + 'content" name="gpt' + resumeType + 'content" value="' + resultContent + '" class="content_response" placeholder="컨설팅 받을 이력서 내용을 입력하세요.">'
										+ resultContent
										+ '</textarea></td>'
										+ '<td><button type="submit" id="selectRequest" name="selectRequest" class="button_select" value="' + resumeType + '">선택</button></td>'
										+ '</tr>' + '</table>' + '</form>';

								$('#' + resumeType + 'Response')
										.after(formHtml);
							});
		}
	</script>
	<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['작업', '개수'],
      ['성장과정', ${readCount.greadcount }],
      ['성격장단점', ${readCount.creadcount }],
      ['지원동기', ${readCount.mreadcount }],
      ['입사후포부', ${readCount.preadcount }]
    ]);

    var options = {
      title: '최근 회원들의 컨설팅 통계',
      pieHole: 0.6,
      pieSliceText: 'label', // 'label' 또는 'percentage'
      pieSliceTextStyle: {
        color: 'black', // 글씨 색상
        fontSize: 25,    // 글씨 크기
      },
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>


	<%@ include file="footer.jsp"%>
</body>

</html>