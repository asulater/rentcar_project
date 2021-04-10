<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>공지사항</h1>

<table width="100%" border="0" cellspacing="0" cellpadding="2">
	
	<tr>
		<td width="50">번호</td>
		<td>제목</td>
		<td width="80">날짜</td>
		<td width="50">조회</td>		
	</tr>
	
	<s:iterator value="list" status="stat">
		
		<s:url id="viewURL" action="viewAction">
			<s:param name="seqarg">
				<s:property value="seq" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
		
		<tr> 
			<td><s:property value="seq" /></td>
			<td>
				<s:a href="%{viewURL}">
					<s:property value="title" />
				</s:a>
			</td>
			<td><s:property value="regdate" /> </td>
			<td><s:property value="hit" /> </td>
		</tr>
			
	</s:iterator>
	
	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="4" align="center">글</td>
		</tr>
	</s:if>
	
	<tr align="center">
		<td colspan="4">
			<s:property value="pagingHtml" escape="false" />
			글없음
		</td>
	</tr>
	
	<tr align="right">
	</tr>
	
</table>

</body>
</html>
