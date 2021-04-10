<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
/* body{margin:40px;} */

.stepwizard-step p {
    margin-top: 10px;  
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 18px;
    bottom: 0;
    position: absolute; 
     content: " "; 
    width: 100%;
    height: 1px;
    background-color: #ccc;
    left: 0;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
    /* Width = 100% / number-of-steps */
    width: 20%;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(document).ready(function () {
	    $.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        buttonImage: "Client/image/calendar.png", //달력 표시 버튼 이미지
			buttonImageOnly: true, //버튼을 클릭해야만 달력 표시
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
			firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        showOn: 'both',
	        buttonText: "달력",
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99',
	        minDate: 0
	    };
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	    
	    $('#startDay').datepicker();
	    $('#startDay').datepicker("option", "maxDate", $("#endDay").val());
	    $('#startDay').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#endDay").datepicker( "option", "minDate", selectedDate );
	    });
	 
	    $('#endDay').datepicker();
	    $('#endDay').datepicker("option", "minDate", $("#startDay").val());
	    $('#endDay').datepicker("option", "onClose", function ( selectedDate ) {
	    	$("#startDay").datepicker( "option", "maxDate", selectedDate );
	    });
	    /* $('#startDay').datepicker({ minDate: 0}); */
	});
});

</script>
<title>Rent1</title>
</head>
<body>
<h4>대여 기간</h4>
<div class="stepwizard">
    <div class="stepwizard-row"></div>
	<div class="stepwizard-step"> 
		<button type="button" class="btn btn-primary btn-circle">1</button>
		<p>대여 기간</p>
	</div>
	<div class="stepwizard-step"> 
		<button type="button" class="btn btn-default btn-circle">2</button>
		<p>차량 선택</p>
	</div>
	<div class="stepwizard-step"> 
		<button type="button" class="btn btn-default btn-circle">3</button>
		<p>여정 선택</p>
	</div>
	<div class="stepwizard-step"> 
		<button type="button" class="btn btn-default btn-circle">4</button>
		<p>결       제</p>
	</div>

</div>



<fieldset style="margin-top: 30px;">
<!-- 	<legend>대여 기간</legend> -->
	<table>
		<tr>
			<td rowspan="2" width="110px" style="border-right: 1px solid #ddd;">대여기간 선택</td>
			<td height="35px" style="padding-left: 10px;">
			대여일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="vo.startDay" id="startDay" class="date" onchange="dateChange()">
			&nbsp;&nbsp;&nbsp;
			<select id="sHour" name="sHour" onchange="timeChange()">
			<option value="00">00</option>
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			</select>&nbsp;&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;
			<select class="timeChange" id="sMinute" name="sMinute" onchange="timeChange()">
			<option value="00">00</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
			</select>&nbsp;&nbsp;&nbsp;분
			</td>
		</tr>
		<tr>
			<td height="35px" style="padding-left: 10px;">
			반납일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="vo.endDay" id="endDay" class="date" onchange="dateChange()" >
			&nbsp;&nbsp;&nbsp;
			<select id="eHour" name="eHour" onchange="timeChange()">
			<option value="00">00</option>
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			</select>&nbsp;&nbsp;&nbsp;시&nbsp;&nbsp;&nbsp;
			<select class="timeChange" id="eMinute" name="eMinute" onchange="timeChange()">
			<option value="00">00</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="40">40</option>
			<option value="50">50</option>
			</select>&nbsp;&nbsp;&nbsp;분
			</td>
		</tr>
		<tr><td></td><td></td></tr>
		<tr>
			<td height="35px" style="border-right: 1px solid #ddd;">자차보험 여부</td>
			<td style="padding-left: 10px;">
				<div style="margin-right: 10px; float: left;"><label><input type="radio" name="rb1" id="ins1" class="rb1" value="가입" onchange="insCheck()"  >가입</label></div>
				<label><input type="radio" name="rb1" id="ins2" class="rb1" value="안함" onchange="insCheck()" >안함</label>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="red">*가입시 30,000원 추가 과금됩니다.</font>				
			</td>
		</tr>
		<tr>
			<td height="35px" style="border-right: 1px solid #ddd;">기타 옵션</td>
			<td style="padding-left: 10px;">
				<div style="margin-right: 10px; float: left;"><label><input type="radio" name="rb2" id="opt1" class="rb2" value="유모차" onchange="optCheck()" onclick="rbCheck(this)">유모차</label></div>
				<label><input type="radio" name="rb2" id="opt2" class="rb2" value="카시트" onchange="optCheck()" onclick="rbCheck(this)">카시트</label>
			</td>
		</tr>
	</table>
</fieldset>
</body>
</html>