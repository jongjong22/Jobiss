/*     masterMember.jsp       */



/*    MasterMemberlist.jsp        */

/* 회원 상세 정보 팝업창 띄우기 */
function openMemberDetails(memail) {
	 location.href = 'masterMember.do?memail=' + memail;
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

/* masterReviewList.jsp */

function openReview(rid) {
	 location.href = 'masterReview.do?rid=' + rid;
}

/* masterReview.jsp  */

function masterReviewConfirm(rid) {
	var confirmCheck = confirm('정말 수락하시겠습니까?');
	
	if(confirmCheck){
		$.ajax ({
			type : 'POST',
			url : 'masterReviewConfirm.do',
			data : { rid : rid },
			success : function(result) {
				if(result === 'Y') {
					alert('수락 성공 하였습니다.');
					location.href = 'masterReviewList.do';
				} else {
					alert('수락 실패하였습니다.');
				}
			},
			error : function(error) {
				console.error('Error',error);
			}
		});
	}
}

function masterReviewDelete(rid) {
	var deleteCheck = confirm('정말 삭제하시겠습니까?');
	
	if(deleteCheck){
	$.ajax ({
		type : 'POST',
		url : 'masterReviewDelete.do',
		data : { rid : rid },
		success : function(result) {
		
		if(result === 'Y'){
		
			alert('삭제 완료 되었습니다.');
			window.close();
			location.href = 'masterReviewList.do';
					
			} else{
				alert('삭제에 실패하였습니다.');
			  }
		},
		error : function(error) {
			console.error('Error',error);
		}
	});
	}
}

/*  masterQnAList.jsp  */

function openQnADetails(qid) {
	location.href = 'masterQnA.do?qid=' + qid;
}


function masterQnADelete(qid) {
	var qnadeleteConfirm = confirm('정말 삭제 하시겠습니까?');
	
	if(qnadeleteConfirm){
		$.ajax({
			type : 'POST',
			url : 'masterQnADelete.do',
			data : { qid : qid },
			success : function(result){
				if(result === 'Y'){
					alert('삭제가 완료되었습니다.');
					location.href = 'masterQnAList.do';
				}else{
					alert('삭제에 실패했습니다.');
				}
			},
			error : function(error){
				console.error('Error',error);
			}
		});
	}
}

/* masterFeedbackList.jsp */
function openFeedback(fid){
	location.href = 'masterFeedback.do?fid=' + fid;
}

/* masterFeedback.jsp */
function masterFeedbackDelete(fid){
	
	var deleteConfirm = confirm('정말 삭제 하시겠습니까?');
	
	if(deleteConfirm){
	$.ajax({
		type : 'POST',
		url : 'masterFeedbackDelete.do',
		data : { fid : fid },
		success : function(result){
			if(result === 'Y'){
				alert('삭제가 완료되었습니다.');
				location.href = 'masterFeedbackList.do';
			}else{
				alert('삭제에 실패하였습니다.');
			}
		},
		error : function(error) {
			console.error('Error',error);
		}
	});
	}
}

/* masterCommunityList.jsp */
function openCommunity(cid){
	location.href = 'masterCommunity.do?cid=' + cid;
}

/* masterCommunity.jsp */
function masterCommunityDelete(cid) {
	
	var deleteConfirm = confirm('정말 삭제 하시겠습니까?');
	
	if(deleteConfirm){
	$.ajax({
		type : 'POST',
		url : 'masterCommunityDelete.do',
		data : { cid : cid },
		success : function(result){
			if(result === 'Y'){
				alert('삭제가 완료되었습니다.');
				location.href = 'masterCommunityList.do';
			}else{
				alert('삭제에 실패하였습니다.');
			}
		},
		error : function(error) {
			console.error('Error',error);
		}
	});
	}
}

/* common */
function checkSearchForm() {
	 var keywordValue = document.getElementById('keyword').value;

      if (keywordValue === '') {
        alert('검색어를 입력하세요.');
        return false;
      }
      return true;
}