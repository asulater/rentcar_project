<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/reserveFunc.js"></script>

</head>
<body>
<%@ include file="/manage/menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">취소목록 조회</h3>

            <table id="cancelListTable">
              <thead>
                <tr id="cancelListTitle">
                  <td>차량번호</td>
                  <td>차량명(사용연료)</td>
                  <td>대여시작일</td>
                  <td>반납예정일</td>
                  <td>신청자(아이디)</td>
                  <td>신청일자</td>
                  <td>요금</td>
                  <td>확인</td>
                </tr>
              </thead>
              <tbody>
               <!-- 반복 시작 -->
				<s:iterator value="reserveListDefault" status="status">
				
				<tr class="reserveItem" >
					<td><s:property value="carid"/></td>
					<td><s:property value="carname" />(<s:property value="fuel" />)</td>
					<td><s:property value="startday"/></td>
					<td><s:property value="endday"/></td>
					<td><s:property value="member_name" />(<s:property value="member_id" />)</td>
					<td><s:property value="subdate"/></td>
					<td><s:property value="total"/></td>
					<td><button type="button" id="cancelReserveBtn" onclick="cancelReserve('<s:property value="rentno"/>')">취소확인</button>
					</td>
				</tr>
				
				</s:iterator>        
				<!-- 반복 끝 -->
              </tbody>
            </table>
          </div>

</body>
</html>