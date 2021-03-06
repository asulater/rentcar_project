<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 410px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
	.pop-layer .pop-container {padding: 20px 25px;}
	.pop-layer p.ctxt {color: #666; line-height: 25px;}
	.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

	a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
	a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
</style>
<style type="text/css">
/* body{margin:40px;} */

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
    left: 0;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
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

<script src="Client/js/jquery-1.11.3.js"></script>

<script type="text/javascript">

var map;
var mapW, mapH;
var cLonLat, zoom;
var marker;
var markerLayer;
var flag = "0";

function initTmap(){
    centerLL = new Tmap.LonLat(14144154.94205, 4510718.5239856);
    map = new Tmap.Map({div:'navimap',
                        width:'350px', 
                        height:'350px',
                        transitionEffect:"resize",
                        animation:true
                    }); 
    searchRoute();
};

function searchRoute()
{
	if(flag == "0")
	{
		
	    var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
	    var startX = document.getElementById('startX');
	    var startY = document.getElementById('startY');
	    var endX = document.getElementById('endX');
	    var endY = document.getElementById('endY');
	    
	    var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
	    urlStr += "&startX="+startX.value;
	    urlStr += "&startY="+startY.value;
	    urlStr += "&endX="+endX.value;
	    urlStr += "&endY="+endY.value;
	    urlStr += "&reqCoordType=WGS84GEO";
	    urlStr += "&appKey=4d796e0e-1f06-3e3a-b563-e0e64c5f14c9";
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol ??? ?????? URL ?????? ??? KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML ?????? parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // ?????? ?????? : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // ?????? ?????? : ???
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('distance');
	        var min = document.getElementById("minutes");
	        var tOil = document.getElementById("tOil");
	        var oil = $("#oilPrice").text();
	        var km = $("#km").text();
	        
	        //??????/?????? * ??????
	        var t = totalDistance[0].firstChild.data/1000
	        keisan.innerHTML = t
			min.innerHTML = (totalTime[0].firstChild.data / 60)
			tOil.innerHTML = Math.round((parseFloat(oil)*t/parseFloat(km)))
			
	        
	        // ????????? ???????????? ????????? ?????? ????????? 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // ????????? ???????????? ???????????? ??????
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // ?????????????????? ??????
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // ????????? ?????? parsing
	                case "style":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyles(nodes, options);
	                    }
	                    break;
	                case "stylemap":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyleMaps(nodes, options);
	                    }
	                    break;
	
	                // ?????? ??????
	                case "placemark":
	                    this.parseFeatures(nodes, options);
	                    break;
	            }
	        }
	        
	        return this.features;
	    };
	}
	else if(flag == "1")
	{
	    var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
	    var startX = document.getElementById('startX');
	    var startY = document.getElementById('startY');
	    var via1X = document.getElementById('via1X');
	    var via1Y = document.getElementById('via1Y');
	    var endX = document.getElementById('endX');
	    var endY = document.getElementById('endY');
	    
	    var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
	    urlStr += "&startX="+startX.value;
	    urlStr += "&startY="+startY.value;
	    urlStr += "&endX="+endX.value;
	    urlStr += "&endY="+endY.value;
	    urlStr += "&passList="+via1X.value + "," + via1Y.value;
	    urlStr += "&reqCoordType=WGS84GEO";
	    urlStr += "&appKey=4d796e0e-1f06-3e3a-b563-e0e64c5f14c9";
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol ??? ?????? URL ?????? ??? KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML ?????? parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // ?????? ?????? : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // ?????? ?????? : ???
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('distance');
	        var min = document.getElementById("minutes");
	        var tOil = document.getElementById("tOil");
	        var oil = $("#oilPrice").text();
	        var km = $("#km").text();
	        
	        //??????/?????? * ??????
	        var t = totalDistance[0].firstChild.data/1000
	        keisan.innerHTML = t
			min.innerHTML = (totalTime[0].firstChild.data / 60)
			tOil.innerHTML = Math.round((parseFloat(oil)*t/parseFloat(km)))
			
			
	        // ????????? ???????????? ????????? ?????? ????????? 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // ????????? ???????????? ???????????? ??????
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // ?????????????????? ??????
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // ????????? ?????? parsing
	                case "style":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyles(nodes, options);
	                    }
	                    break;
	                case "stylemap":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyleMaps(nodes, options);
	                    }
	                    break;
	
	                // ?????? ??????
	                case "placemark":
	                    this.parseFeatures(nodes, options);
	                    break;
	            }
	        }
	        
	        return this.features;
	    };	
	}
	else if(flag == "2")
	{
	    var routeFormat = new Tmap.Format.KML({extractStyles:true, extractAttributes:true});
	    var startX = document.getElementById('startX');
	    var startY = document.getElementById('startY');
	    var via1X = document.getElementById('via1X');
	    var via1Y = document.getElementById('via1Y');
	    var via2X = document.getElementById('via2X');
	    var via2Y = document.getElementById('via2Y');
	    var endX = document.getElementById('endX');
	    var endY = document.getElementById('endY');
	    
	    var urlStr = "https://apis.skplanetx.com/tmap/routes?version=1&format=xml";
	    urlStr += "&startX="+startX.value;
	    urlStr += "&startY="+startY.value;
	    urlStr += "&endX="+endX.value;
	    urlStr += "&endY="+endY.value;
	    urlStr += "&passList="+via1X.value + "," + via1Y.value + "_" + via2X.value + "," + via2Y.value;
	    urlStr += "&reqCoordType=WGS84GEO";
	    urlStr += "&appKey=4d796e0e-1f06-3e3a-b563-e0e64c5f14c9";
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol ??? ?????? URL ?????? ??? KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML ?????? parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // ?????? ?????? : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // ?????? ?????? : ???
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('distance');
	        var min = document.getElementById("minutes");
	        var tOil = document.getElementById("tOil");
	        var oil = $("#oilPrice").text();
	        var km = $("#km").text();
	        
	        //??????/?????? * ??????
	        var t = totalDistance[0].firstChild.data/1000
	        keisan.innerHTML = t
			min.innerHTML = (totalTime[0].firstChild.data / 60)
			tOil.innerHTML = Math.round((parseFloat(oil)*t/parseFloat(km)))
			

	        // ????????? ???????????? ????????? ?????? ????????? 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // ????????? ???????????? ???????????? ??????
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // ?????????????????? ??????
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // ????????? ?????? parsing
	                case "style":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyles(nodes, options);
	                    }
	                    break;
	                case "stylemap":
	                    if (this.extractStyles)
	                    {
	                        this.parseStyleMaps(nodes, options);
	                    }
	                    break;
	
	                // ?????? ??????
	                case "placemark":
	                    this.parseFeatures(nodes, options);
	                    break;
	            }
	        }
	        
	        return this.features;
	    };		
	}
}
//?????? ????????? ??? ?????????????????? ???
function onDrawnFeatures(e)
{
    map.zoomToExtent(this.getDataExtent());
}
// ????????? ??? ??????
function OpenStartMap()
{
//	alert("?????????")
	var startMap = document.getElementById('layer1');
	var strBtn = document.getElementById('startCheck');
	startMap.style.display = "block";
	strBtn.style.display = "block";
	
	$('#layer1_1').load("mapTest.action");	
}

