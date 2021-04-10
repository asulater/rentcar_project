<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>차량정보조회</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">
<link rel="stylesheet" href="/TestSCRent/manage/css/pagingStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/reserveFunc.js"></script>

</head>
<body>
<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">
    	<s:if test="reserveInfoPageNum == 0">예약신청목록</s:if>
	 	<s:else>대여현황 및 반납 예정 목록</s:else>
    </h3>
    <input type="hidden" id="currentPageNum" value="${reserveInfoPageNum}" >

	 	<div id="reserveListView">
	 	
			<table id="reserveListTable">
				
				<tr id="reserveListTitle">
					<td>예약상태</td>
					<td>신청일자</td>
					<td>신청자(아이디)</td>
					<td>대여 시작일</td>
					<td>반납 예정일</td>
					<td>차량명(사용연료)</td>
					<td>총 요금(원)</td>
					<td>상세보기</td>
				</tr>
			
			
				<!-- 반복 시작 -->
				<s:iterator value="reserveListDefault" status="status">
				
				<tr class="reserveItem" >
					<s:if test="reserveInfoPageNum == 0">
						<s:if test="limit == 0"><td>승인대기</td></s:if>
						<s:if test="limit == 1"><td style="color: #428bca;">배정가능</td></s:if>
					</s:if>
					<s:if test="reserveInfoPageNum == 1">
						<s:if test="carstatus == 1"><td>배차완료</td></s:if>
						<s:if test="carstatus == 2"><td style="color: #428bca;">사용 중</td></s:if>
					</s:if>
				
					<td><s:property value="subdate" /></td>
					<td><s:property value="member_name" />(<s:property value="member_id" />)</td>
					<td><s:property value="startday" /></td>
					<td><s:property value="endday" /></td>
					<td><s:property value="carname" />(<s:property value="fuel" />)</td>
					<td><s:property value="total" /></td>
					<td>
						<button type="button" id="detailBtn" 
							onclick="showDetailReserveInfoWindow('<s:property value="rentno" />', '<s:property value="member_id" />'
							, <s:property value="limit" />, <s:property value="carstatus" />);">
							상세보기
						</button>
					</td>
				</tr>
				
				</s:iterator>        
				<!-- 반복 끝 -->
			</table>
		</div>
		
		
		<div id="pageWrap">	
		<div class="paging_comm">
			<s:property value="pagingHtml" escape="false" />
		</div>
		</div>
		
		
		<!-- popup 화면 -->
		<div id="layer1" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">

					<div class="popupWindow"></div>
					<p class="ctxt mb20"></p>
					
			
					<div class="btn-r">
						<!-- 페이지별로 팝업창의 버튼 다르게 띄우기 -->
						<s:if test="reserveInfoPageNum == 0"> 
							<div class="cbtn" id="approvalBtn" onclick="clickAppBtn()">승인</div>
							<div class="cbtn" id="disapprovalBtn" onclick="clickDisappBtn()">불승인</div>
						</s:if>
						
						<s:elseif test="reserveInfoPageNum == 1">
							<div class="cbtn" id="returnBtn" onclick="clickReturnBtn()">반납확인</div>
						</s:elseif>
						
						<div class="cbtn">Close</div>
					</div>
					
					<!--// content-->
					
					</div>
			
				</div>
			</div>
		

</div>


</body>
</html>