<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="shortcut icon" href="Client/image/favicon1.ico">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link href="Client/css/bootstrap.min.css" rel="stylesheet">
<link href="Client/css/animate.min.css" rel="stylesheet">
<link href="Client/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="Client/css/jquery-ui.css">

<script src="Client/js/jquery-1.11.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>
$(function() {
	$( "#tabs" ).tabs();
});
function fn1() {
	location.href = 'carList.action';
}
function fn2() {
	location.href = 'carList.action?carType=소형';
}
function fn3() {
	location.href = 'carList.action?carType=중형';
}
function fn4() {
	location.href = 'carList.action?carType=대형';
}
function fn5() {
	location.href = 'carList.action?carType=suv';
}
</script>
<title></title>
</head>
<body>
	<header id="header">
		<div class="top-bar" style="height: 70px; margin: 0;">
		     <div class="container" >
		        <div class="row" align="right" style="margin: 0;">
		        	<ul class="social-share" style="margin: 0;">
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="index.action"><img src="Client/image/logo.png" alt="logo" width="50%"></a>
                </div>
				
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.action">Home</a></li>
                        <li><a href="rentCar.action">차량예약</a></li>
                        <li><a href="bookingChk.action">예약확인</a></li>
                        <li class="active"><a href="carList.action">보유차량</a></li>
						<li><a href="notice.action">공지사항</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
	
	
<center>
<!--  overflow: auto; -->
<fieldset style="width: 1000px;">

<div id="tabs">
	<ul>
		<li><a href="javascript:;" onclick="fn1()">전체</a></li>
		<li><a href="javascript:;" onclick="fn2()">소형</a></li>
		<li><a href="javascript:;" onclick="fn3()">중형</a></li>
		<li><a href="javascript:;" onclick="fn4()">대형</a></li>
		<li><a href="javascript:;" onclick="fn5()">SUV</a></li>
	</ul>
	<div style="width: 1000px;" align="center">
		<div id="tabs1" style="width: 920px; ">
			<s:iterator value="car" status="status">
				
				<div style="float: left; width: 220px;height: 240px;">
					<table>
					<tr style="width:220px;">
						<td colspan="2" >
						<img id="" src="carImage.action?picture=<s:property value='picture'/>" width="152px" height="110px"/>
						</td>
					</tr>
					<tr>
						<td height="20px">
							차량명
						</td>
						<td>
						<s:property value="carName"/> <s:property value="fuel"/>
						</td>
					</tr>
					<tr>
						<td height="20px">
							제조사
						</td>
						<td>
						<s:property value="company"/>
						</td>
					</tr>
					
					<tr>
						<td height="20px">
							배기량
						</td>
						<td>
						<s:property value="capacity"/>
						</td>
					</tr>
					
					<tr>
						<td height="20px">
							연료
						</td>
						<td>
						<s:property value="fuel"/>
						</td>
					</tr>
					
					<tr>
						<td height="20px">
							승차인원
						</td>
						<td>
						<s:property value="persons"/>
						</td>
					</tr>
					</table>
				</div>


			</s:iterator>
		</div>
	</div>
</div>

</fieldset>
</center>
	<footer id="footer" class="midnight-blue" >
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
    </footer><!--/#footer-->
</body>
</html>