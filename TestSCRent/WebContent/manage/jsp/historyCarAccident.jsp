<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차량사고이력</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>

</head>



<body>

	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">
		<img src="/TestSCRent/manage/image/back_btn2.png" width="20px" height="20px" onclick="location.href='showCarList'">
		차량사고이력
	</h3>
		<div id="accWrap">
		<div id="carImageBox">
			<div id="carImage">
				<img src="viewCarImage.action?selectCarId=<s:property value='selectCarId'/>" />
			</div>
			</div>
			<div id="infoWrap">
			<table class="defaultcarInfo">
				<tr>
					<td>차량명</td>
					<td style="width: 140px;">${car.carname}</td>
				</tr>
				<tr>
					<td>차량번호</td>
					<td>${car.carid}</td>
				</tr>
				<tr>
					<td>차량상태</td>
					<s:if test="car.status == 0">
						<td>사용 가능</td>
					</s:if>
					<s:elseif test="car.status == 1">
						<td>예약 중</td>
					</s:elseif>
					<s:elseif test="car.status == 2">
						<td>사용 중</td>
					</s:elseif>
					<s:elseif test="car.status == 3">
						<td>정비 중</td>
					</s:elseif>
					<s:elseif test="car.status == 4">
						<td>폐차</td>
					</s:elseif>
					<s:elseif test="car.status == 5">
						<!-- 						<td>구입 요청 중</td> -->
					</s:elseif>
					<s:elseif test="car.status == 6">
						<td>재정비 요청 중</td>
					</s:elseif>
					<s:elseif test="car.status == 7">
						<td>폐차 요청 중</td>
					</s:elseif>
					<s:elseif test="car.status == 8">
						<td>블럭 해지 요청 중</td>
						<!-- 정비 완료 이후 사용 승인요청  -->
					</s:elseif>
				</tr>
				<tr>
					<td>차종</td>
					<td>${car.cartype}</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>${car.company}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${car.price}</td>
				</tr>
			</table>
			</div>
		
		
		<div id="accListWrap">
			<table id="accListTable">
				<tr id="accListTitle">
					<td>사고일자</td>
					<td>사용자</td>
					<td>사용자 연락처</td>
					<td>관련 문서</td>
					<td>담당자</td>
					<td>설명</td>					
				</tr>
				
				<!-- 반복 시작 -->
				<s:iterator value="accList" status="status">
				
				<tr>
					<td><s:property value="accidentdate" /></td>
					<td><s:property value="username" />(<s:property value="userid" />)</td>
					<td><s:property value="userphone" /></td>
					<td><s:property value="documentid" /></td>
					<td><s:property value="managername" />(<s:property value="managerid" />)</td>
					<td><s:property value="comments" /></td>
				</tr>
				
				</s:iterator>        
				<!-- 반복 끝 -->
			</table>
		</div>
		</div>
		
	
	</div>


</body>
</html>