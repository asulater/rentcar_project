<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css"
	type="text/css">
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>	
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').html("<img id=img src='' width='400px' height='300px'>");
				$('#img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	jQuery(window).load(function(){
		 jQuery("div img").each(function(){
		  if (jQuery(this).css("width") > "700"){
		   jQuery(this).css("width",670);
		  } 
		 });
		});
	
	function alert1(){
		alert('구매요청 완료');
		return true;
	}

</script>

</head>
<body>
<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header">차량구입신청</h3>

		<div id="UploadedImg"></div>

		<s:form action="insert" theme="simple" enctype="multipart/form-data" onsubmit="return alert1()">
			<input type="hidden" name="managerid" id="managerid"
				value="managerid" />
			<table id="buyCar">
				<tr id="carItem">
					<td>차량명</td>
					<td><s:textfield name="carname" size="44"
							placeholder="차량명을 입력해 주세요" /></td>
				</tr>
				<tr id="carItem">
					<td>차종</td>
					<td><s:textfield name="cartype" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>제조사</td>
					<td><s:textfield name="company" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>차량번호</td>
					<td><s:textfield name="carid" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>가격</td>
					<td><s:textfield name="price" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>연비</td>
					<td><s:textfield name="km" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>승차인원</td>
					<td><s:textfield name="persons" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>연료</td>
					<td><s:textfield name="fuel" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>최대출력</td>
					<td><s:textfield name="maxoutput" size="44" /></td>
				</tr>
				<tr id="carItem">
					<td>배기량</td>
					<td><s:textfield name="capacity" size="44" /></td><br><br><br>
				</tr>
				<tr id="carItem">
					<td></td><td><s:file name="upload" id="fileName"
							onchange="readURL(this)" /></td>
				</tr>
				<tr id="carItem">
					<td></td><td><s:submit value="구입요청"></s:submit></td>
				</tr>
			</table>
		</s:form>
	</div>

</body>
</html>