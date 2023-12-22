	function login(memail, mpw) {
			$.ajax ({
				type :'POST',
				url :'login.do',
				data : { memail : memail , mpw : mpw},
				success : function (result) {
					if(result === "Y"){
						alert('로그인 성공');
						location.href = 'main.do';
					}else{
						alert('로그인 실패');
					}
				},
				error : function(error){
					console.error('Error : ', error);
				}
			});
	}
