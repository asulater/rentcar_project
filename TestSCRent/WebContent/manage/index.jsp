<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/bootstrap-ad.min.css">
<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/_all-skins.min.css">
<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/AdminLTE.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>

</head>

 <body>
	<%@ include file="./menu.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    
		<!-- Small boxes (Stat box) -->
        <div class="row">
	        
	        <div class="col-lg-3 col-xs-6">
	          <!-- small box -->
	          <div class="small-box bg-blue">
	            <div class="inner">
	              <h3>${reserveCount}</h3>
	              <p>이달의 예약</p>
	            </div>
	            <div class="icon">
					<i class="ion ion-clipboard"></i>
	            </div>
	            <a href="showReserveScheduleList.action" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
	          </div>
	        </div>
	        <!-- ./col -->
	        
	        <div class="col-lg-3 col-xs-6">
	          <!-- small box -->
	          <div class="small-box bg-teal">
	            <div class="inner">
	              <h3>${accRate}<sup style="font-size: 20px">%</sup></h3>
	              <p>이달 사고 비율</p>
	            </div>
	            <div class="icon">
	              <i class="ion ion-alert-circled"></i>
	            </div>
	            <a href="accList.action" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
	          </div>
	        </div>
	        <!-- ./col -->
	        
	        <div class="col-lg-3 col-xs-6">
	          <!-- small box -->
	          <div class="small-box bg-aqua">
	            <div class="inner">
	              <h3>${safetyCheckCount}</h3>
	              <p>점검필요 차량</p>
	            </div>
	            <div class="icon">
	             <i class="ion ion-wrench"></i>
	            </div>
	            <a href="showInspectCarList.action" class="small-box-footer">More info <i class="fa fa-arrow-right"></i></a>
	          </div>
	        </div>
	        <!-- ./col -->
      	
      	
      	</div>
     	<!-- /.row -->
     	
     	
     	
     	<!-- 오늘의 에약건 -->
     	<div class="row">
     	
			<!-- TABLE -->
          	<div class="box box-default">
            <div class="box-header with-border">
              <h3 class="box-title">오늘의 예약</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>예약번호</th>
                    <th>차량명(차량번호)</th>
                    <th>고객명(아이디)</th>
                    <th>고객 연락처</th>
                    <th>총요금</th>
                  </tr>
                  </thead>
                  
                  <tbody>
	                  <s:iterator value="reserveList" status="status">
		                  <tr>
		                    <td><s:property value="rentno" /></td>
		                    <td><a href="showDetailInfo.action?selectCarId=<s:property value="carid" />"><s:property value="carname" />(<s:property value="carid" />)</a></td>
		                    <td><s:property value="membername" />(<s:property value="memberid" />)</td>
		                    <td><s:property value="memberphone" /></td>
		                    <td><s:property value="total" /></td>
		                  </tr>
	                  </s:iterator>
	                  
                  </tbody>
                  
                </table>
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              <a href="javascript::;" class="btn btn-sm btn-default btn-flat pull-right" onclick="location.href='showReserveScheduleList.action'">View All Reserve</a>
            </div>
            <!-- /.box-footer -->
          	</div>
         	<!-- /.box -->
     		
     	</div>
     	
          
    </div>

    
  </body>

</html>