// ????????? ??? ??????
function OpenEndMap()
{
	var endMap = document.getElementById('layer2');
	var endBtn = document.getElementById('endCheck');
	endMap.style.display = "block";
	endBtn.style.display = "block";
	
	$('#layer2_1').load("mapTest.action");
}

// ????????? ????????? ??? ??????
function OpenVia1Map()
{
	
	var via1Map = document.getElementById('layer3');
	var via1Btn = document.getElementById('viaBtn1');
	
	via1Map.style.display = "block";
	via1Btn.style.display = "block";
	
	$('#layer3_1').load("mapTest.action");
}

function OpenVia2Map()
{
	var via2Map = document.getElementById('layer4');
	var via2Btn = document.getElementById('viaBtn2');
	
	via2Map.style.display = "block";
	via2Btn.style.display = "block";
	
	$('#layer4_1').load("mapTest.action");
}

function StartCheck()
{
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('startX');
	var latY = document.getElementById('startY');
	var keyword = document.getElementById('keyword');
	
	var startText = document.getElementById('departure');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
//	alert('hidden start X = ' + lonX.value);
//	alert('hidden start Y = ' + latY.value);
	/* alert('????????? = ' + keyword.value); */
	
	startText.value = keyword.value;
	
	var startMap = document.getElementById('layer1');
	var strBtn = document.getElementById('startCheck');
	
	startMap.innerHTML = "";
	
	startMap.style.display = "none";
	strBtn.style.display = "none";
}

