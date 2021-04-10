/**
 * 
 */

var todayMonth; //이번 달(현재 시간을 기준으로 총 4개월 간의 일정만 보여지게 하기 위함)

var currentYear; //달력에 보여지는 연도
var currentMonth; //달력에 보여지는 달

var carId; //선택한 차량의 아이디


$(document).ready(function() {

});



/**
 * 닫기 버튼 클릭시 calendar 숨기기
 */
function closeSchedule(){
	
	$('.scheduleWindow').css('display', 'none');
	$('.closeScheduleWin').css('display', 'none');
	
}



/**
 * 화면에 popup 출력
 * @param selectCarId 선택한 차량의 아이디
 */
function showScheduleWindow(selectCarId){
	
	carId = selectCarId;
	console.log(carId);
	
	var date = new Date();
	
	currentYear = date.getFullYear();
	currentMonth = (date.getMonth() + 1);
	todayMonth = (date.getMonth() + 1);

	
	// 선택한 위치를 기준으로 보여주기
	
	var scrollY = $(window).scrollTop(); //페이지가 스크롤 된 높이도 포함
	var x = event.clientX - 300;
	var y = event.clientY - 50 + scrollY;

	
	$('.scheduleWindow').css('top', y);
	$('.scheduleWindow').css('left', x);
	
	$('.scheduleWindow').css('display', 'block');
	$('.closeScheduleWin').css('display', 'block');
	
	
	// 달력 출력
	showCalendarTitle();
	getReserveCurrentMonth();


}


function getReserveCurrentMonth(){
	
	$.ajax({
		
		url: 'showCurrentMonth.action',
		type: 'post',
		data: {selectCarId: carId, selectYear: currentYear, selectMonth: currentMonth} ,
		dataType: 'json', 
		success: function(data){

			var items = data.reserveDayList; // 예약 중인 날짜의 목록
			var d1 = getfirstDay(currentYear, currentMonth);
			
			var activeDate = [];
			if(items != null){
				$.each(items, function(index, item){
	
					activeDate[index] = item.substring(6,8);
					console.log(activeDate[index]);
					
				});
			}
			
			
			// 출력
			showCalendar(currentYear, currentMonth, activeDate);
		}
	});
	
}



/**
 * 달력 상단부분(caption) 변경
 */
function showCalendarTitle(){
	$('#monthYearTitle').html(((currentMonth < 10) ? ('0' + currentMonth) : currentMonth)  +' ' + currentYear);
}



/**
 * 이전 달의 일정보기
 */
function showPrevCalendar(){

	
	//month가 1~12 사이에 위치하는지 체크
	//cm==1?(cy-1)+','+12:cy+','+(cm-1))
	
	if (currentMonth == 1){
		currentYear  -= 1;
		currentMonth = 12;
	} else {
		currentMonth -= 1;
	}
	
	
	//화면 갱신
	showCalendarTitle();
	getReserveCurrentMonth();
	
}


/**
 * 다음 달의 일정보기
 */
function showNextCalendar(){
	
	//month가 1~12 사이에 위치하는지 체크
	//(m==12?(y+1)+','+1:y+','+(m+1))
	
	if (currentMonth == 12) {
		currentYear += 1;
		currentMonth = 1;
	} else {
		currentMonth += 1;
	}
	
	//화면 갱신
	showCalendarTitle();
	getReserveCurrentMonth();

	
}

function getfirstDay(y, m){
	
	var d1 = (y+(y-y%4)/4-(y-y%100)/100+(y-y%400)/400 
	          +m*2+(m*5-m*5%9)/9-(m<3?y%4||y%100==0&&y%400?2:3:4))%7; 
	
	return d1;
}


/**
 * 일자(1~31) 출력 부분
 * @param y 원하는 년도(currentYear)
 * @param m 원하는 달(currentMonth)
 */
function showCalendar(y, m, activeDate) { 
	
	var result=[];
	var d1 = getfirstDay(y,m);
	
	result.push('<tr>'); 
	
	var prevDay = getEndOfMonth(y,m-1); //이전 달 일자 표시에 사용하는 카운터
	var nextDay = 1; //다음 달 일자 표시에 사용하는 카운터
	
	for (i = 0; i < 42; i++) { 
		
		if (i%7==0) result.push('</tr><tr>'); 
		
        if (i < d1){ //이전 달의 일자 표시

        	result.push('<td class="off"><a href="#">' + prevDay + '</a></td>');
        	prevDay -= 1;
        	
        } else if(i >= d1+(m*9-m*9%8)/8%2+(m==2?y%4||y%100==0&&y%400?28:29:30)){ // 다음 달의 일자 표시
        	
        	result.push('<td class="off"><a href="#">' + nextDay + '</a></td>');
        	nextDay += 1;
        	
        } else { //이번 달의 일자 표기
        	
        	var sameDate = false;
        	var tdIndex = (i+1-d1);
        	
        	if(activeDate.length > 0){
	        	$.each(activeDate, function(index, date){
	        		if(tdIndex == date) sameDate = true;
	        	});
        	}
        	
        	if(sameDate) {
        		result.push('<td class="active"><a href="#">' + (i+1-d1) + '</a></td>');
        	}else{
        		result.push('<td><a href="#">' + (i+1-d1) + '</a></td>');
        	}

	
        }
        
	}
	result.push('</tr>'); 
	$('#printDate').html(result.join(''));
	
} 


/**
 * 특정 달의 마지막 날 구하기
 * @param y 년도
 * @param m 달
 * @returns 마지막 날
 */
function getEndOfMonth(y, m){
	var eDay;
	
	eDay = m==2?y%4||y%100 == 0 && y%400 ? 28:29:30;
	
	return eDay;
}