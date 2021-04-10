<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 목록</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/manageFunc.js"></script>	

</head>


<body>
<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h3 class="page-header">사원관리</h3>
 	<div id="managersListView">

 		
 		<div id="searchCondition">
 			<button type="button" onclick="location.href='searchManagersList.action'">전체보기</button>
 			<button type="button" onclick="location.href='searchManagersList.action?condition=기존'">기존사원</button>
 			<button type="button" onclick="location.href='searchManagersList.action?condition=신입'">신입사원</button>
 		</div>
 	
		<table id="managersListTable">
			
			<tr id="managersListTitle">
				<td>사원 아이디</td>
				<td>사원명</td>
				<td>직급</td>
				<td>상세</td>
			</tr>
		
		
			<!-- 반복 시작 -->
			<s:iterator value="managersList" status="status">
			
			<tr class="managerItem" >
				<td><s:property value="id" /></td>
				<td><s:property value="name" /><s:property value="member_id" /></td>
				<td><s:property value="grade" /></td>
				<td>
					<button type="button" 
						onclick="showDetailManagerInfo('<s:property value="id" />');">
						상세보기
					</button>
				</td>
			</tr>
			
			</s:iterator>        
			<!-- 반복 끝 -->
		</table>
	</div>
	

</div>

</body>
</html>