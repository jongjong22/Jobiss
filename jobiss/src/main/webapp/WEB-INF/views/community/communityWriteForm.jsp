<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* body { */
/*    margin: 0; */
/*    padding: 0; */
/*    background: url('images/background.jpg') no-repeat center center fixed; */
/*    background-size: cover; */
/*    font-family: 'Arial', sans-serif; */
/*    height: 100%; */
/*    overflow: hidden; */
/* } */

/* body::before { */
/*    content: ""; */
/*    position: fixed; */
/*    top: 0; */
/*    left: 0; */
/*    width: 100%; */
/*    height: 100%; */
/*    /* background-color: rgba(0, 0, 0, 0.7); */ */
/* } */
</style>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<link rel="stylesheet" type="text/css" href="css/communityWriteForm.css">
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
   var swiper = new Swiper(".mySwiper", {
      slidesPerView: 5,
      spaceBetween: 25,
      navigation: {
         nextEl: ".swiper-button-next",
         prevEl: ".swiper-button-prev",
      },
   });
});
document.addEventListener("DOMContentLoaded", function() {
    var colorDivs = document.querySelectorAll('.colorPicker_wrap > div');

    colorDivs.forEach(function(colorDiv) {
        colorDiv.addEventListener('click', function() {
            var colorClass = this.classList[0]; // 선택한 색상의 클래스명 가져오기
            var bgColor = window.getComputedStyle(this).getPropertyValue('background-color'); // 선택한 색상의 배경색 가져오기
            document.querySelector('.card-write').style.backgroundColor = bgColor; // card-write의 배경색 변경
        });
    });
});
</script>
<title>글작성</title>
</head>
<body>
   <form method="post" action="communityInsert.do" enctype="multipart/form-data">
   <div calss="card">
      <div class="card-header1">
         <!-- 커뮤니티를 클릭 시 첫 페이지인 community.do로 이동 -->
         <h1>
            <a href="community.do">커뮤니티</a>
         </h1>
      </div>

      <div class="colorPicker_wrap">
         <div class="color1 D2E5F3"><a href="#">color1</a></div>
         <div class="color2 D9E9F8"><a href="#">color2</a></div>
         <div class="color3 E1FBE1"><a href="#">color3</a></div>
         <div class="color4 E8EEF8"><a href="#">color4</a></div>
         <div class="color5 F4F1F3"><a href="#">color5</a></div>
         <div class="color6 F4F3D5"><a href="#">color6</a></div>
         <div class="color7 F5FBD9"><a href="#">color7</a></div>
         <div class="color8 F8EAE5"><a href="#">color8</a></div>
         <div class="color9 FFD9D1"><a href="#">color9</a></div>
      </div>

      <div class="card-write">
         <div>
            <div>카테고리</div>
            <select>
               <option>커리어</option>
               <option>취업</option>
               <option>토론</option>
            </select>
         </div>
         <br>
         <!-- 로그인 했을 경우 -->
         <c:if test="${memail ne null}">
         <div class="myinfo">
            작성자<input type="text" name="memail" value="${memail }" readonly>
         </div>
         </c:if>
         
         <!-- 비로그인 일 경우 -->
         <c:if test="${memail eq null}">
         <div class="myinfo">
            작성자<input type="text" name="memail" placeholder="아이디를 입력 하세요.">
         </div>
         </c:if>
         
         <div class="title-w">
            제목<input type="text" name="ctitle" placeholder="제목을 입력하세요.">
         </div>

         <div class="msg">
            내용
            <textarea placeholder="내용을 입력 하세요." name="ccontent"></textarea>
            <input type="file" name="cimage1">
         </div>
      </div>
      
      <div class="btn-w">
         <!-- <a href="#">작성</a> -->
         <input type="submit" value="작성">
      </div>
   </div>
   </form>
</body>

</html>