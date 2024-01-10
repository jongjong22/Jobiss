/* 글 작성 유효성 검사 reviewWriteForm.jsp */
   
    function check() {
        if ($('#rtitle').val() == '') {
            alert('제목을 입력하세요.');
            $('#rtitle').focus();
            return false; 
        } else if ($('#rcontent').val() == '') {
            alert('내용을 입력하세요.');
            $('#rcontent').focus();
            return false; 
        } else if ($('#rsuccess1').val() == '') {
            alert('합격증을 첨부하세요.');
            return false; 
        }
        return true; 
    }
    
   /* 글 작성 취소 버튼 (뒤로가기) reviewWriteForm.jsp */ 
    
    function goBack() {
			history.go(-1);
		}
    
    		
	/* 리뷰글 삭제 ajax reviewDetails.jsp */ 
	
    		function deletereview(rid) {
		
			var confirmDelete = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete :" + confirmDelete);

			if (confirmDelete) {
				$.ajax({
					type : "POST",
					url : "reviewDelete.do",
					data : {
						"rid" : rid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "reviewList.do";
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
		
	/* 리뷰글 댓글 삭제 ajax reviewDetails.jsp */ 
	 
	 function deletereviewreply(rrid,rid) {
			
			var confirmDelete1 = confirm("진짜 삭제하시겠습니까?");
		    console.log("confirmDelete1 : " + confirmDelete1);

			if (confirmDelete1) {
				$.ajax({
					type : "POST",
					url : "replyDelete.do",
					data : {
						"rrid" : rrid
					},
					success : function(response) {
						if (response === "Y") {
							alert("글 삭제가 되었습니다.");
							location.href = "reviewDetails.do?rid=" +rid;
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
		
		
/* 피드백 업데이트 reviewUpdateForm.jsp */
	
	function reviewUpdate(rtitle,rcontent,rid) {
		var Checkconfirm = confirm('수정 하시겠습니까?');
		
		if(Checkconfirm){
			$.ajax({
				type : 'POST',
				url : 'reviewUpdate.do',
				data : { rtitle : rtitle,
						 rcontent : rcontent,
						 rid : rid},
				success : function(result){
					if(result === "Y"){
						alert('수정 성공');
						location.href = 'reviewDetails.do?rid='+rid;
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
		
	 
	 
	 
	 