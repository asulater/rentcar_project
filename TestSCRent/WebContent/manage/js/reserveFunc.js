/**
 * 
 */
var carid =""; // 승인, 불승인 시 검색된 carid 가 있는지 여부를 판단하기 위한 변수
var limit = 0; // 배차가능여부

$(document).ready(function() {

});


/**
 * 특정 예약 기록에 대한 팝업을 띄움
 * @param rentNo 예약 고유값 
 * @param memberId 
 */
function showDetailReserveInfoWindow(rentNo, memberId, flag, carStatus){ //배차가능여부, 차량상태(배차완료, 사용중)
	
	limit = flag;
	var currentPageNum = $('#currentPageNum').val();
	
	layer_open('layer1'); // 팝업 띄우기

	if(carStatus == 1){
		$('#returnBtn').attr('onclick', 'clickOutBtn()');
		$('#returnBtn').html('차량인도');
	}else{
		$('#returnBtn').attr('onclick', 'clickReturnBtn()');
		$('#returnBtn').html('반납확인');
	}
	
	// 팝업 div 내부에 특정 대여 기록에 대한 상세 정보 채우기
	$('.popupWindow').load('showDetailReserveInfo.action?selectRentNo=' + rentNo + '&selectMemberId=' + memberId
			+ '&currentPageNum=' + currentPageNum + '&selectedCarStatus=' + carStatus);
	
	
}


function clickOutBtn(){
	
	var carid = $('#caridText').html();
	location.href='settingUsingCar.action?settingCarId=' + carid;
	
	
}


function layer_open(el){

	var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();
	}else{
		temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
		}
		e.preventDefault();
	});

	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});

}		


function clickAppBtn(){
	
	if(carid == "") {
		alert("먼저 차량을 검색해 주세요");
	}else{
	
		var rentno = $('#currentRentNo').val();
		location.href = 'settingAppReserve.action?settingCarId=' + carid + '&selectRentNo=' + rentno;
	}
}

function clickDisappBtn(){
	var rentno = $('#currentRentNo').val();
	location.href = 'settingDisappReserve.action?settingCarId=' + carid + '&selectRentNo=' + rentno;
}

function clickReturnBtn(){
	
	var rentno = $('#currentRentNo').val();
	var returnDate = $('#returnDate').val(); //실제 반납한 일자
	var mileage = $('#mileage').val();
	
	//유효성 검사
	if(returnDate.length != 8) alert("반납일 다시 입력");
	if(isNaN(mileage)) alert("숫자만 입력해주세요");

	
	location.href = 'settingReturnCar.action?settingCarId=' + carid + '&selectRentNo=' + rentno
		+'&inputReturnDate=' + returnDate 
		+'&inputMileage=' + mileage;
	
}



function showCarInfoItem(carname, fuel){ 

	if(limit == 1){
		$.ajax({
			
			url: 'searchingCarId.action',
			type: 'post',
			data: {selectCarName:carname, selectFuel:fuel, searchNewCarIdFlag: 'auto'},
			dataType: 'json', 
			success: function(data){
				
				carid = '';
				$('#selectBtn').css('display', 'none');

				var item = data.detailReserveInfo; // 마지막 대여일, 세탁여부, 자동차 고유값만 js에서 사용할 것임
				
				if (item != null) {
					var result=[];
					result.push('<tr>'); 
					result.push('<td width="110px">마지막 대여일</td>');
					
					var lastday = String(item.lastday);
					
					if(lastday == '') { //@@ vo에서 String 타입인 lastday 의 null 체크 방법? 
					
						result.push('<td  width="100px">' + item.lastday + '</td>');
			
					}else{
					
						result.push('<td  width="100px">신차</td>');
					
					}
					
					result.push('<td width="110px">세차 여부</td>');
					result.push('<td>'+ item.wash_car +'</td>');
					result.push('</tr>'); 
							
					$('#carInfoItem').html(result.join(''));
					$('#caridText').html(item.carid); 
					carid = String(item.carid);
					
				} else{
					$('#caridText').html('조건에 맞는 사용가능 차량이 없습니다');
				}

			}
		});
		
	}else{
		alert("차량 배정은 일주일 전부터 가능합니다");
	}
	
	
}


function showSelectableCarList(carname, fuel){ 

	if(limit == 1){
		$.ajax({
			
			url: 'searchingCarId.action',
			type: 'post',
			data: {selectCarName:carname, selectFuel:fuel, searchNewCarIdFlag: 'manual'},
			dataType: 'json', 
			success: function(data){
				
				$('#selectBtn').css('display', 'none'); //자동 검색 버튼 숨기기
				$('#manualSelectBtn').css('display', 'none'); //수동 검색 버튼 숨기기

				var items = data.selectableList; // 마지막 대여일, 세탁여부, 자동차 고유값만 js에서 사용할 것임
				
				if (items != null) {
					
					var result=[];

					result.push('<table>'); 
					result.push('<tr>');
					result.push('<td width="100px">차량번호</td>');
					result.push('<td width="110px">마지막 대여일</td>');
					result.push('<td width="100px">세차 여부</td>');
					result.push('<td>선택</td>');
					result.push('</tr>');
					
					$.each(items, function(index, item){
					
						result.push('<tr>'); 
						result.push('<td>' + item.carid + '</td>');
						
						var lastday = String(item.lastday);
						if(lastday == '') {
							result.push('<td>' + item.lastday + '</td>');
						}else{
							result.push('<td>신차</td>');
						}

						result.push('<td>'+ item.wash_car +'</td>');
						result.push('<td><button type="button" id="selectCarIdBtn" onclick="showSelectedCarId(\''+ item.carid +'\')">선택</button></td>');
						result.push('</tr>'); 
					
					});
					result.push('</table>'); 
					$('#selectableCarList').html(result.join(''));

					
				} else{
					$('#selectableCarList').html('조건에 맞는 사용가능 차량이 없습니다');
				}

			}
		});
		
	}else{
		alert("차량 배정은 일주일 전부터 가능합니다");
	}
	
	
}


/**
 * 화면 내에 선택한 값을 보이기
 */
function showSelectedCarId(selectedId){
	alert(selectedId);
	$('#caridText').html(selectedId); //리스트 내 버튼을 클릭했을 때 
	carid = String(selectedId);
}

function cancelReserve(rentno){
	
	alert("예약 기록을 삭제합니다");
	
	location.href='deleteRentInfo.action?selectRentNo=' + rentno;
	
}







