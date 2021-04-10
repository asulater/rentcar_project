<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="./bootstrap-3.3.5/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/component.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./bootstrap-3.3.5/js/scripts.js"></script>
<script src="./js/classie.js"></script>
<script type="text/javascript" src="./js/authorityFunc.js"></script>


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.action">SC Car Manager</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
<%-- 				<li><s:if test="#{session.mLoginId} != null">#{session.mLoginId} 님</s:if></li> --%>
				<li><a href="logout.action">Logout</a></li>
				<li><a href="#">Help</a></li>
			</ul>

		</div>
	</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
		
			<div class="col-sm-3 col-md-2 sidebar">
		 	<!-- 사원이상 접근 가능 -->
	        	<ul class="nav nav-sidebar" id="level01">
	            	<li><a href="showCarList.action">차량정보 <span class="sr-only">(current)</span></a></li>
	            	<li><a id="showReserveMenu" href="#">예약정보</a></li>
	           		<li><a href="showNoticeList.action">공지사항</a></li>
					<li><a href="statics.action">통계</a></li>
	        	</ul>
	         
		    <!-- 주임이상 접근 가능 -->
		    	<ul class="nav nav-sidebar" id="level02">
	           		<li><a id="showCheckMenu" href="#">차량점검</a></li>
	           		<li><a href="buyCar.action">차량구입</a></li>
	         	</ul>
		  
		    <!-- 지점장 접근 가능 -->
	        	<ul class="nav nav-sidebar" id="level03">
	          		<li><a href="authorization.action">결재</a></li>
	          		<li><a href="searchManagersList.action">사원관리</a></li>
	         	</ul>
			</div>
		
		</div>
	</div>

	
	
	<!-- 예약정보 메뉴 -->
    <div class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
			<h3>예약관리</h3>
			<a href="showReserveScheduleList.action">예약신청목록 및 승인</a>
			<a href="showIsUseList.action">대여 중 목록 및 반납처리</a>
			<a href="shwoRentCancelList.action">예약취소목록 조회</a>
		</nav>
	</div>
	
	<!-- 차량점검 메뉴 -->
    <div class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s2">
			<h3>차량점검</h3>
			<a href="showInspectCarList.action">정기점검</a>
			<a href="addAccident.action">사고차량 등록</a>
			<a href="accList.action">정비 중 차량목록 조회</a>
		</nav>
	</div>
	
	<!-- 통계 메뉴 -->
    <div class="cbp-spmenu-push">
		<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s3">
			<h3>Menu</h3>
			<a href="#">.....</a>
			<a href="#">.....</a>
			<a href="#">.....</a>
		</nav>
	</div>


</body>
</html>