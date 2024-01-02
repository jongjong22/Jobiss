/**
 * 자기소개서 업데이트 ( 아직 안함)
 */
 
 function moveContent(selectedId) {
    // 선택한 textarea의 내용 가져오기
    var selectedContent = document.getElementsByName("gptgcontent")[0].value;

    // 목적지 섹션의 textarea에 내용 설정
    document.getElementsByName("psgcontent")[0].value = selectedContent;


    return false; // 폼 제출 방지
}