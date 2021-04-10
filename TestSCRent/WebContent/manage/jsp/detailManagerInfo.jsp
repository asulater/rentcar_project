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
<script type="text/javascript" src="/TestSCRent/manage/js/manageFunc.js"></script>	

</head>
<body>
<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h3 class="page-header">사원관리</h3>
		<table id="detailManagerInfoTable">
			<tr>
				<td >사원 아이디</td>
				<td>${manager.id}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${manager.name}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${manager.phone}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${manager.email}</td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name='gradeList' id="selectView">
						<!-- 본래 직급 option 생성 -->
					    <option value="${manager.grade}" selected>${manager.grade}</option>
					    
					    <!-- 사원이 해당하는 직급 이외 나머지를 option 으로 생성하기 -->
					    <s:iterator value="gradeList" var="grade">
					    	<s:if test="%{#grade != manager.grade}">
					    		<option value="<s:property value="#grade"/>"><s:property value="#grade"/></option>
   							</s:if>
					    </s:iterator>
					</select>
				</td>
			</tr>
		</table>
		
		<div class="buttonWrap">
		<button type="button" onclick="infoUpdateValueChk('${manager.id}');">변경사항 저장</button>  
		</div>

</div>

</body>
</html>