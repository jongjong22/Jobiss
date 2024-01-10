/**
 * 자기소개서 업데이트 ( 아직 안함)
 */
 /* mypage.jsp (성장과정 선택 버튼) */
   function updateGptgrow(gptgid){
   		var checkconfirm = confirm('성장과정을 업데이트 시키겠습니까?');
   		
   		if(checkconfirm){
   			$.ajax({
   				type : 'POST',
   				url : 'updateGptgrow.do',
   				data : { gptgid : gptgid },
   				success : function(result){
   					if(result === 'Y') {
   						alert('업데이트 완료');
   						location.href = 'mypage.do';
   					}else{
   						alert('업데이트 실패');
   					}
   				},
   				error : function(error){
   					console.error('Error',error);
   				}
   				
   			}); 
   		}
   } /* End point */
   
   
    /* mypage.jsp (성장과정 직접 수정) */
   function psgupdate(pid,content) {
   		var checkconfirm = confirm('이력서를 수정 하시겠습니까?');
   		
   		if(checkconfirm){
   			$.ajax({
   				type : 'POST',
   				url : 'psgupdate.do',
   				data : { pid : pid,
   						content : content },
   				success : function(result){
   					if(result === 'Y') {
   						alert('업데이트 완료');
   						location.href = 'mypage.do';
   					}else{
   						alert('업데이트 실패');
   					}
   				},
   				error : function(error){
   					console.error('Error',error);
   				}
   				
   			}); 
   		}
   }/* End point */
        
    /* mypage.jsp (성격장단점 선택 버튼) */ 
    function updateGptcharacter(gptcid) {
    	var checkconfirm = confirm('성격장단점을 업데이트 하겠습니까?'); 
    	
    	if(checkconfirm){
    		$.ajax({
    			type : 'POST',
    			url : 'updateGptcharacter.do',
    			data : { gptcid : gptcid},
    			success : function(result){
    				if(result === 'Y'){
    					alert('업데이트 완료');
    					location.href = 'mypage.do';
    				}else{
    					alert('업데이트 실패');	
    					}
    			},
    			error : function(error){
    				console.error('Error',error);	
    			}
    			
    		});
    	}
    }/* End point */	
    
 /* mypage.jsp (성격장단점 직접 수정) */
   function pscupdate(pid,content) {
   		var checkconfirm = confirm('이력서를 수정 하시겠습니까?');
   		
   		if(checkconfirm){
   			$.ajax({
   				type : 'POST',
   				url : 'pscupdate.do',
   				data : { pid : pid,
   						content : content },
   				success : function(result){
   					if(result === 'Y') {
   						alert('업데이트 완료');
   						location.href = 'mypage.do';
   					}else{
   						alert('업데이트 실패');
   					}
   				},
   				error : function(error){
   					console.error('Error',error);
   				}
   				
   			}); 
   		}
   }/* End point */		
   
   
/* mypage.jsp (지원동기 선택 버튼) */ 
    function updateGptmotive(gptmid) {
    	var checkconfirm = confirm('지원동기를 업데이트 하겠습니까?'); 
    	
    	if(checkconfirm){
    		$.ajax({
    			type : 'POST',
    			url : 'updateGptmotive.do',
    			data : { gptmid : gptmid},
    			success : function(result){
    				if(result === 'Y'){
    					alert('업데이트 완료');
    					location.href = 'mypage.do';
    				}else{
    					alert('업데이트 실패');	
    					}
    			},
    			error : function(error){
    				console.error('Error',error);	
    			}
    			
    		});
    	}
    }/* End point */
    
    
 /* mypage.jsp (지원동기 직접 수정) */
   function psmupdate(pid,content) {
   		var checkconfirm = confirm('이력서를 수정 하시겠습니까?');
   		
   		if(checkconfirm){
   			$.ajax({
   				type : 'POST',
   				url : 'psmupdate.do',
   				data : { pid : pid,
   						content : content },
   				success : function(result){
   					if(result === 'Y') {
   						alert('업데이트 완료');
   						location.href = 'mypage.do';
   					}else{
   						alert('업데이트 실패');
   					}
   				},
   				error : function(error){
   					console.error('Error',error);
   				}
   				
   			}); 
   		}
   }/* End point */	
   
   
/* mypage.jsp (입사후포부 선택 버튼) */ 
    function updateGptplan(gptpid) {
    	var checkconfirm = confirm('입사후포부를 업데이트 하겠습니까?'); 
    	
    	if(checkconfirm){
    		$.ajax({
    			type : 'POST',
    			url : 'updateGptplan.do',
    			data : { gptpid : gptpid},
    			success : function(result){
    				if(result === 'Y'){
    					alert('업데이트 완료');
    					location.href = 'mypage.do';
    				}else{
    					alert('업데이트 실패');	
    					}
    			},
    			error : function(error){
    				console.error('Error',error);	
    			}
    			
    		});
    	}
    }/* End point */   
   	   		
 /* mypage.jsp (입사후포부 직접 수정) */
   function pspupdate(pid,content) {
   		var checkconfirm = confirm('이력서를 수정 하시겠습니까?');
   		
   		if(checkconfirm){
   			$.ajax({
   				type : 'POST',
   				url : 'pspupdate.do',
   				data : { pid : pid,
   						content : content },
   				success : function(result){
   					if(result === 'Y') {
   						alert('업데이트 완료');
   						location.href = 'mypage.do';
   					}else{
   						alert('업데이트 실패');
   					}
   				},
   				error : function(error){
   					console.error('Error',error);
   				}
   				
   			}); 
   		}
   }/* End point */	       
    