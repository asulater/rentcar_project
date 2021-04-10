<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
	<%@ include file="../menu.jsp" %>
	<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/bootstrap-wysihtml5-2-min.css">
	<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/bootstrap-wysihtml5.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
</head>

<body>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h3 class="page-header">공지사항</h3>
	
		<!-- 조회란 만들기  -->
		<table>
			<tr height="40px">
				<td width="500px" align="center" style="color: #5a5a5a; font-size: large;">${notice.title}</td>
				<td width="110px" align="center" style="color: #bdbdbd; font-size: small;">조회수 ${notice.count}</td>
				<td width="170px" align="center" style="color: #bdbdbd; font-size: small;">${notice.insertdate}</td>
			</tr>
		</table>
		
		
		<div style="width: 780px; margin-top: 20px; padding: 15px; border-top: 1px solid #cfcfcf; border-bottom: 1px solid #cfcfcf;">
			${notice.content}
		</div>
		
		<!--  버튼  -->
		<div style="width: 780px; height: 40px; vertical-align: middle; margin-top: 10px; text-align: right; padding-right: 10px;" >
			<button type="button" onclick="location.href='updateNoticeForm.action?noticeNo=' + ${notice.noticeno}">수정</button>
			<button type="button" onclick="location.href='deleteNotice.action?noticeNo=' + ${notice.noticeno}">삭제</button>
			<button type="button" onclick="location.href='showNoticeList.action'">목록보기</button>
		</div>

		
		
	</div>
	
</body>
</html>