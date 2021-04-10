<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    window.alert = function(){};
    var defaultCSS = document.getElementById('bootstrap-css');
    function changeCSS(css){
        if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
        else $('head > link').filter(':first').replaceWith(defaultCSS); 
    }
    $( document ).ready(function() {
      var iframe_height = parseInt($('html').height()); 
      window.parent.postMessage( iframe_height, 'http://bootsnipp.com');
    });
</script>

<style type="text/css">
.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
   
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 18px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    left: 0;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
    /* Width = 100% / number-of-steps */
    width: 20%;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>

<title>Rent4</title>
</head>
<body>
<h4>결 제</h4>
<div class="stepwizard">
    <div class="stepwizard-row"></div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">1</button>
			<p>대여 기간</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">2</button>
			<p>차량 선택</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">3</button>
			<p>여정 선택</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-primary btn-circle">4</button>
			<p>결       제</p>
		</div>
</div>

<table>
<tr>
<td>결제 금액</td>
<td><s:property value="total"/></td>
</tr>
<tr>
<td>카드명</td>
<td>
<select id="card" name="card">
<option value="선택하세요">선택하세요</option>
<option value="현대카드">현대카드</option>
<option value="삼성카드">삼성카드</option>
<option value="KB카드">KB카드</option>
<option value="BC카드">BC카드</option>
<option value="외환카드">외환카드</option>
<option value="신한카드">신한카드</option>
<option value="롯데카드">롯데카드</option>
</select>
</td>
</tr>
<tr>
<td>카드 번호</td>
<td>
<input type="text" id="cd1" name="cd1" size="3" maxlength="4" >
<input type="text" id="cd2" name="cd2" size="3" maxlength="4">
<input type="text" id="cd3" name="cd3" size="3" maxlength="4">
<input type="text" id="cd4" name="cd4" size="3" maxlength="4">
</td>
</tr>
<tr>
<td>유효기간</td>
<td>
<select id="mExp" name="mExp">
<option value="**">**</option>
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>년
<select id="yExp" name="yExp">
<option value="****">****</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
<option value="2022">2022</option>
</select>
</td>
</tr>
<tr>
<td>할부</td>
<td>
<select id="inst" name="inst">
<option value="일시불">일시불</option>
<option value="2개월">2개월</option>
<option value="3개월">3개월</option>
<option value="6개월">6개월</option>
<option value="12개월">12개월</option>
</select>
</td>
</tr>
</table>
</body>
</html>