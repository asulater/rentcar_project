<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
#accListTableTitle {height: 40px; border-top: 2px solid #aaaaaa; border-bottom: 2px solid #e9e9e9; vertical-align: middle; }
.accListTableBody {height: 35px; border-bottom: 1px solid #eee;}
.accListInnerTitle { border-right: 1px solid #eaeaea; }
</style>

</head>
<body>
	<%@ include file="../menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h3 class="page-header">정비 중 차량목록 조회</h3>
		<div id="listView">
			<form name="simple">
				<table>
					<tr id="accListTableTitle">
						<td style="width: 180px" align="center"><div class="accListInnerTitle">사고차량ID</div></td>
						<td style="width: 180px" align="center"><div class="accListInnerTitle">유저ID</div></td>
						<td style="width: 200px" align="center"><div class="accListInnerTitle">날짜</div></td>
						<td style="width: 180px" align="center">서류ID</td>
					</tr>

					<s:iterator value="accList" status="status">
						<tr class="accListTableBody">
						<td style="width: 180px" align="center">
							<!-- accDetail 액션 전달값을 carid에서 accidentno으로 변경 -->
							<a href="accDetail.action?accidentno=<s:property value='accidentno' />"><s:property value="carid" /></a>
						</td>
						<td style="width: 180px" align="center"><s:property value="userid" /></td>
						<td style="width: 200px" align="center"><s:property value="accidentdate" /></td>
						<td style="width: 180px" align="center"><s:property value="documentno" /></td>
						</tr>
					</s:iterator>
				</table>
			</form>
		</div>
	</div>

		
</body>
</html>