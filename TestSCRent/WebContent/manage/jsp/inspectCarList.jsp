<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>

</head>



<body>
	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">정기점검 필요 차량목록</h3>
    
    	<div id="">
            <table id="reserveListTable">
              <thead>
                <tr id="reserveListTitle">
                  <th>차량번호</th>
                  <th>차량명(사용연료)</th>
                  <th>차량상태</th>
                  <th>점검필요 주기</th>
                  <th>실제 주행거리</th>
                  <th>점검사항</th>
                  <th>확인</th>
                </tr>
              </thead>
              <tbody>
               <!-- 반복 시작 -->
				<s:iterator value="inspectList" status="status">
				
				<tr class="reserveItem" >
					<td><s:property value="carid"/></td>
					<td><s:property value="carname" />(<s:property value="fuel" />)</td>
					
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
						<!-- 	<td>구입 요청 중</td> -->
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
					
					<td><s:property value="period"/></td>
					<td><s:property value="mileage" /></td>
					<td><s:property value="itemname"/></td>
					<td><button type="button" onclick="inspectCarCheck('<s:property value="carid"/>')">점검확인</button>
					</td>
				</tr>
				
				</s:iterator>        
				<!-- 반복 끝 -->
              </tbody>
            </table>
          </div>
    
    </div>
</body>
</html>