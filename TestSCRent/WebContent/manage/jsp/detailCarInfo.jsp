<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세차량정보 조회</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>


</head>
<body>
	<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header">
		<img src="/TestSCRent/manage/image/back_btn2.png" width="20px" height="20px" onclick="location.href='showCarList'">
		상세차량정보
		</h3>
		<div class="carInfoWrap">
		<div class="carInfo">
			<div id="carImageBox">
			<div id="carImage">
				<img src="viewCarImage.action?selectCarId=<s:property value='selectCarId'/>" />
			</div>
			</div>
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
						<td style="color: #36bb74;">사용 가능</td>
					</s:if>
					<s:elseif test="car.status == 1">
						<td style="color: #e5d33e;">예약 중</td>
					</s:elseif>
					<s:elseif test="car.status == 2">
						<td style="color: #c73232;">사용 중</td>
					</s:elseif>
					<s:elseif test="car.status == 3">
						<td style="color: #da8929;">정비 중</td>
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

			<div id="carPerformance">사양 정보</div>
			<table class="performanceCarInfo">
				<tr>
					<td>연비</td>
					<td>사용연료</td>
					<td>최대출력</td>
					<td>배기량</td>
					<td>승차인원</td>
				</tr>
				<tr>
					<td>${car.km}</td>
					<td>${car.fuel}</td>
					<td>${car.maxoutput}</td>
					<td>${car.capacity}</td>
					<td>${car.persons}</td>
				</tr>
			</table>

		</div>
	</div>
	</div>

</body>
</html>