<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function open_win_noresizeable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300,height=100");		
	}

</script>

</head>
<body>
	<center>
	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h3>게시판</h3></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		
		<tr>
			<td height="1" colspan="2"></td>	
		</tr>
		
		<tr>
			<td>번호</td>
			<td>&nbsp;&nbsp;<s:property value="seqarg" /></td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="100">제목</td>
			<td width="500">&nbsp;&nbsp;<s:property value="boardVo.title" /> </td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td>글쓴이</td>
			<td>&nbsp;&nbsp;<s:property value="boardVo.writer" /> </td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td>&nbsp;&nbsp;<s:property value="boardVo.content" /> </td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td>조회 수</td>
			<td>&nbsp;&nbsp;<s:property value="boardVo.hit" /> </td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td>등록날짜</td>
			<td>&nbsp;&nbsp;<s:property value="boardVo.regdate" /> </td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="center" colspan="2">
				
				<s:url id="modifyURL" action="modifyForm">
					<s:param name="seq">
						<s:property value="seqarg" />
					</s:param>
				</s:url>
				
				<s:url id="deleteURL" action="deleteAction">
					<s:param name="seq">
						<s:property value="seqarg" />
					</s:param>
				</s:url>
				
				<input name="list" type="button" value="수정" class="inputb" onclick="javascript:open_win_noresizeable('checkFormAction.action?seqarg=<s:property value="seqarg" />&currentPage=<s:property value="currentPage" />','modify')" />
				
				<input name="list" type="button" value="삭제" class="inputb" onclick="javascript:open_win_noresizeable('checkFormAction.action?seqarg=<s:property value="seqarg" />&currentPage=<s:property value="currentPage" />','delete')" />
				
				<input name="list" type="button" value="목록" class="inputb" onclick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'" />
			</td>
		</tr>
		
	</table>
	
	</center>
</body>
</html>