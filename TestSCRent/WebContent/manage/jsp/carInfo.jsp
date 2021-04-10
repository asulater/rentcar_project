<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차량정보조회</title>

<link href="/TestSCRent/manage/bootstrap-3.3.5/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">
<link rel="stylesheet" href="/TestSCRent/manage/css/scheduleCalendarStyle.css" type="text/css">


<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/calendar.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>



</head>
<body>

	<%@ include file="/manage/menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">차량정보조회</h3>
	<div class="table-responsive">
            <table id="carInfoTable">
              <thead id="carInfoTitle">
                <tr>
                  <th></th>
                  <th class="carInfoTitleLine">차량명(차량번호)</th>
                  <th class="carInfoTitleLine">상태</th>
                  <th class="carInfoTitleLine">상세차량정보</th>
                  <th class="carInfoTitleLine">차량사고내역</th>
                  <th class="carInfoTitleLine">차량예약일정</th>
                </tr>
              </thead>
              <tbody>
               <!-- 반복 시작 -->
				<s:iterator value="carList" status="status">
				
				<tr id="carItem" >
					<td><s:property value="#status.index + 1"/></td>
					<td><s:property value="carname" />(<s:property value="carid" />)</td>
					<s:if test="status == 0">
						<td>사용 가능</td>
					</s:if>
					<s:elseif test="status == 1">
						<td>예약 중</td>
					</s:elseif>
					<s:elseif test="status == 2">
						<td>사용 중</td>
					</s:elseif>
					<s:elseif test="status == 3">
						<td>정비 중</td>
					</s:elseif>
					<s:elseif test="status == 4">
						<td>폐차</td>
					</s:elseif>
					<s:elseif test="status == 5">
						<td>구입 요청 중</td>
					</s:elseif>
					<s:elseif test="status == 6">
						<td>재정비 요청 중</td>
					</s:elseif>
					<s:elseif test="status == 7">
						<td>폐차 요청 중</td>
					</s:elseif>
					<s:elseif test="status == 8">
						<td>블럭 해지 요청 중</td>
						<!-- 정비 완료 이후 사용 승인요청  -->
					</s:elseif>
					<td>
						<button type="button" id="detailBtn" onclick="location.href='showDetailInfo.action?selectCarId=<s:property value="carid" />'">
							상세보기
						</button>
					</td>
					<td>
						<button type="button" id="accBtn" onclick="location.href='showAccList.action?selectCarId=<s:property value="carid" />'">
							사고내역
						</button>
					</td>
					<td><input type="image" id="calendarBtn" src="/TestSCRent/manage/image/calendar.png" onclick="showScheduleWindow('<s:property value="carid" />');"/>
					</td>
				</tr>
				
				</s:iterator>        
				<!-- 반복 끝 -->
              </tbody>
            </table>
          </div>
	
		<div class="scheduleWindow">
		<div class="closeScheduleWin" onclick="closeSchedule();">X</div>
		<div class="calendarContainer">
		<table class="cal">
			<caption>
				<span class="prev" onclick="javascript:showPrevCalendar();">&larr;</span> 
				<span class="next" onclick="javascript:showNextCalendar();">&rarr;</span>
				<span id="monthYearTitle"></span>
			</caption>
			<thead>
				<tr>
					<th>Mon</th>
					<th>Tue</th>
					<th>Wed</th>
					<th>Thu</th>
					<th>Fri</th>
					<th>Sat</th>
					<th>Sun</th>
				</tr>
			</thead>
			<tbody id="printDate">
				
			</tbody>
		</table>
		</div>
	</div>
	
	
	</div>


</body>
</html>