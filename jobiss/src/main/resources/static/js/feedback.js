/* 피드백 글 삭제 feedDetails.jsp */

function deletefeedback(fid) {
		
			var confirmDelete = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete :" + confirmDelete);

			if (confirmDelete) {
				$.ajax({
					type : "POST",
					url : "FeedbackDelete.do",
					data : {
						"fid" : fid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "FeedbackList.do";
						} else {
							alert("삭제에 실패했습니다.");
						}
					},
					error : function() {
						alert("관리자에게 문의해주세요.");
					}

				});
			}
		}
		
/* 피드백 댓글 삭제 feedDetails.jsp */
		
		function deletefeedbackreply(frid,fid) {
			
			var confirmDelete2 = confirm("진짜 삭제하시겠습니까?");

			if (confirmDelete2) {
				$.ajax({
					type : "POST",
					url : "feedReplyDelete.do",
					data : {
						"frid" : frid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "FeedDetails.do?fid="+fid;
						} else {
							alert("삭제에 실패했습니다.");
						}
					},
					error : function() {
						alert("관리자에게 문의해주세요.");
					}

				});
			}
		}
		
/* 피드백 글 작성 유효성 검사 feedWriteForm.jsp */
		
		function check() {
    if ($('#ftitle').val() == '') {
        alert('제목을 입력하세요.');
        $('#ftitle').focus();
        return false; 
    } else if ($('#fcontent').val() == '') {
        alert('내용을 입력하세요.');
        $('#fcontent').focus();
        return false; 
    } 
    return true; // 모든 필드가 비어있지 않으면 폼 제출 허용.
}

/* 피드백 댓글 작성 유효성 검사 feedDetails.jsp */

		function check1() {
		var memail = $('#memail').val();
		 if (memail === null || memail === '') {
        alert('로그인이 필요합니다.');
        return false; 
    } else if ($('#frcontent').val() === '') {
        alert('댓글을 입력하세요.');
        $('#frcontent').focus();
        return false; 
    } 
    		
    return true;
}


/* 피드백 작성, 업데이트시 취소(뒤로가기) 버튼 feedWriteForm.jsp */

function goBack() {
	history.go(-1);
}

/* 피드백 업데이트 feedUpdateForm.jsp */
	
	function FeedUpdate(ftitle,fcontent,fid) {
		var Checkconfirm = confirm('수정 하시겠습니까?');
		
		if(Checkconfirm){
			$.ajax({
				type : 'POST',
				url : 'FeedUpdate.do',
				data : { ftitle : ftitle,
						 fcontent : fcontent,
						 fid : fid},
				success : function(result){
					if(result === "Y"){
						alert('수정 성공');
						location.href = 'FeedDetails.do?fid='+fid;
					}else{
						alert('업데이트 실패');
					}
				},
				error : function(error){
					console.error('Error',error);
				}
			});
		}
		
	}
		