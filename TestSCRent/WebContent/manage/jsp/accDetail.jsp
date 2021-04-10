<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function formCheck() {

		var testdrive = $(':input[name=testdrive]:radio:checked').val();
		if (testdrive == null) {
			alert('시운전을 하셔야 결재요청이 가능합니다');
			return false;
		} else {
			return true;
		}
	}

	/* 
	var carid = $('#carid').val();
		alert(carid);
		var comments = $('#comments').val();
		if (testdrive == "testdrive") {
	
	var st = $(':input[name=check]:radio:checked').val();
	$.ajax({
		url : 'decision.action',
		type : 'post',
		dataType : 'text',
		data : {
			statusTMP : st,
			carid : carid,
			comments : comments
			}, 
		success : insertOK
	}); 

	function insertOK(){
		alert('성공');
	}
	function insertOK() {
		alert("저장완료");
	}
	
	
	 */
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

#carDetail {
 margin-left: 5px;
}
#carDetail tr {height: 30px;}
#carDetail tr:first-child {border-top: 2px solid #369;}
#carDetail tr:nth-child(6) {height:80px; padding-bottom: 10px; border-bottom: 2px solid #369;}
#carDetail tr td:first-child  {text-align: LEFT; padding-left: 15px;}
#carDetail tr td:nth-child(2) {width:200px;  text-align: center;}

</style>
</head>
<body>

	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">사고차량 상세정보</h3>
    
			<s:form action="decision" theme="simple"
				onsubmit="return formCheck();" enctype="multipart/form-data">
				<input type="hidden" name="carid"
					id="<s:property value='carid' />"
					value="<s:property value='carid' />" />
				<input type="hidden" name="requestid" id="sessionid"
					value="${sessionScope.mLoginId}" />
				<input type="hidden" name="accidentno"
					id="<s:property value='accidentno' />"
					value="<s:property value='accidentno' />" />
					
				<table id="carDetail">
					<tr>
						<td>시운전 여부</td>
						<td><input type="radio" id="testdrive" name="testdrive"
							value="testdrive"></td>
					</tr>
					<tr>
						<td>재점검 요청</td>
						<td><input type="radio" name="category" id="reinspect"
							value="reinspect"></td>
					</tr>
					<tr>
						<td>폐차 여부</td>
						<td><input type="radio" name="category" id="deleteCar"
							value="deleteCar"></td>
					</tr>
					<tr>
						<td>블록 해지요청</td>
						<td><input type="radio" name="category" id="block"
							value="block"></td>
					</tr>
					<tr>
						<td>코멘트</td>
						<td><s:property value="comments" /></td>
					</tr>
					<tr>
						<td><s:textarea name="appcomment" id="appcomment"
								rows="3" cols="50" /></td>
						<td align="center"><s:submit value="결재요청"></s:submit></td>
					</tr>
				</table>
			</s:form>
		</div>


</body>
</html>