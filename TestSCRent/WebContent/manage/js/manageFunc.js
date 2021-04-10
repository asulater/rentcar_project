/**
 * 
 */

$(document).ready(function() {
	

});



function showDetailManagerInfo(managerId){
	
	location.href = 'searchManager.action?selectManagerId=' + managerId;
	
}


function infoUpdateValueChk(managerId){
	
	var selectGrade = $('#selectView option:selected').val(); //select box 에서 선택한 option의 값(value)
	
	location.href = 'updateManagerGrade.action?selectManagerId=' + managerId + '&changedGrade=' + selectGrade;
	
	return false;
}
