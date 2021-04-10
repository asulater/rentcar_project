<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/loginFunc.js"></script>


</head>
<body>
	<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header">사원등록</h3>
		
		<div id="joinWrap">
		<form action="addManager.action" method="post"
			onsubmit="return joinValueChk();" id="joinManagerForm">

			<table id="joinTable">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="manager.id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="manager.password" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="manager.name" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="manager.phone" placeholder=" 하이픈(-) 제외하고 입력" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="manager.email" /></td>
				</tr>
			</table>

			<div class="buttonWrap">
				<button type="submit">가입하기</button>
				<button type="reset">초기화</button>
			</div>

		</form>
		</div>
	</div>


</body>
</html>