<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
/* body{margin:40px;} */

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
   
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 18px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    left: 0;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
    /* Width = 100% / number-of-steps */
    width: 20%;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>

<title>Rent2</title>
</head>
<body>
<h4>차량 선택</h4>
<div class="stepwizard">
    <div class="stepwizard-row"></div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">1</button>
			<p>대여 기간</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-primary btn-circle">2</button>
			<p>차량 선택</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">3</button>
			<p>여정 선택</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">4</button>
			<p>결       제</p>
		</div>
</div>
<table style="overflow: auto; height: 150px;">
<tr>
<th width="100px" align="center">제조사</th>
<th width="100px" align="center">차량명</th>
<th width="100px" align="center">연료 타입</th>
<th width="100px" align="center">예약 가능대수</th>
<th width="100px" align="center">이용요금(일)</th>
</tr>
<s:iterator value="carList">
<tr>
<td align="center"><s:property value="company"/></td>
<td align="center"><s:property value="carName"/></td>
<td align="center"><s:property value="fuel"/></td>
<td align="center"><a href="javascript:carSelect('<s:property value="carName"/>-<s:property value="fuel"/>-<s:property value="price"/>')"><s:property value="count"/></a></td>
<td align="right"><s:property value="fee"/>원</td>
</tr>
</s:iterator>
</table>
</body>
</html>