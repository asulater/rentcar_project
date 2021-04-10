<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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

<script type="text/javascript">
function rentMain() {
	location.href = "rentCar.action";
}
function rent() {
	location.href = "bookingChk.action";
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약완료 | SmartChoice Rent</title>
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
						<li><a href="notice.action">공지사항</a></li>                   
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
<%-- 
<h1><a href = "<s:url value = "/index.action" />">SmartChoiceRent</a></h1>
 --%>
<center>
<fieldset style="margin: auto;">
<legend><h3>예약 완료</h3></legend>
<h1>예약이 완료되었습니다.</h1>
<p>차량 : <s:property value="rvo.carName"/> [<s:property value="rvo.fuel"/>] </p>
예약기간<br>
<p><s:property value="rvo.startDay"/> ~ <s:property value="rvo.endDay"/></p>
<p>예약 요금 : <s:property value="rvo.total"/></p>
<p>선택 옵션 : <s:property value="rvo.options"/></p>
<br>
<p>
승인처리 후 차량 배정되어 예약 확정됩니다.<br>
차량 예약정보 변동사항 발생시 연락 드립니다.
</p>
</fieldset>
<p style="">
<input type="button" id="bookingChk" value="예약 확인" onclick="rent()">
<input type="button" id="rentCar" value="처음으로" onclick="rentMain()">
</p>
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