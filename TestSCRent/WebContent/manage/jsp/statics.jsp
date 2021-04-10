<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- 모리스 -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<!-- tab css -->
<link rel="stylesheet" href="/TestSCRent/manage/css/staticsStyle.css">

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	start();
});
 
function start(){
	var value1 = $('#bestcar').attr('testvalue');
	
	$('#VIPMember').html('');
	$('#BestCar-total').html('');
	$('#Fuelquantity').html('');
	$('#YearlySale').html('');
	
	
	$.ajax({
		url : 'statics3.action',
		type : 'post',
		data :  {temp : value1},
		dataType : 'json',
		success : OKmethod
	});
}
function start1(){
	
	var value1 = $('#sales').attr('testvalue');
	$('#VIPMember').html('');
	$('#BestCar-total').html('');
	$('#Fuelquantity').html('');
	$('#YearlySale').html('');
	
	$.ajax({
		url : 'statics3.action',
		type : 'post',
		data :  {temp : value1},
		dataType : 'json',
		success : OKmethod
	});
	
}

function start2(){
	
	var value1 = $('#seasoncar').attr('testvalue');
	$('#VIPMember').html('');
	$('#BestCar-total').html('');
	$('#Fuelquantity').html('');
	$('#YearlySale').html('');
	
	$.ajax({
		url : 'statics3.action',
		type : 'post',
		data :  {temp : value1},
		dataType : 'json',
		success : OKmethod
	});
	
}


	function OKmethod(obj) {

		var viplist = obj.viplist;
		var bestCarList = obj.bestCarList;
		var yearlylist = obj.yearlylist;
		var fflist= obj.fflist;
			
		if (viplist != null) {
			var list = [];	
			var list2 = [];
		
			$.each(viplist,function(index, app) {
				 list[index] = {y: app.rank+"위 아이디:"+app.id, a: app.sale};
			});
			Morris.Bar({
				  element: 'VIPMember',
				  data: list,
				  xkey: 'y',
				  ykeys: ['a'],
				  labels: ['이용횟수'], 
				  gridTextColor: ['red'],
	              pointFillColors: ['green'],
	              pointStrokeColors: ['red'],
	              barColors: ['#EFEFEF']
				});

		}if(bestCarList != null){
			
			var list4 = [];
			$.each(bestCarList,function(index, app) {
					list4[index] = {y: app.rank+"위 차종:"+app.carname, a: app.sale};
			});
			
			Morris.Bar({
				  element: 'BestCar-total',
				  data: list4,
				  xkey: 'y',
				  ykeys: ['a'],
				  labels: ['이용횟수'],
				  gridTextColor: ['red'],
	              pointFillColors: ['green'],
	              pointStrokeColors: ['red'],
	              barColors: ['#708090']
				});
					
			
		}if(fflist != null){
			var list = [];
			$.each(fflist,function(index, app) {
				list[index] = {label: app.fuel, value: app.sale };
			});
			
			Morris.Donut({
				  element: 'Fuelquantity',
				  data:  list 
				});
		}if(yearlylist  != null){
			
			var list3 = [];
			
			$.each(yearlylist,function(index, app) {
			   var temp = app.year;
				list3[index] = {y: temp, a: app.count};
			});

			Morris.Line({
				  element: 'YearlySale',
				  data: list3,
				  xkey: 'y',
				  ykeys: ['a'],
				  labels: ['이용횟수'],
				  gridTextColor: ['red'],
	              pointFillColors: ['green'],
	              pointStrokeColors: ['red'],
	              lineColors: ['red']
				});
		}if(springbestCarList != null){
	         
	         var list4 = [];
	         $.each(springbestCarList,function(index, app) {
	               list4[index] = {y: app.rank+"위 차종:"+app.carname, a: app.sale};
	         });
	         
	         Morris.Bar({
	              element: 'SpringBestCar-total',
	              data: list4,
	              xkey: 'y',
	              ykeys: ['a'],
	              labels: ['이용횟수'],	
	              gridTextColor : [ 'red' ],
					pointFillColors : [ 'green' ],
					pointStrokeColors : [ 'red' ],
					barColors : [ '#708090' ]
	            });
	      } if(summerbestCarList != null){
	         alert('써머');
	         var list4 = [];
	         $.each(summerbestCarList,function(index, app) {
	               list4[index] = {y: app.rank+"위 차종:"+app.carname, a: app.sale};
	         });
	         
	         Morris.Bar({
	              element: 'summerbestCarList-total',
	              data: list4,
	              xkey: 'y',
	              ykeys: ['a'],
	              labels: ['이용횟수']
	            });
	      }if(fallbestCarList != null){
	         
	         var list4 = [];
	         $.each(fallbestCarList,function(index, app) {
	               list4[index] = {y: app.rank+"위 차종:"+app.carname, a: app.sale};
	         });
	         
	         Morris.Bar({
	              element: 'fallbestCarList-total',
	              data: list4,
	              xkey: 'y',
	              ykeys: ['a'],
	              labels: ['이용횟수']
	            });
	      }if(winterbestCarList != null){
	         
	         var list4 = [];
	         $.each(winterbestCarList,function(index, app) {
	               list4[index] = {y: app.rank+"위 차종:"+app.carname, a: app.sale};
	         });
	         
	         Morris.Bar({
	              element: 'winterbestCarList-total',
	              data: list4,
	              xkey: 'y',
	              ykeys: ['a'],
	              labels: ['이용횟수'],barColors : [ '#708090' ]
	            });
	      }   
	}

</script>
<style>
#listView {
	display: inline-block;
}

#buyCar {
	width: 600px;
	margin-bottom: 30px;
}
</style>
<title>Insert title here</title>
</head>




<body>
	<%@ include file="../menu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header">통계</h3>

		<ul class="tab_comm">
			<li class="on" id="bestcar" testvalue="bestcar" onclick="start()"><a
				href="#none" class="link_tab">Best차량, 선호연료</a></li>
			<li id="sales" testvalue="sales" onclick="start1()"><a
				href="#none" class="link_tab">대여량 추이, 우수고객 순위</a></li>

		</ul>
		<script type="text/javascript">
      //tab js
      $('.tab_comm li').click(function() {
         
         $('.tab_comm li').removeClass('on');
         $(this).addClass('on');
         
      });
   </script>
		<div id="YearlySale">월별 매출추이</div>

		<div id="BestCar-total">Best of Best Car</div>

		<div id="VIPMember">VIP 회원</div>

		<div id="Fuelquantity">선호연료</div>
	</div>
</body>
</html>