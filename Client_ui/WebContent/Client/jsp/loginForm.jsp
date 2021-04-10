<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

    <link href="Client/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	    
    <link href="Client/css/animate.min.css" rel="stylesheet">
    <link href="Client/css/main.css" rel="stylesheet">

	<script src="Client/js/jquery-1.11.3.js"></script>



	<script>
		
		$(document).ready(function(){
			$('#login').on('click',login);
			$('#join').on('click',join);
		});
		
		
		function login() {
			var id = document.getElementById("id").value;
			var pw = document.getElementById("pw").value;
			if (id.length <= 0) {
				alert("아이디를 입력하세요");
				document.getElementById("id").focus;
				return false;
			}
			if (pw.length <= 0) {
				alert("비밀번호를 입력하세요");
				document.getElementById("pw").focus();
				return false;
			}
			$.ajax({
				url: 'login.action',
				type: 'post',
				data: {id: id, pw: pw},
				dataType: 'json',
				success: loginSuccess
			});
		}
		
		function loginSuccess(chk) {
			if (chk.loginChk == 0)
				location.href = "index.action";
			if (chk.loginChk == 1) 
			{
				alert("등록된 아이디가 없습니다.");
				document.getElementById("id").focus;
				return false;
			}
			if (chk.loginChk == 2)
			{
				alert("비밀번호가 일치하지 않습니다.");
				document.getElementById("pw").focus;
				return false;
			}
		}
		
		function loginError(s){
			alert("등록된 아이디가 없습니다.");
			focus();
			select();
		}
		
		function join() {
			location.href = "joinForm.action";
		}
	
	</script>
	
	<title>로그인 | SmartChoice Rent</title>
	
	<style type="text/css">
	
	#joinButtonWrap{width: 360px; height: 35px; border-bottom: 1px solid black; text-align: left;}
	
	#loginTableWrap {margin-top: 10px;}
	#loginTableWrap tr {height: 35px;}
	#loginTableWrap td:FIRST-CHILD {width: 80px;}
	#loginTableWrap td:nth-child(3){width: 90px; text-align: center;}
	#loginTableWrap input {height: 35px;}
	#loginTableWrap input[type="button"] {height: 60px;}
	
	</style>
	
</head>



<body>

	<!-- 상단 타이틀 -->
	<header id="header">
		<div class="top-bar" style="height: 70px; margin: 0;">
		    <div class="container">
		        <div class="row" align="right"  style="margin: 0;">
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
	
	
	
<!-- 	<div class="container"> -->
	<div style="height: 722px; padding-top: 200px;">
		<center>
			<div id=joinButtonWrap><a id="join">회원가입</a></div>
			<table id="loginTableWrap">
				<tr>
					<td>아이디</td>
					<td><input type="text" name = "id" id = "id" /></td>
					<td rowspan="2"><input type="button" id="login" value="로그인" ></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name = "pw" id = "pw" /></td>
				</tr>
			</table>
		</center>
	</div>
	
	
	
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