<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>차량 예약 | SmartChoice Rent</title>
	<link rel="shortcut icon" href="../image/favicon1.ico">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	
	<link href="Client/css/bootstrap.min.css" rel="stylesheet">
	<link href="Client/css/animate.min.css" rel="stylesheet">
	<link href="Client/css/main.css" rel="stylesheet">
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
	<style type="text/css">
	
		.stepwizard-step p {margin-top: 10px; }
 		.stepwizard-row {display: table-row;} 
		.stepwizard {display: table; width: 100%; position: relative;}
		.stepwizard-step button[disabled] {opacity: 1 !important; filter: alpha(opacity=100) !important;}
 		.stepwizard-row:before {top: 14px; bottom: 0; position: absolute; content: " "; width: 100%; height: 1px; background-color: #ccc; z-order: 0;} 
		.stepwizard-step { display: table-cell; text-align: center; position: relative; /* Width = 100% / number-of-steps */width: 20%;}
		.btn-circle { width: 30px; height: 30px; text-align: center; padding: 6px 0; font-size: 12px; line-height: 1.428571429; border-radius: 15px;}
	
		#rentTitle {font-size: xx-large; font-weight: bold; color: #ddd; width: 100%; height: 40px; text-align: left; padding-left: 30px; margin-top: 20px; margin-bottom: 15px;}
		#rentResultTable {width: 450px; height: 500px; border: 1px solid black;}
		#rentResultTable tr {height: 30px;}
		#rentResultTable tr td {height: 30px;}
		
	</style>
	
	<script src="Client/js/jquery-1.11.3.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="/lmxsrv/jquery-ui-1.10.4/development-bundle/ui/minified/i18n/jquery.ui.datepicker-ko.min.js"></script>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=39bc76d90d173f1b62b3dbfac3fd90e5&libraries=services"></script>
	<script src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=4d796e0e-1f06-3e3a-b563-e0e64c5f14c9"></script>
	
	
	<script src="Client/js/bootstrap.min.js"></script>
	<script src="Client/js/jquery.prettyPhoto.js"></script>
	<script src="Client/js/jquery.isotope.min.js"></script>
	<script src="Client/js/main.js"></script>
	<script src="Client/js/wow.min.js"></script>
	
	<script type="text/javascript">
$(document).ready(function()
		{
			$('#div1').load("rent1.action");
		});
		
		
function a1() 
{
	var a = document.getElementById('btn2_1');
	var b = document.getElementById('btn1_1');
	var c = document.getElementById('btn2_2');
	$('#div1').load("rent1.action");
	
	a.removeAttribute("style");
	b.setAttribute("style", "display:none");
	c.setAttribute("style", "display:none");
}
function a2() 
{
	var a = document.getElementById('btn1_1');
	var b = document.getElementById('btn2_2');
	var c = document.getElementById('btn1_2');
	var d = document.getElementById('btn2_3');
	$('#div1').load("rent2.action");
	
	a.removeAttribute("style");
	b.removeAttribute("style");
	c.setAttribute("style", "display:none");
	d.setAttribute("style", "display:none");
}
function a3() 
{
	var a = document.getElementById('btn1_2');
	var b = document.getElementById('btn2_3');
	var c = document.getElementById('btn1_3');
	var d = document.getElementById('btn2_4');
	
	var cn = $('#car').text();
	
	$.ajax({
		url: 'rent3.action',
		type: 'post',
		data: {carName: cn},
		dataType: 'json',
		success: fuelOK
	});
	
	a.removeAttribute("style");
	b.removeAttribute("style");
	c.setAttribute("style", "display:none");
	d.setAttribute("style", "display:none");
}
function b1() 
{
	var st = $('#sTime').html();
	var et = $('#eTime').html();
	if (st == "") {
		alert("대여일을 바르게 입력하세요");
		document.getElementById("startDay").focus();
		return false;
	}
	if (et == "") {
		alert("반납일을 바르게 입력하세요");
		document.getElementById("endDay").focus();
		return false;
	}
	if ($('#ins').html() == "")
	{
		alert("보험 가입 여부를 선택하세요.")
		return false;
	}
	var a = document.getElementById('btn2_1');
	var b = document.getElementById('btn1_1');
	var c = document.getElementById('btn2_2');
	$('#div1').load("rent2.action");
	
	a.setAttribute("style", "display:none");
	b.removeAttribute("style");
	c.removeAttribute("style");
}

function b2() 
{
	var a = document.getElementById('btn2_2');
	var b = document.getElementById('btn1_1');
	var c = document.getElementById('btn1_2');
	var d = document.getElementById('btn2_3');

	var cn = $('#car').text();
	if (cn == ""){
		alert("차량을 선택하세요")
		return false;
	}
	$.ajax({
		url: 'rent3.action',
		type: 'post',
		data: {carName: cn},
		dataType: 'json',
		success: fuelOK
	});
	
	a.setAttribute("style", "display:none");
	b.setAttribute("style", "display:none");
	c.removeAttribute("style");
	d.removeAttribute("style");
}
function fuelOK(object) {
	$('#div1').load("rent3_1.action?carName="+object.carName+"&fuel="+object.fuel);
}


function b3() {
	var a = document.getElementById('btn2_3');
	var b = document.getElementById('btn1_2');
	var c = document.getElementById('btn1_3');
	var d = document.getElementById('btn2_4');
	
	var total = $('#total').text();
	$.ajax({
		url: 'rent4.action',
		type: 'post',
		data: {total: total},
		dataType: 'json',
		success: payOK
	});
	
	a.setAttribute("style", "display:none");
	b.setAttribute("style", "display:none");
	c.removeAttribute("style");
	d.removeAttribute("style");
}
//결제화면으로 총 결제금액 넘기기
function payOK(obj) {
	$('#div1').load("rent4_1.action?total="+obj.total);
}
function b4() {
	var cn = $('#car').text();
	var sd = $('#sDay').text()+$('#sTime').text();
	var ed = $('#eDay').text()+$('#eTime').text();
	var opt = $('#opt').text();
	var t = $('#total').text();
	var ins = $('#ins').text();
	if (opt == "")
		opt = "없음";
	if (ins == "30,000원")
		ins = 0;
	if (ins == "없음")
		ins = 1;
	$.ajax({
		url: 'rentAction.action',
		type: 'post',
		data: {carName: cn, startDay: sd, endDay: ed, insurance:ins, options: opt, total: t},
		dataType: 'json',
		success: bookOK
	});
}

function bookOK(obj) {
	var rno = obj.rentNo;
	if (rno == 0)
	{
		alert('실패');
		location.href = "rentFail.action";
	}
	if (rno != 0)
	{
		alert("결제완료"+rno);
		location.href = "rentSuccess.action?rentNo="+rno;
	}
}

function dateChange() {
	$('#total').html("")
	$('#fee').html("")
	var sDate = $('#startDay').val();
	var eDate = $('#endDay').val();
	var s = parseInt($('#sHour').val()+$('#sMinute').val())
	var e = parseInt($('#eHour').val()+$('#eMinute').val())
	$('#sDay').html(sDate);
	$('#eDay').html(eDate);
	if (sDate == eDate && e-s < 100 && $('#eTime').val() != "")//1시간 미만 대여 불가
	{
		alert("대여시간은 최소 1시간입니다.")
		$('#sTime').html("");
		$('#eTime').html("");
		return false;
	}
	//날짜계산
	var sd = $('#startDay').val().split("-");
	var sd1 = parseInt(sd[0]+sd[1]+sd[2]);
	var ed = $('#endDay').val().split("-");
	var ed1 = parseInt(ed[0]+ed[1]+ed[2]);
	if (ed1-sd1 == 0) {
		alert("대여시간은 최소 1시간입니다.");
		$('#sTime').html("");
		$('#eTime').html("");
		return false;
	}
	$('#sDay').html(sDate);
	$('#eDay').html(eDate);
}

function timeChange() {
	$('#total').html("")
	$('#fee').html("")
	var sDate = $('#startDay').val();
	var eDate = $('#endDay').val();
	var s = parseInt($('#sHour').val()+$('#sMinute').val())
	var e = parseInt($('#eHour').val()+$('#eMinute').val())
	var sh = " / "+$('#sHour').val() +"시 "+ $('#sMinute').val()+"분";
	var eh = " / "+$('#eHour').val() +"시 "+ $('#eMinute').val()+"분";
	if (sDate == eDate && e-s < 100 && $('#eTime').val() == "" && e != 0)//1시간 미만 대여 불가
	{
		alert("대여시간은 최소 1시간입니다.")
		$('#sTime').html("");
		$('#eTime').html("");
		return false;
	}
	$('#sTime').html(sh);
	if (e != 0)
		$('#eTime').html(eh);
}

function insCheck() {
	var ins = $(':radio[name="rb1"]:checked').val();
	if (ins == "가입") {
		$('#ins').html("30,000원");
	//	$("#won").attr("style","");
	}	
	if (ins == "안함") {
		$('#ins').html("없음");
	//	$("#won").attr("style","display:none");
	}
}

function optCheck() {
	var opt = $(':radio[name="rb2"]:checked').val();
	if (opt == "유모차") {
		$('#opt').html("유모차");
	}	
	if (opt == "카시트") {
		$('#opt').html("카시트");
	}
}

var state = false; 

function rbCheck(o){ 
	if(state) {
		o.checked = false;
		$('#opt').html("");
	}
	state = o.checked;
}

function carSelect(cn) 
{
	$('#total').html("")
	var cInfo = cn.split("-");
	$('#car').html(cInfo[0]+" ["+cInfo[1]+"]");
	var tFee = parseInt(cInfo[2])/24;
	
	var sd = $('#sDay').html().split("-");
	var sd1 = parseInt(sd[0]+sd[1]+sd[2]);
	var st = $('#sTime').html();
	var ed = $('#eDay').html().split("-");
	var ed1 = parseInt(ed[0]+ed[1]+ed[2]);
	var et = $('#eTime').html();

	var st = sd[0]+sd[1]+sd[2]+st.substring(3,5)+st.substring(7,9);
	var et = ed[0]+ed[1]+ed[2]+et.substring(3,5)+et.substring(7,9);
	// 시작일시 
	var sdt = new Date(parseInt(st.substring(0,4), 10),
			parseInt(st.substring(4,6), 10)-1,
			parseInt(st.substring(6,8), 10),
			parseInt(st.substring(8,10), 10),
			parseInt(st.substring(10,12), 10)
			);
	// 종료일시 
	var edt = new Date(parseInt(et.substring(0,4), 10),
			parseInt(et.substring(4,6), 10)-1,
			parseInt(et.substring(6,8), 10),
			parseInt(et.substring(8,10), 10),
			parseInt(et.substring(10,12), 10)
			);
	// 두 일자(startTime, endTime) 사이의 차이를 구한다.
	var dateGap = edt.getTime() - sdt.getTime();
	var timeGap = new Date(0, 0, 0, 0, 0, 0, edt - sdt); 
	
	// 두 일자(startTime, endTime) 사이의 간격을 "일-시간-분"으로 표시한다.
	var diffDay = Math.floor(dateGap / (1000 * 60 * 60 * 24)); // 일수       
	var diffHour = timeGap.getHours();	// 시간 
	var diffMin = timeGap.getMinutes();	// 분
	var diffSec = timeGap.getSeconds(); // 초

	var aFee = Math.floor((tFee*(diffDay*24+diffHour)+(diffMin/10)*(tFee/6))/10)*10
	
	$('#fee').html(Number(aFee).toLocaleString().split(".")[0]+"원");
	if ($('#ins').html() != "없음")
		$('#total').html(Number(aFee+30000).toLocaleString().split(".")[0]+"원");
	else if ($('#ins').html() == "없음")
		$('#total').html(Number(aFee).toLocaleString().split(".")[0]+"원");
}

/* function mAdd() {
	alert("mADDDDDDDDDDDD")
	var str = '경유지&nbsp;<input type="text" id="st1">';
	var str1 = '<a href="#" onclick="mAdd2()"><img src="../Client/image/More-128.png" style="width: 30px;height: 30px"></a>';
	var str2 = '<a href="#" onclick="mDel1()"><img src="../Client/image/Less-128.png" style="width: 30px;height: 30px"></a>';
	$('#addSt1').html(str);
	$('#mImg1').html(str1);
	$('#mImg').html(str2);

}
 */

function mAdd1() {
	var str = '경유지&nbsp;<a href="javascript:;" onclick="layer_open3()"><input type="text" id="st1"><img src="Client/image/1445232242_Location.png" style="width: 15px;height: 15px"></a>';
	var str1 = '<a href="javascript:;" onclick="mAdd2()"><img src="Client/image/More-128.png" style="width: 30px;height: 30px"></a>';
	var str2 = '<a href="javascript:;" onclick="mDel1()"><img src="Client/image/Less-128.png" style="width: 30px;height: 30px"></a>';
	$('#addSt1').html(str);
	$('#addSt1').attr("style","");
	$('#mImg1').html(str1);
	$('#mImg').html(str2);
}

function mDel1() {
	var str = '<a href="javascript:;" onclick="mAdd1()"><img src="Client/image/More-128.png" style="width: 30px;height: 30px"></a>';
	$('#mImg').html(str);
	$('#addSt1').html("");
	$('#addSt1').attr("style","display: none;");
	$('#mImg1').html("");
}

function mAdd2() 
{
	var param = "aaa";
	var str = '경유지&nbsp;<a href="javascript:;" onclick="layer_open4()"><input type="text" id="st2"><img src="Client/image/1445232242_Location.png" style="width: 15px;height: 15px"></a>';
	var str2 = '<a href="javascript:;" onclick="mDel2()"><img src="Client/image/Less-128.png" style="width: 30px;height: 30px"></a>';
	$('#addSt2').attr("style","");
	$('#addSt2').html(str);
	$('#mImg1').html(str2);
	$('#mImg').html("");
}
function mDel2() 
{
	var str = '<a href="javascript:;" onclick="mAdd2()"><img src="Client/image/More-128.png" style="width: 30px;height: 30px"></a>';
	var str1 = '<a href="javascript:;" onclick="mDel1()"><img src="Client/image/Less-128.png" style="width: 30px;height: 30px"></a>';
	$('#mImg1').html(str);
	$('#addSt2').attr("style","");
	$('#addSt2').html("");
	$('#mImg').html(str1);
}

//맵 띄우기
function layer_open1(){
	var temp = $('#layer1');		//레이어의 id를 temp변수에 저장
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

	temp.find('a.cbtn').click(function(e){
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
	OpenStartMap();
}
function layer_open2(){
	var temp = $('#layer2');		//레이어의 id를 temp변수에 저장
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

	temp.find('a.cbtn').click(function(e){
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
	OpenEndMap();
}
function layer_open3(){
	var temp = $('#layer3');		//레이어의 id를 temp변수에 저장
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

	temp.find('a.cbtn').click(function(e){
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
	OpenVia1Map();
}
function layer_open4(){
	var temp = $('#layer4');		//레이어의 id를 temp변수에 저장
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

	temp.find('a.cbtn').click(function(e){
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
	OpenVia2Map();
}


function layer_open5(){
	var temp = $('#layer5');		//레이어의 id를 temp변수에 저장
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

	temp.find('a.cbtn').click(function(e){
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

function closeMap() {
	$("#layer5").fadeOut();
}

function costCompare() 
{
	var cn = $('#car').text();
	var d = $('#distance').text();
//	alert(cn +"|"+d)
	window.open("goCostCompare.action?carName="+cn+"&distance="+d, "예상 유류비 비교","width=700, height=480");
}


</script>

</head>


<body>
    <!-- 상단 타이틀 -->
	<header id="header">
		<div class="top-bar" style="height: 70px; margin: 0;">
		   <div class="container" >
		        <div class="row" align="right" style="height: 54px; margin: 0;">
		        	<ul class="social-share" style="margin: 0;">
						<s:if test="#session.loginName == null">
						<li><a id="top" href="<s:url value="/joinForm.action" />">JOIN</a>
						<li><a id="top" href="<s:url value="/loginForm.action" />">LOGIN</a>
						</s:if>
						<s:else>
						<li style="margin-top:20px;"><h3>Welcome <s:property value="#session.loginName"/>님</h3></li>
						<li><a id="top" href="<s:url value="/myPage.action" />">MyPage</a></li>
						<li><a id="top" href="<s:url value="/logout.action" />">로그아웃</a></h3></li>
						</s:else>
					</ul>
		        </div>
		    </div><!-- /.container -->
		</div><!-- /.top-bar -->
		
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <a href="index.action"><img src="Client/image/logo.png" alt="logo" width="50%"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.action">Home</a></li>
                        <li class="active"><a href="rentCar.action">차량예약</a></li>
                        <li><a href="bookingChk.action">예약확인</a></li>
                        <li><a href="carList.action">보유차량</a></li>
						<li><a href="notice.action">공지사항</a></li>            
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
	
	    
	<center style="height: 702px;">
		<div id="outerDiv" style="width: 1200px;">
			
			<div id="rentTitle">차량예약</div>
			
			<div id="div1" style="border:1px; width:630px; height:642px; float: left;"></div>
			
			<div id="div2" style="border:1px; width:520px; height:642px; float: left; padding-top: 10px; padding-right: 10px;" align="right">	
				
				<table id="rentResultTable">
				
					<tr>
						<td width="150px">대여 차종</td>
						<td width="300px"><span id="car"></span></td>
					</tr>
					<tr>
						<td>대여 일시</td>
						<td><span id="sDay"></span><span id="sTime"></span></td>
					</tr>
					<tr>
						<td>반납 일시</td>
						<td><span id="eDay"></span><span id="eTime"></span></td>
					</tr>
					<tr>
						<td>옵션 선택</td>
						<td><span id="opt"></span></td>
					</tr>
					<tr>
						<td>예약 요금</td>
						<td><span id="fee"></span></td>
					</tr>
					<tr>
						<td>보 험 료</td>
						<td><span id="ins"></span></td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>
					<tr>
						<td>결제 총액</td>
						<td><span id="total"></span></td>
					</tr>
					<tr>
						<td>예상 유류비용</td>
						<td><span id="fuel"></span></td>
					</tr>
					
					
					<tr>
						<td colspan="2">
							<div class="container" style="width: 300px; height: 50px;">
								<ul class="pager" style="width: 300px; height: 50px;">
									<li class="previous"><a href="javascript:;" id="btn1_1" onclick="a1()" style="display:none" >이전</a></li>
									<li class="previous"><a href="javascript:;" id="btn1_2" onclick="a2()" style="display:none" >이전</a></li>
									<li class="previous"><a href="javascript:;" id="btn1_3" onclick="a3()" style="display:none" >이전</a></li>
									<li class="next"><a href="javascript:;" id="btn2_1" onclick="b1()">다음</a></li>
									<li class="next"><a href="javascript:;" id="btn2_2" onclick="b2()" style="display:none">다음</a></li>
									<li class="next"><a href="javascript:;" id="btn2_3" onclick="b3()" style="display:none">결제</a></li>
									<li class="next"><a href="javascript:;" id="btn2_4" onclick="b4()" style="display:none">완료</a></li>
								</ul>
							</div>
						</td>
					</tr>
					
				</table>
			</div><!-- /div2 -->
		</div><!-- /outerDiv -->
	</center>



	 <!-- 하단 footer -->
	<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2015 <a target="_blank" href="index.action" >Smart Choice Rent</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="index.action">Home</a></li>
                        <li><a href="#">About Us</a></li>
<!--                         <li><a href="#">Faq</a></li> -->
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    
    
</body>
</html>