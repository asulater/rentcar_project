<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
<style type="text/css">
    
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<title>예상 유류비 비교 | SmartChoice Rent</title>
</head>
<body>
<center>
<fieldset style="width: 680px; height: 460px;">
	<div align="left"><s:property value="carName"/></div>
	<s:iterator value="car">
	<table style="margin: 0;padding: 0;float: left; width: 220px;height: 130px;">
		<tr>
			<td colspan="2" >
			<img id="" src="carImage.action?picture=<s:property value='picture'/>" width="152px" height="110px"/>
			</td>
		</tr>
		<tr>
			<td>
				연료
			</td>
			<td>
				<s:property value="fuel"/>
			</td>
		</tr>
		<tr>
			<td>
				예상 유류비용
			</td>
			<td>
				<s:property value="km"/>원<!-- 유류비용 -->
			</td>
		</tr>
	</table>
	</s:iterator>
</fieldset>
</center>
</body>
</html>