<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/scheduleCalendarStyle.css" type="text/css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/TestSCRent/manage/js/calendar.js"></script>

</head>
<body>
	<section class="container">
	<table class="cal">
		<caption>
			<span class="prev" onclick="javascript:showPrevCalendar();">&larr;</span> 
			<span class="next" onclick="javascript:showNextCalendar();">&rarr;</span>
			<span id="monthYearTitle"></span>
		</caption>
		<thead>
			<tr>
				<th>Mon</th>
				<th>Tue</th>
				<th>Wed</th>
				<th>Thu</th>
				<th>Fri</th>
				<th>Sat</th>
				<th>Sun</th>
			</tr>
		</thead>
		<tbody id="printDate">
			
		</tbody>
	</table>
	</section>

</body>
</html>

