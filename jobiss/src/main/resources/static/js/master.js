/*     masterMember.jsp       */



/*    MasterMemberlist.jsp        */

/* 회원 상세 정보 팝업창 띄우기 */
function openMemberDetails(memail) {
	 window.open('masterMember.do?memail=' + memail, '_blank', 'width=1000,height=400');
}

/* 회원 삭제 하기 */
function masterMemberDelete(memail) {
	
    var deletecheck = confirm('진짜 삭제하시겠습니까?');
	
		if(deletecheck){
		$.ajax({
			type: 'POST',
			url : 'masterMemberDelete.do',
			data : { memail : memail },
			success: function(data){
				if(data === 'Y') {
					alert('삭제가 완료되었습니다.');
					location.href = 'masterMemberList.do';
				}else{
					alert('삭제에 실패했습니다.');
				}
			},
			error: function(error) {
				console.error('Error:', error);
			}
			
		}); /* ajax end */
	}
	
}


