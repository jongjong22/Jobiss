<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
s
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/mypage.css">
<title>마이페이지</title>

<style>
	@font-face {
		font-family: 'MICEGothic Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
		font-weight: 700;
		font-style: normal;
	}
	
  .mypage_small {
        margin-left: 15%;
    }
    
   a{
   	font-size: 15px;
   }
</style>

</head>
<body>
	<div class="mypage_big" style="font-family: 'MICEGothic Bold';">
		<h1>마이페이지</h1>
		<nav>
			<ul>
				<li><a href="main.do">HOME</a></li>
				<li><a href="mypage.do?&&memail=${member.memail }">MY
						자기소개서</a></li>
				<li><a href="myreview.do?&&memail=${member.memail }">MY
						리뷰</a></li>
				<li><a href="myqna.do?&&memail=${member.memail }">MY QnA</a></li>
				<li><a href="myfeedback.do?&&memail=${member.memail }">MY
						FEEDBACK</a></li>
				<li><a href="mycommunity.do?&&memail=${member.memail }">MY 커뮤니티</a></li>
				<li><a href="memberupdateform.do">회원정보수정</a></li>
				<li><a href="memberdeleteform.do">회원탈퇴</a></li>
				<!-- 추가적인 메뉴 항목을 필요에 따라 추가할 수 있습니다. -->
			</ul>
		</nav>

		<div class="mypage_small">
			<form action="#">
			<table border="1">
				<h1>내가 쓴 자기소개서</h1>
				<tr>
					<th>성장과정</th>
					<th><textarea rows="7" cols="100">내용을 입력하세요...</textarea>
						<button type="button" >수정</button>
					</th>
				</tr>
				
				<tr>
					<th>성격장단점</th>
					<th><textarea rows="7" cols="100">내용을 입력하세요...</textarea>
						<button type="button" >수정</button>
					</th>
				</tr>
				<tr>
					<th>지원동기</th>
					<th><textarea rows="7" cols="100">내용을 입력하세요...</textarea>
						<button type="button" >수정</button>
					</th>
				</tr>
					
				<tr>
					<th>입사후포부</th>
					<th><textarea rows="7" cols="100">내용을 입력하세요...</textarea>
						<button type="button" >수정</button>
					</th>
				</tr>
				</table>
				</form>
				
				
				
				<!-- small div -->
				</div>
				
				
				
				</div>
</body>
</html>