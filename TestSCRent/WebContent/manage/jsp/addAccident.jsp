<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">
<script type="text/javascript"
	src="/TestSCRent/manage/js/carInfoFunc.js"></script>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>

<script>
	function formCheck() {
		var accidentdate = document.getElementById('accidentdate');
		if (accidentdate.value.length != 8) {
			alert('날짜는 숫자 8자리로 입력하세요. 예)19910131');
			return false;
		} else {
			return true;
		}

	}
</script>

<head>
</head>
<body>
	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">사고차량 등록</h3>

		<s:form action="insertAccident" theme="simple"
			enctype="multipart/form-data" onsubmit="return formCheck();">
			<table id="buyCar" style="border-top: 3px solid #369;">
				<tr class="carItem">
					<td>사고차량ID</td>
					<td><s:textfield name="carid" id="carid" size="44" /></td>
				</tr>
				<tr class="carItem">
					<td>사고유저ID</td>
					<td><s:textfield name="userid" id="userid" size="44" /></td>
				</tr>
				<tr class="carItem">
					<td>사고날짜</td>
					<td><s:textfield name="accidentdate" id="accidentdate" size="44" /></td>
				</tr>
				<tr class="carItem">
					<td>서류ID</td>
					<td><s:textfield name="documentno" id="documentno" size="44" /></td>
				</tr>
				<tr class="carItem">
					<td>코멘트</td>
					<td><s:textfield name="comments" id="comments" size="44" /></td>
				</tr>
				<tr style=" height: 100px;  padding-top: 50px;">
					<td colspan="2" align="center"><s:submit value="등록하기"></s:submit></td>
				</tr>
			</table>
		</s:form>

	</div>


</body>
</html>