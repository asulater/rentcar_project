<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="./bootstrap-3.3.5/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="./css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/loginFunc.js"></script>

</head>

 <body>
	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">로그인</h3>
		
		<div id="loginWrap">
	        <form action="login.action" onsubmit="return loginValueChk();" class="loginForm" method="post">
				<a href="goJoinForm.action" >회원가입</a> <br>
				<input type="text" id="id" name="id" placeholder="아이디" /> <br>
				<input type="password" name="password" id="password" placeholder="비밀번호" /> <br>
				<button type="submit" id="loginBtn" class="loginBtn" >로그인</button>
			</form>
		</div>
          
    </div>

    
  </body>

</html>