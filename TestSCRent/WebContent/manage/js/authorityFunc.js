/**
 * 
 */

$(document).ready(function() {

	var pageName = $('.page-header').html();
	if(pageName == '로그인'){
		// 세션 찾는 액션 실행 하지 않음
		$('.container-fluid li>a').click(function(){
			$(this).attr('href', '#');
		});

	}else{
		//1. 세션에서 아이디 찾고 그 아이디의 직급 가져오기
			
		$.ajax({
			url: 'searchGradeOfManager.action',
			type: 'post',
			dataType: 'json', //데이터 받을때에는 속성명 주의! data아님 
			success: function(obj){
				
				var manager = obj.manager;
				var grade = manager.grade;
				
				if(grade =='사원'){
					$('#level02').css('display', 'none');
					$('#level03').css('display', 'none');
				}else if(grade == '주임'){
					$('#level03').css('display', 'none');
				}
				
				
			}
		});
		
	}
	
	//2. 직급별로 <ul> id="level01" 의 속성값 변경

	
});