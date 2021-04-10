<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> :: SC Rent :: </title>

<link rel="stylesheet" href="/TestSCRent/manage/css/boardNotice.css" type="text/css">
<link rel="stylesheet" href="/TestSCRent/manage/css/pagingStyle.css" type="text/css">


<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/boardNoticeFunc.js"></script>


</head>



<body>
	
	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h3 class="page-header">공지사항</h3>
		
		<div id="noticeListView">
			<table>
			
				<tr id="noticeListTitle">
					<td><div class="title">글번호</div></td>
					<td><div class="title">제목</div></td>
					<td><div class="title">글쓴이</div></td>
					<td><div class="title">조회수</div></td>
					<td><div class="title">등록일자</div></td>
				</tr>
				
			<!-- 반복 시작 -->
			<s:iterator value="noticeList" status="status">
				<tr class = "noticeItem">
					<td><s:property value="noticeno" /></td>
					<td><a href="#" onclick="goDetailNoticePage('<s:property value="noticeno" />')"><s:property value="title" /></a></td>
					<td>관리자</td>
					<td><s:property value="count" /></td>
					<td><s:property value="insertdate" /></td>
				</tr>
			</s:iterator>        
			<!-- 반복 끝 -->
			
			</table>
		</div>
	
		<div id="buttonBar">
			<button type="button" onclick="goWriteNoticePage();" id="writeBtn">글쓰기</button>
		</div>
	
	
		<div id="pageWrap">	
			<div class="paging_comm">
				<s:property value="pagingHtml" escape="false" />
			</div>
		</div>
	
	</div>

	

</body>
</html>