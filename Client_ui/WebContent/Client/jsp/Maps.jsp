<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./map.css"/>
<script type="text/javascript" src="jquery-1.11.3.js"></script> 
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=39bc76d90d173f1b62b3dbfac3fd90e5&libraries=services"></script>



<script>

function OpenMap()
{
	$('#map_div').load("a.action");
}
	
</script>

</head>
<body>

<a href="#" onclick="OpenMap()">맵 열기</a>
<div id="map_div" style="width:800px;height:600px;"></div>


</body>
</html>