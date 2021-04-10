<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="Client/js/jquery-1.11.3.js"></script>
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

<style type="text/css">
.faq{border-bottom:1px solid #ddd;margin:1em 0}
.faq .faqHeader{position:relative;zoom:1}
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer}
.faq .faqBody{margin:0;padding:0}
.faq .faqBody .article{list-style:none}
.faq .q{margin:0;border-top:1px solid #ddd}
.faq .q a{display:block;padding:.5em 1em;text-align:left;font-weight:bold;background:#fafafa;color:#000;text-decoration:none !important}
.faq .q a:hover, .faq .q a:active, .faq .q a:focus{background:#f8f8f8}
.faq .a{margin:0;padding:1em;line-height:1.5}
</style>

<script>
jQuery(function($)
{
	var article = $('.faq>.faqBody>.article');
	article.addClass('hide');
	article.find('.a').hide();
	article.eq(0).removeClass('hide');
	article.eq(0).find('.a').show();
	
	$('.faq>.faqBody>.article>.q>a').click(function()
	{
		var myArticle = $(this).parents('.article:first');
		if(myArticle.hasClass('hide'))
		{
			article.addClass('hide').removeClass('show');
			article.find('.a').slideUp(100);
			myArticle.removeClass('hide').addClass('show');
			myArticle.find('.a').slideDown(100);
		} 
		else 
		{
			myArticle.removeClass('show').addClass('hide');
			myArticle.find('.a').slideUp(100);
		}
		return false;
	});
	
	$('.faq>.faqHeader>.showAll').click(function()
	{
		var hidden = $('.faq>.faqBody>.article.hide').length;
		
		if(hidden > 0)
		{
			article.removeClass('hide').addClass('show');
			article.find('.a').slideDown(100);
		} 
		else 
		{
			article.removeClass('show').addClass('hide');
			article.find('.a').slideUp(100);
		}
	});
});
</script>
<title>예약이력 | SmartChoiceRent</title>
</head>
<body>
<%-- <h1><a href = "<s:url value = '/index.action'/>">SmartChoiceRent</a></h1> --%>
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
						<!-- <li><a href="notice.action">공지사항</a></li>
						<li><a href="faq.action">자주하는 질문</a></li> -->
					</ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
<center>
<fieldset style="height: 800px;">
<legend>예약 이력 조회</legend>
<div id="list" style="height: 800px;">
<div class="faq">
	<div class="faqHeader">
	</div>
	<ul class="faqBody">
	<s:iterator value="list">
		<li class="article" id="a<s:property value="rentNo"/>">
			<p class="q">
			<a href="#a<s:property value="rentNo"/>"><s:property value='subDate'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="carName"/>[<s:property value="fuel"/>]</a>
			</p>
			<table class="a">
				<tr>
					<td>
					<p align="left">
					<img src="Client/image/c.png" width="18" height="18">예약신청 내용
					</p>
					</td>
				</tr>
				<tr>
					<td>
					&nbsp;&nbsp;&nbsp;<p><s:property value="startDay"/> ~ <s:property value="endDay"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:property value="total"/>
					</p> 
					</td>
				</tr>
				<tr>
					<td>
					<img src="Client/image/cd.png" width="18" height="18">
					<s:property value="carName"/>[<s:property value="fuel"/>]
					<s:if test="insurance == 1">
					<p align="right">보험 가입 </p>
					</s:if>
					<s:elseif test="insurance == 0">
					<p align="right"></p>
					</s:elseif>
					<hr>
					</td>
				</tr>
			</table>
		</li>
	</s:iterator>
	</ul>
</div>
</div>
<%-- <table>
<tr>
<th>예약일</th>
<th>차종</th>
<td></td>
<td></td>
</tr>
<s:iterator value="list">
<tr>
<td><s:property value='subDate'/></td>
<td><s:property value="carName"/>[<s:property value="fuel"/>]</td>
<td>
<a href="" id="i<s:property value="rentNo"/>" onclick="details(<s:property value="rentNo"/>)">예약 정보</a>
<a href="" id="c<s:property value="rentNo"/>" onclick="close(<s:property value="rentNo"/>)" style="display: none;">닫기</a>
</td>
<td><a href="#" onclick="cancel()">예약 취소</a></td>
</tr>
<tr><td colspan="4">
<div id="<s:property value="rentNo"/>" style="display: none;">
<table>
<tr>
<td>
<p align="left">
<img src="../Client/image/c.png" width="18" height="18">예약신청 내용
</p>
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;<p><s:property value="startDay"/> ~ <s:property value="endDay"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<s:property value="total"/>
</p> 
</td>
</tr>
<tr>
<td>
<img src="../Client/image/cd.png" width="18" height="18">
<s:property value="carName"/>[<s:property value="fuel"/>]
<s:if test="insurance == 1">
<p align="right">보험 가입 </p>
</s:if>
<s:elseif test="insurance == 0">
<p align="right"></p>
</s:elseif>
<hr>
</td>
</tr>
</table>
</div>
</td></tr>
</s:iterator>
</table> --%>
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
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>