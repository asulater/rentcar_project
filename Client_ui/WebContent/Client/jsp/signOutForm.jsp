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

<script src="Client/js/jquery.js"></script>
<script src="Client/js/bootstrap.min.js"></script>
<script src="Client/js/jquery.prettyPhoto.js"></script>
<script src="Client/js/jquery.isotope.min.js"></script>
<script src="Client/js/main.js"></script>
<script src="Client/js/wow.min.js"></script>

<script src="Client/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#yes').on('click',pwCheck);
	$('#no').on('click',no);
});
function pwCheck() {
	var pw = document.getElementById("pw").value;
	if (pw.length <= 0) {
		alert("비밀번호를 입력하세요");
		document.getElementById("pw").focus();
		return false;
	}
	$.ajax({
		url: 'pwCheck.action',
		type: 'post',
		data: {pw: pw},
		dataType: 'json',
		success: signOut
	});
}
function signOut(chk) {
	//pw 일치할때
	if (chk.loginChk == 0) {
		if (confirm("탈퇴 하시겠습니까?") == false) {
			no();
		}
		else
		location.href = "signOut.action";
	}
	//pw 다를때
	if (chk.loginChk == 1)
	{
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("pw").focus();
		document.getElementById("pw").select();
		return false;
	}
}
function no() {
	alert("감사합니다.");
	location.href = "myPage.action";
}
</script>
<title>회원 탈퇴 | SmartChoice Rent</title>
</head>
<body>
	<header id="header">
		<div class="top-bar">
		    <div class="container">
		        <div class="row" align="right">
		        	<ul class="social-share" >
						<s:if test="#session.loginName == null">
						<li><a id="top" href="<s:url value="/joinForm.action" />">JOIN</a>
						<li class="active"><a id="top" href="<s:url value="/loginForm.action" />">LOGIN</a>
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

<!-- <h1>회원 탈퇴</h1> -->
<center>
<div style="height: 800px;">
<fieldset>
<table>
	<tr>
		<td>아 이 디</td>
		<td><s:property value="#session.loginId"/></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" id="pw"></td>
	</tr>
	<tr>
		<td rowspan="2" align="center"><input type="button" id="yes" value="확인"></td>
		<td rowspan="2" align="center"><input type="button" id="no" value="취소"></td>
	</tr>
</table>
</fieldset>
</div>
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