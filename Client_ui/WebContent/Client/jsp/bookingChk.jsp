<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>예약확인 | SmartChoice Rent</title>
<link rel="shortcut icon" href="../Client/image/favicon1.ico">

<link href="Client/css/client-thema.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<link href="Client/css/animate.min.css" rel="stylesheet">
<link href="Client/css/main.css" rel="stylesheet">
<link rel="stylesheet" href="Client/css/faq.css" />

<script src="Client/js/jquery-1.11.3.js"></script>


<script>
$(document).ready(function()
{
	var article = $('.faq>.faqBody>.article22');
	article.addClass('hide');
	article.find('.a22').hide();
	article.eq(0).removeClass('hide');
	article.eq(0).find('.a22').show();
	
	$('.faq>.faqBody>.article22>.q22>a').click(function()
	{
		var myArticle = $(this).parents('.article22:first');
		if(myArticle.hasClass('hide'))
		{
			article.addClass('hide').removeClass('show');
			article.find('.a22').slideUp(100);
			myArticle.removeClass('hide').addClass('show');
			myArticle.find('.a22').slideDown(100);
		} 
		else 
		{
			myArticle.removeClass('show').addClass('hide');
			myArticle.find('.a22').slideUp(100);
		}
		return false;
	});
	
	$('.faq>.faqHeader>.showAll').click(function()
	{
		var hidden = $('.faq>.faqBody>.article22.hide').length;
		
		if(hidden > 0)
		{
			article.removeClass('hide').addClass('show');
			article.find('.a22').slideDown(100);
		} 
		else 
		{
			article.removeClass('show').addClass('hide');
			article.find('.a22').slideUp(100);
		}
	});
});


function cancel(rno) {
	if (confirm("예약번호 "+rno+"의 예약을 취소하시겠습니까?") == false) 
	{
		return false;
	}
	else
	{	
		$.ajax({
			url: 'bookingCancel.action',
			data: {rentNo: rno},
			dataType: 'json',
			success: cancelOK
		});
	}
}
function cancelOK() {
	alert("취소완료");
	location.href = 'bookingChk.action';
}
</script>

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
                        <li class="active"><a href="bookingChk.action">예약확인</a></li>
                        <li><a href="carList.action">보유차량</a></li>
						<li><a href="notice.action">공지사항</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
	</header><!--/header-->
	

<center style="height: 722px;">
<div class="faq" style="width: 850px;">
	<div class="faqHeader"></div>
	<ul class="faqBody">
	<s:iterator value="list">
		<li class="article22" id="a<s:property value="rentNo"/>">
			<p class="q22">
			<a href="#a<s:property value="rentNo"/>"><s:property value='subDate'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="carName"/>[<s:property value="fuel"/>]</a>
			</p>
			
			<table class="a22">
			<tr>
			<td>
			<p align="left">
			<img src="Client/image/c.png" width="18" height="18">예약신청 내용
			<input type="button" onclick="cancel(<s:property value="rentNo"/>)" value="예약 취소" align="right">
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
			</td>
			</tr>
			</table>
		</li>
	</s:iterator>
	</ul>
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