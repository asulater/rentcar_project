<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- tab css -->
<link rel="stylesheet" href="/TestSCRent/manage/css/staticsStyle.css">

<link rel="stylesheet" href="/TestSCRent/manage/css/manageStyle.css" type="text/css">
<script type="text/javascript" src="/TestSCRent/manage/js/carInfoFunc.js"></script>	
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<%-- <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script> --%>


<script type="text/javascript">


$(document).ready(function() {
	$.ajax({
		url : 'authorization2.action',
		type : 'post',
		dataType : 'json',
		data : {
			dropbox : '블록해지'
		},
		success : insertOK 
		,error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	});
});


	function approval(){
		/* var category = $("#category").val(); */
		
		var category = $('#category').val();
		var carid = $('#carid').val();
	 	var accidentno = $('#accidentno').val();
		
		$.ajax({
			url : 'approved.action',
			type : 'post',
			dataType : 'json',
			data : {
				carid : carid,
				category : category, 
				accidentno : accidentno
			},
			success : methodname
		}); 
	}
	
	function nonapproval(){
		var category = $('#category').val();
		var carid = $('#carid').val();
		
		$.ajax({
			url : 'declinded.action',
			type : 'post',
			dataType : 'json',
			data : {
				carid : carid,
				category : category
			},
			success : methodname
		}); 
	}
	
	function methodname(){
		location.href="showCarList.action";
	}

	function insertOK(obj) {
		
		
		var authorizationList = obj.authorizationList;
		var carAuthorizationList = obj.carAuthorizationList;
		
		var result = [];
		
		if(authorizationList != null){	
		result.push('<table id="" style="margin-top: 20px; margin-left: 20px;">');
		result.push('<tr id="" style="height: 40px; border-bottom: 2px solid #ddd;">');
		result.push('<th style="width: 150px; text-align:center;">요청날짜</th>');
		result.push('<th style="width: 100px; text-align:center;">사고차량ID</th>');
		result.push('<th style="width: 100px; text-align:center;">요청직원</th>');
		result.push('<th style="width: 300px; text-align:center;">결재사유</th>');
		result.push('<th style="width: 50px; text-align:center;">승인</th><th style="width: 50px; text-align:center;">비승인</th>')
		result.push('</tr>');
		
		$.each(authorizationList, function(index, app) {
			/* result.push('<input type="hidden" name="category" id="'+app.category+'" value="'+app.category+'" />');
			'+app.carid, app.category+'
			'+app.carid, app.category+'
			*/
			result.push('<tr id="" style="height: 35px; border-bottom: 1px solid #ddd;">');
			result.push('<input type="hidden" name="category" id="category" value="'+app.category+'" />');
			result.push('<input type="hidden" name="carid" id="carid" value="'+app.carid+'" />');
			
			result.push('<input type="hidden" name="accidentno" id="accidentno" value="'+app.accidentno+'" />');
			
			result.push('<td style="width: 150px" align="center">'+ app.requestdate+'</td>');
			result.push('<td style="width: 100px" align="center">'+ app.carid +'</td>');
			result.push('<td style="width: 100px" align="center">'+ app.requestid +'</td>');
			result.push('<th style="width: 300px" align="center">'+ app.appcomment+'</th>');
			result.push('<td style="width: 50px" align="center"><input type="button" id="btn1" value="승인" onClick="approval()"></td>');
			result.push('<td style="width: 50px" align="center"><input type="button" id="btn2" value="비승인" onClick="nonapproval()"></td>');
			result.push('</tr>');
			/* result.push('<tr>');
			result.push('<th style="width: 220px">기타</th>');
			result.push('<td style="width: 220px">' + acc.comments + '</td>');
			result.push('</tr>'); */
		});
		result.push('</table>');
		
		}else if(carAuthorizationList != null){		
			
		$.each(carAuthorizationList, function(index, car) {
			result.push('<center>');
			result.push('<input type="hidden" name="category" id="category" value="'+car.category+'" />');
			result.push('<input type="hidden" name="carid" id="carid" value="'+car.carid+'" />');
			result.push('<table id="buyCar">');
			result.push('<tr id="carItem">');
			result.push('<th style="width: 220px">담당직원</th>');
			result.push('</tr>');
			result.push('<tr id="carItem">');
			result.push('<td style="width: 220px" align="center">'+car.requestid+'</td>');
			result.push('</tr>');
			result.push('<tr id="carItem">');
			result.push('<td>차량명</td>');
			result.push('<td style="width: 220px" align="center">'+car.carname+'</td>');
			result.push('</tr>');
			result.push('<tr id="carItem">');
			result.push('<td>차종</td>');
			result.push('<td style="width: 220px" align="center">'+car.cartype+'</td>');
			result.push('</tr>');
			result.push('<tr id="carItem">');
			result.push('<td>제조사</td>');
			result.push('<td style="width: 220px" align="center">'+car.company+'</td>');
			result.push('</tr>');
			result.push('<tr id="carItem"><td>차량번호</td><td style="width: 220px" align="center">'+car.carid+'</td></tr>');
			result.push('<tr id="carItem"><td>가격</td><td style="width: 220px" align="center">'+car.price+'</td></tr>');
			result.push('<tr id="carItem"><td>연비</td><td style="width: 220px" align="center">'+car.km+'</td></tr>');
			result.push('<tr id="carItem"><td>승차인원</td><td style="width: 220px" align="center">'+car.persons+'</td></tr>');
			result.push('<tr id="carItem"><td>연료</td><td style="width: 220px" align="center">'+car.fuel+'</td></tr>');
			result.push('<tr id="carItem"><td>최대출력</td><td style="width: 220px" align="center">'+car.maxoutput+'</td></tr>');
			result.push('<tr id="carItem"><td>배기량</td><td style="width: 220px" align="center">'+car.capacity+'</td></tr>');
			result.push('<tr id="carItem"><td><input type="button" id="btn1" value="승인" onClick="approval()"></td>');
			result.push('<td><input type="button" id="btn2" value="비승인" onClick="nonapproval()"></td></tr>');
			result.push('</table>');
			result.push('</center>');
			});	 
		
		/* '+car.carid, car.category+' */
		}
		$('#resultDIV').html(result.join(''));
	}
</script>

</head>
<body>

<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header">결재사항</h3>
		
		<ul class="tab_comm">
			<li class="on" testvalue="블록해지"><a href="#none" class="link_tab">블록해지</a></li>
			<li testvalue="재점검요청"><a href="#none" class="link_tab">재점검요청</a></li>
			<li testvalue="차량구입"><a href="#none" class="link_tab">차량구입</a></li>
			<li testvalue="폐차요청"><a href="#none" class="link_tab">폐차요청</a></li>
		</ul>
		<script type="text/javascript">
      	//tab js
      	$('.tab_comm li').click(function() {
         
         	$('.tab_comm li').removeClass('on');
         	$(this).addClass('on');
         
         	var selectTab = $(this).attr('testvalue');
         	
         	$.ajax({
				url : 'authorization2.action',
				type : 'post',
				dataType : 'json',
				data : {
					dropbox : selectTab
				},
				success : insertOK
			});
         	
      	});
   		</script>
		
		<div id="resultDIV"></div>
	
	
	</div>



</body>
</html>