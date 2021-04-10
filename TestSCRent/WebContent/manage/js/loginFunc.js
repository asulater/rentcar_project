/**
 * 로그인 시 입력값의 유효성 체크
 * @returns {Boolean}
 */
function loginValueChk(){
	var id = document.getElementById('id').value;
	var pw = document.getElementById('password').value;
	
	if(id=='' || pw==''){
		alert("다시 입력");
		return false;
	}
	
	return true;
}


/**
 * 사원등록 시 입력값의 유효성 체크
 * @returns {Boolean}
 */
function joinValueChk(){
	var id = $('#id').val();
	var pw = $('#password').val();
	var name = $('#name').val();
	var phone = $('#phone').val();
	var email = $('#email').val();
	
	if(id=='' || pw=='' || name=='' || phone=='' || email==''){
		alert("다시 입력");
		return false;
	}

	return true;
	
}