function EndCheck()
{
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('endX');
	var latY = document.getElementById('endY');
	var keyword = document.getElementById('keyword');
	
	var endText = document.getElementById('arrive');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
//	alert('hidden start X = ' + lonX.value);
//	alert('hidden start Y = ' + latY.value);
	/* alert('????????? = ' + keyword.value); */
	
	endText.value = keyword.value;
	
	var endMap = document.getElementById('layer2');
	var endBtn = document.getElementById('endCheck');
	
	endMap.innerHTML = "";
	
	endMap.style.display = "none";
	endBtn.style.display = "none";
}

function via1Check()
{
	flag = "1";
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('via1X');
	var latY = document.getElementById('via1Y');
	var keyword = document.getElementById('keyword');
	
	var via1Text = document.getElementById('st1');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
//	alert('hidden start X = ' + lonX.value);
//	alert('hidden start Y = ' + latY.value);
	/* alert('????????? = ' + keyword.value); */
	
	via1Text.value = keyword.value;
	
	var via1Map = document.getElementById('layer3');
	var via1Btn = document.getElementById('viaBtn1');
	
	via1Map.innerHTML = "";
	
	via1Map.style.display = "none";
	via1Btn.style.display = "none";
}

function via2Check()
{
	flag = "2";
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('via2X');
	var latY = document.getElementById('via2Y');
	var keyword = document.getElementById('keyword');
	
	var via2Text = document.getElementById('st2');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
//	alert('hidden start X = ' + lonX.value);
//	alert('hidden start Y = ' + latY.value);
	/* alert('????????? = ' + keyword.value); */
	
	via2Text.value = keyword.value;
	
	var via1Map = document.getElementById('layer4');
	var via1Btn = document.getElementById('viaBtn2');
	
	via1Map.innerHTML = "";
	
	via1Map.style.display = "none";
	via1Btn.style.display = "none";
}

function tempCheck()
{
	var div_map = document.getElementById('layer5');
	div_map.style.display="block";
	
	initTmap();
}

function viaCheck()
{
	var a = document.getElementById('via1');
	var b = document.getElementById('viaBtn1');
	
	a.style.display = "block";
	b.style.display = "block";
	
	flag = "1";
}

function viaCheck2()
{
	var a = document.getElementById('via2');
	var b = document.getElementById('viaBtn2');
	
	a.style.display = "block";
	b.style.display = "block";
	
	flag = "2";
}
</script>
<title>Rent3</title>
</head>
<body>
<h4>?????? ??????</h4>
<div class="stepwizard">
    <div class="stepwizard-row"></div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">1</button>
			<p>?????? ??????</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">2</button>
			<p>?????? ??????</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-primary btn-circle">3</button>
			<p>?????? ??????</p>
		</div>
		<div class="stepwizard-step"> 
			<button type="button" class="btn btn-default btn-circle">4</button>
			<p>???       ???</p>
		</div>
</div>

<table>
<tr>
<td height="120px">
?????? ??????
</td>
<td>
<div>?????????&nbsp;<a href="javascript:;" class="btn-example" onclick="layer_open1()"><input type="text" id="departure"><img src="Client/image/1445232242_Location.png" style="width: 15px;height: 15px"></a><br></div>
<div id="addSt1" style="display: none;"><br></div>
<div id="addSt2" style="display: none;"><br></div>
<div>?????????&nbsp;<a href="javascript:;" class="btn-example" onclick="layer_open2()"><input type="text" id="arrive"><img src="Client/image/1445232242_Location.png" style="width: 15px;height: 15px"></a></div>
</td>
<td>
<div id="mImg">
<a href="javascript:;" onclick="mAdd1()"><img src="Client/image/More-128.png" style="width: 30px;height: 30px"></a>
</div>
<br>
<div id="mImg1"></div>
</td>
</tr>
<tr>
<td>
</td>
</tr>
<tr><td>?????? | ???????????? | ????????????&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><s:property value="vo.fuel"/> | <span id="distance"></span>??? | <span id="minutes"></span>???</td>
</tr>
<tr>
<td>?????? ??????</td>
<td><span id="km"><s:property value="vo.km"/></span></td>
</tr>
<tr>
<td>?????? ?????? | ?????? ?????????</td>
<td><span id="oilPrice"><s:property value="oilPrice"/></span>??? || <span id="tOil"></span>???</td>
</tr>
<tr>
<td colspan="2"><input type="button" id="costCompare" value="?????? ????????? ??????" onclick="costCompare()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="??????" onclick="tempCheck()"></td>
</tr>
<tr>
<td colspan="2"><font>*???????????? ?????? ????????? ????????? ???????????? ????????????, ????????? ??? ????????????.</font></td>
</tr>
</table>

