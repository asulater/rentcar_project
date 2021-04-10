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

<title>공지사항 | SmartChoice Rent</title>
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
                        <li><a href="carList.action">보유차량</a></li>
						<li  class="active"><a href="notice.action">공지사항</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
	
<center>
<fieldset style="height: 800px; width: 500px;">
<legend>공 지 사 항</legend>
<table border="0" cellspacing="0" cellpadding="2">
	
	<tr>
		<td width="50">번호</td>
		<td>제목</td>
		<td width="80">날짜</td>
		<td width="50">조회</td>		
	</tr>
	
	<s:iterator value="list" status="stat">
		
		<s:url id="viewURL" action="viewAction">
			<s:param name="seqarg">
				<s:property value="seq" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr> 
			<td>1<s:property value="seq" /></td>
			<td>공지사항1
				<s:a href="%{viewURL}">
					<s:property value="title" />
				</s:a>
			</td>
			<td>2015-10-26<s:property value="regdate" /> </td>
			<td>100<s:property value="hit" /> </td>
		</tr>
			
	</s:iterator>
	
	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="4" align="center">없어</td>
		</tr>
	</s:if>
	
	<tr align="center">
		<td colspan="4">
			<s:property value="pagingHtml" escape="false" />
		</td>
	</tr>
</table>



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