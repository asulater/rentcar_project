/**
 * 
 */


$(document).ready(function() {


});

function goDetailNoticePage(noticeNo){
	
//	alert(noticeNo);
	location.href='showNotice.action?noticeNo=' + noticeNo;
	
}

function goWriteNoticePage(){
	
	location.href='goWriteBoardNotice.action';
}