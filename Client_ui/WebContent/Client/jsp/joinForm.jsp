<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="Client/css/bootstrap.min.css" rel="stylesheet">
<link href="Client/css/font-awesome.min.css" rel="stylesheet">
<link href="Client/css/animate.min.css" rel="stylesheet">
<link href="Client/css/prettyPhoto.css" rel="stylesheet">
<link href="Client/css/main.css" rel="stylesheet">
<link href="Client/css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="Client/image/favicon1.ico">

<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.prettyPhoto.js"></script>
<script src="../js/jquery.isotope.min.js"></script>
<script src="../js/main.js"></script>
<script src="../js/wow.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="Client/js/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script type="text/javascript" src="/lmxsrv/jquery-ui-1.10.4/development-bundle/ui/minified/i18n/jquery.ui.datepicker-ko.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
window.onload = function(){
	$( "#licenseDate" ).datepicker({
		dateFormat: 'yy-mm-dd',
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true, //년 뒤에 월 표시
		changeYear: true, //년도 변경 가능
		changeMonth: true, //월 변경 가능
		showOn: "button", //버튼 클릭시 달려 표시
		buttonImage: "Client/image/calendar.png", //달력 표시 버튼 이미지
		buttonImageOnly: true, //버튼을 클릭해야만 달력 표시
		onSelect: function(date) { //달력에서 날짜를 선택시 호출되는 메소드
			try{
		 	var dateArr = date.split("-"); //날짜 값에서 '-'을 제거
		  	$("#UYY").val(dateArr[0]); //년도
		  	$("#UMM").val(dateArr[1]); //월
		  	$("#UDD").val(dateArr[2]); //일
		 	}catch (e) {}
		}
	});

	//달력 UI를 한글로 변경
	$( "#licenseDate" ).datepicker( "option", $.datepicker.regional[ "ko" ] );
	};
	
	function postCode() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address1').focus();
            }
        }).open();
    }
	function formCheck() {
		var id = document.getElementById('id');
		var pw = document.getElementById('password');
		var pw1 = document.getElementById('password_chk');
		var name = document.getElementById('name');
		var license = document.getElementById('licenseDate');
		var zipcode = document.getElementById('zipcode');
		var phone = document.getElementById('phone');
		var email = document.getElementById('email');
		var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if (id.value.length<3 || id.value.length>12) {
			alert("아이디는 3-12자로 등록 가능합니다.");
			id.focus();
			id.select();
			return false;
		}if (pw.value.length<3 || pw.value.length>16) {
			alert("비밀번호는 3-15자로 입력하세요.");
			pw.focus();
			pw.select();
			return false;
		}if (pw.value != pw1.value) {
			alert("비밀번호가 일치하지 않습니다.");
			pw1.focus();
			pw1.select();
			return false;
		}if (name.value.length <= 0){
			alert("이름은 필수 항목입니다.");
			name.focus();
			name.select();
			return false;	
		}if (license.value.length <= 0){
			alert("면허 취득일은 필수 항목입니다.");
			license.focus();
			license.select();
			return false;
		}if (zipcode.value.length <= 0){
			alert('주소를 입력하세요.');
			zipcode.focus();
			zipcode.select();
			return false;
		}if (phone.value.length <= 0){
			alert("전화번호는 필수 항목입니다.");
			phone.focus();
			phone.select();
			return false;
		}if (email.value.length <= 0){
			alert('email은 필수 항목입니다.');
			email.focus();
			email.select();
			return false;
		}if (!filter.test(email.value)) {
			alert('잘못된 이메일 형식입니다.');
			email.focus();
			email.select();
			return false;
		}
		return true;
	}
	function idCheckOpen() {
		window.open("goIdCheckForm.action","ID중복확인","top=200,left=400,width=400,height=300,resizable=no");
	}
</script>


<title>회원가입 | SmartChoice Rent</title>
</head>
<body>
	<header id="header">
		<div class="top-bar">
		    <div class="container">
		        <div class="row" align="right">
		        	<ul class="social-share" >
						<s:if test="#session.loginName == null">
						<li><a id="top" href="<s:url value="/joinForm.action" />">JOIN</a>
						<li><a id="top" href="<s:url value="/loginForm.action" />">LOGIN</a>
						</s:if>
						<s:else>
						<li><h3>Welcome <s:property value="#session.loginName"/>님</h3></li>
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
<%--                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> --%>
                    <a href="index.action"><img src="Client/image/logo.png" alt="logo" width="50%"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.action">Home</a></li>
                        <li><a href="rentCar.action">차량예약</a></li>
                        <li><a href="bookingChk.action">예약확인</a></li>
                        <li><a href="carList.action">보유차량</a></li>
						<!-- <li><a href="notice.action">공지사항</a></li>
						<li><a href="faq.action">자주하는 질문</a></li> -->                
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
<!-- <h1>회원 가입</h1> -->
<center style="height: 800px;">
<fieldset>
<s:form id="joinForm" action="join"  method="post" onsubmit="return formCheck();" theme="simple">
<table>
<tr>
<td>아 이 디</td>
<td><s:textfield name="vo.id" id="id" readonly="readonly" maxlength="10" onclick="idCheckOpen()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="ID 중복확인" onclick="idCheckOpen()"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><s:password name="vo.password" id="password"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인<s:password name="password_chk" id="password_chk"/></td>
</tr>
<tr>
<td>이  름</td>
<td>
<s:textfield name="vo.name" id="name"/>
</td>
</tr>
<tr>
<td>면허 취득일</td>
<td><s:textfield name="vo.licenseDate" id="licenseDate" readonly="true"/></td>
</tr>
<tr>
<td>주  소</td>
<td>
<s:textfield name="vo.zipcode" id="zipcode" placeholder="우편번호" readonly="true"/>
<input type="button" onclick="postCode();" value="우편번호 찾기"><br>
<s:textfield name="vo.address" id="address" placeholder="주소" readonly="true"/>
<s:textfield name="vo.address1" id="address1" placeholder="상세주소"/>
</td>
</tr>
<tr>
<td>전화번호</td>
<td><s:textfield name="vo.phone" id="phone"/></td>
</tr>
<tr>
<td>E-mail</td>
<td><s:textfield name="vo.email" id="email"/></td>
</tr>
<tr><td colspan="2" align="right" ><s:submit value="가입하기"/></td></tr>
</table>
</s:form>
</fieldset>
</center>
	<footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2015 <a target="_blank" href="index.action" >Smart Choice Rent</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="index.action">Home</a></li>
                        <!-- <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>