<!-- ????????? -->
<div id="layer1" class="pop-layer" style="width:600px;height:500px; display:none;">
	<div class="pop-container">
		<div class="pop-conts" id="layer1_1" style="width:400px;height:400px;">
			
			<!--// content-->
			
		</div>
		<div class="btn-r">
			<input type="button" id="startCheck" value="??????" onclick="StartCheck()" size="5" style="position:absolute;display:none;"/>
			<!-- <a href="javascript:;" class="cbtn">Close</a> -->
		</div>
	</div>
</div>

<!-- ????????? -->
<div id="layer2" class="pop-layer" style="width:600px;height:500px; display:none;">
	<div class="pop-container">
		<div class="pop-conts" id="layer2_1" style="width:400px;height:400px;">

		</div>
		<div class="btn-r">
			<input type="button" id="endCheck" value="??????" onclick="EndCheck()" size="5" style="position:absolute;display:none;"/>
		<!-- <a href="javascript:;" class="cbtn">Close</a> -->
		</div>
	</div>
</div>

<!-- ?????????1 -->
<div id="layer3" class="pop-layer" style="width:600px;height:500px; display:none;">
	<div class="pop-container">
		<div class="pop-conts" id="layer3_1" style="width:400px;height:400px;">
			<!--content //-->
			<!-- <p class="ctxt mb20">Thank you.<br>
				Your registration was submitted successfully.<br>
				Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
				Hope to see you soon!
			</p> -->
			
			<!--// content-->
		</div>
		<div class="btn-r">
			<input type="button" id="viaBtn1" value="?????????1" onclick="via1Check()" size="5" style="position:absolute;display:none;"/>
		</div>
	</div>
</div>

<!-- ?????????2 -->
<div id="layer4" class="pop-layer" style="width:600px;height:500px; display:none;">
	<div class="pop-container">
		<div class="pop-conts" id="layer4_1" style="width:400px;height:400px;">
			<!--content //-->
			<!-- <p class="ctxt mb20">Thank you.<br>
				Your registration was submitted successfully.<br>
				Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
				Hope to see you soon!
			</p> -->
			
			<!--// content-->
		</div>
		<div class="btn-r">
			<input type="button" id="viaBtn2" value="?????????2" onclick="via2Check()" size="5" style="position:absolute;display:none;" />
		</div>
	</div>
</div>


<div id="layer5" class="pop-layer" style="width:600px;height:500px; display:none;">
	<div class="pop-container">
		<div class="pop-conts" id="navimap" style="width:400px;height:400px;">

		</div>
		<div class="btn-r">
			<a href="javascript:;" class="cbtn" onclick="closeMap()">Close</a>
		</div>
	</div>
</div>





<s:hidden value="" id="tempX" theme="simple" />
<s:hidden value="" id="tempY" theme="simple" />
<s:hidden value="" id="startX" theme="simple" /> <!-- ?????? X ?????? -->
<s:hidden value="" id="startY" theme="simple" /> <!-- ?????? Y ?????? -->
<s:hidden value="" id="via1X" theme="simple" />	<!-- ?????????1 X ?????? -->
<s:hidden value="" id="via1Y" theme="simple" />	<!-- ?????????1 Y ?????? -->
<s:hidden value="" id="via2X" theme="simple" />	<!-- ?????????2 X ?????? -->
<s:hidden value="" id="via2Y" theme="simple" />	<!-- ?????????2 Y ?????? -->
<s:hidden value="" id="endX" theme="simple" />	<!-- ?????? X ?????? -->
<s:hidden value="" id="endY" theme="simple" />	<!-- ?????? Y ?????? -->

</body>
</html>