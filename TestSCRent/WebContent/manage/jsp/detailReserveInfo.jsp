<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/detailReserveInfoStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>


</head>
<body>
	<input type="hidden" value="${selectRentNo}" id="currentRentNo">
	<div id="detailReserveTitle">예약번호 ${selectRentNo}</div>
	<div id="detailReserveWrap">
		<div class="infoItemTitle">
			<img src="/TestSCRent/manage/image/person.png">
			<div class="titleLeft">${detailReserveInfo.member_name} (${detailReserveInfo.member_id})</div>
			<div class="rightTitle">면허 취득일 ${detailReserveInfo.licensedate}</div>
		</div>
		<div class="infoItem">
			<table>
				<tr>
					<td width="90px">연체 횟수</td> 
					<td width="120px">${detailReserveInfo.overdue_count} / ${detailReserveInfo.totalrent_count}</td>
					<td width="90px">사고 횟수</td>
					<td width="120px">${detailReserveInfo.acc_count} / ${detailReserveInfo.totalrent_count}</td>
				</tr>
			</table>
		</div>
		<div class="infoItemTitle">
			<img src="/TestSCRent/manage/image/checklist.png">
			<div class="titleLeft">예약신청 내용</div>
			<div class="rightTitle">신청일자 ${detailReserveInfo.subdate}</div>
		</div>
		<div class="infoItem">
			<table>
				<tr>
					<td width="100px">대여 시작일</td> 
					<td>${detailReserveInfo.startday}</td>
					<td width="100px">반납 예정일</td>
					<td><label id="endday">${detailReserveInfo.endday}</label></td>
				</tr>
			</table>
		</div>
		<div class="infoItemTitle">
			<img src="/TestSCRent/manage/image/car111.png">
			<div class="titleLeft">${detailReserveInfo.carname} (${detailReserveInfo.fuel})</div>
			<div class="rightTitle">
				<span id="caridText">
				<s:if test="settingCarId != null">${detailReserveInfo.carid}</s:if>
				<s:else>
					(차량을 선택해 주세요)
					<button id="selectBtn" type="button" onclick="showCarInfoItem('<s:property value="detailReserveInfo.carname"/>'
						,'<s:property value="detailReserveInfo.fuel"/>');">자동</button>
					<button id="manualSelectBtn" type="button" onclick="showSelectableCarList('<s:property value="detailReserveInfo.carname"/>'
						,'<s:property value="detailReserveInfo.fuel"/>')">수동</button>
				</s:else>
				</span>
			</div>
		</div>
		<div class="infoItem">
			<div id="selectableCarList"></div>
		</div>
		<div class="infoItem">
			<table>
				<tr>
					<td width="90px">보험</td> 
					<td width="110px">${detailReserveInfo.insurance}</td>
					<td width="90px">옵션</td>
					<td width="110px">${detailReserveInfo.options}</td>
				</tr>
				<div id="carInfoItem"></div>
			</table>
		</div class="infoItem">
			<s:if test="currentPageNum == 1">
			<s:if test="selectedCarStatus != 1">
			<table>
				<tr>
					<td width="90px">반납일자</td> 
					<td><input type="text" placeholder="YYYYMMDD" id="returnDate"  size="11"></td>
					<td width="100px">차량 주행거리</td>
 					<td><input type="text" placeholder="숫자만 입력" id="mileage" size="11"></td>
				</tr>
			</table>
			</s:if>
			</s:if>
		<div >
		</div>
	</div>

</body>
</html>