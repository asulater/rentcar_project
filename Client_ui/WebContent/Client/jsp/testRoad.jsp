<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="Client/js/jquery-1.11.3.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=39bc76d90d173f1b62b3dbfac3fd90e5&libraries=services"></script>
<script src="https://apis.skplanetx.com/tmap/js?version=1&format=javascript&appKey=4d796e0e-1f06-3e3a-b563-e0e64c5f14c9"></script>

<script>
var map;
var mapW, mapH;
var cLonLat, zoom;
var marker;
var markerLayer;
var flag = "0";

function initTmap(){
    centerLL = new Tmap.LonLat(14144154.94205, 4510718.5239856);
    map = new Tmap.Map({div:'naviMap',
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
		alert(flag);
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
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol 을 통해 URL 전송 후 KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML 파일 parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // 경로 단위 : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // 시간 단위 : 초
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('keisan');
	        
	        keisan.innerHTML = (totalDistance[0].firstChild.data/1000) + " km" + " / " + (totalTime[0].firstChild.data / 60) + " 분"
	        
	        // 노드를 검색해서 필요한 것을 찾아냄 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // 노드를 못찾으면 다음으로 진행
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // 외부링크에서 검색
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // 스타일 정보 parsing
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
	
	                // 파싱 정의
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
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol 을 통해 URL 전송 후 KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML 파일 parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // 경로 단위 : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // 시간 단위 : 초
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('keisan');
	        
	        keisan.innerHTML = (totalDistance[0].firstChild.data/1000) + " km" + " / " + (totalTime[0].firstChild.data / 60) + " 분"
	        
	        // 노드를 검색해서 필요한 것을 찾아냄 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // 노드를 못찾으면 다음으로 진행
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // 외부링크에서 검색
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // 스타일 정보 parsing
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
	
	                // 파싱 정의
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
	    var prtcl = new Tmap.Protocol.HTTP({	// Protocol 을 통해 URL 전송 후 KML(XML) return 
	                                        url: urlStr,
	                                        format:routeFormat
	                                        });
	    var routeLayer = new Tmap.Layer.Vector("route", {protocol:prtcl, strategies:[new Tmap.Strategy.Fixed()]});
	    routeLayer.events.register("featuresadded", routeLayer, onDrawnFeatures);
	    map.addLayer(routeLayer);
		
	    // KML 파일 parsing
	    Tmap.Format.KML.prototype.parseData = function(data, options) 
	    {
	        if(typeof data == "string") 
	        {
	            data = Tmap.Format.XML.prototype.read.apply(this, [data]);
	        }
	        // 경로 단위 : M
	        var totalDistance = this.getElementsByTagNameNS(data, "*", "totalDistance");
	        // 시간 단위 : 초
	        var totalTime = this.getElementsByTagNameNS(data, "*", "totalTime");
	        console.log(totalDistance[0].firstChild.data);
	        console.log(totalTime[0].firstChild.data);
	        
	        var keisan = document.getElementById('keisan');
	        
	        keisan.innerHTML = (totalDistance[0].firstChild.data/1000) + " km" + " / " + (totalTime[0].firstChild.data / 60) + " 분"
	        
	        // 노드를 검색해서 필요한 것을 찾아냄 
	        var types = ["Link", "NetworkLink", "Style", "StyleMap", "Placemark"];
	        for(var i=0, len=types.length; i<len; ++i)
	        {
	            var type = types[i];
	
	            var nodes = this.getElementsByTagNameNS(data, "*", type);
	
	            // 노드를 못찾으면 다음으로 진행
	            if(nodes.length == 0)
	            { 
	                continue;
	            }
	
	            switch (type.toLowerCase())
	            {
	    	        // 외부링크에서 검색
	                case "link":
	                case "networklink":
	                    this.parseLinks(nodes, options);
	                    break;
	
	                // 스타일 정보 parsing
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
	
	                // 파싱 정의
	                case "placemark":
	                    this.parseFeatures(nodes, options);
	                    break;
	            }
	        }
	        
	        return this.features;
	    };		
	}
}
//경로 그리기 후 해당영역으로 줌
function onDrawnFeatures(e)
{
    map.zoomToExtent(this.getDataExtent());
}
// 출발지 맵 열기
function OpenStartMap()
{
	var startMap = document.getElementById('startMap');
	var strBtn = document.getElementById('startCheck');
	startMap.style.display = "block";
	strBtn.style.display = "block";
	
	$('#startMap').load("MapTest.action");	
}

// 도착지 맵 열기
function OpenEndMap()
{
	var endMap = document.getElementById('endMap');
	var endBtn = document.getElementById('endCheck');
	endMap.style.display = "block";
	endBtn.style.display = "block";
	
	$('#endMap').load("MapTest.action");
}

// 첫번째 경유지 맵 열기
function OpenVia1Map()
{
	var via1Map = document.getElementById('via1Map');
	var via1Btn = document.getElementById('via1Check');
	
	via1Map.style.display = "block";
	via1Btn.style.display = "block";
	
	$('#via1Map').load("MapTest.action");
}

function OpenVia2Map()
{
	var via2Map = document.getElementById('via2Map');
	var via2Btn = document.getElementById('via2Check');
	
	via2Map.style.display = "block";
	via2Btn.style.display = "block";
	
	$('#via2Map').load("MapTest.action");
}

function StartCheck()
{
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('startX');
	var latY = document.getElementById('startY');
	var keyword = document.getElementById('keyword');
	
	var startText = document.getElementById('start');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
	alert('hidden start X = ' + lonX.value);
	alert('hidden start Y = ' + latY.value);
	alert('키워드 = ' + keyword.value);
	
	startText.value = keyword.value;
	
	var startMap = document.getElementById('startMap');
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
	
	var endText = document.getElementById('end');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
	alert('hidden start X = ' + lonX.value);
	alert('hidden start Y = ' + latY.value);
	alert('키워드 = ' + keyword.value);
	
	endText.value = keyword.value;
	
	var endMap = document.getElementById('endMap');
	var endBtn = document.getElementById('endCheck');
	
	endMap.innerHTML = "";
	
	endMap.style.display = "none";
	endBtn.style.display = "none";
}

function via1Check()
{
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('via1X');
	var latY = document.getElementById('via1Y');
	var keyword = document.getElementById('keyword');
	
	var via1Text = document.getElementById('via1');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
	alert('hidden start X = ' + lonX.value);
	alert('hidden start Y = ' + latY.value);
	alert('키워드 = ' + keyword.value);
	
	via1Text.value = keyword.value;
	
	var via1Map = document.getElementById('via1Map');
	var via1Btn = document.getElementById('via1Check');
	
	via1Map.innerHTML = "";
	
	via1Map.style.display = "none";
	via1Btn.style.display = "none";
}

function via2Check()
{
	var tempX = document.getElementById('tempX');
	var tempY = document.getElementById('tempY');
	var lonX = document.getElementById('via2X');
	var latY = document.getElementById('via2Y');
	var keyword = document.getElementById('keyword');
	
	var via2Text = document.getElementById('via2');
	
	lonX.value = tempX.value;
	latY.value = tempY.value;
	
	alert('hidden start X = ' + lonX.value);
	alert('hidden start Y = ' + latY.value);
	alert('키워드 = ' + keyword.value);
	
	via2Text.value = keyword.value;
	
	var via1Map = document.getElementById('via2Map');
	var via1Btn = document.getElementById('via2Check');
	
	via1Map.innerHTML = "";
	
	via1Map.style.display = "none";
	via1Btn.style.display = "none";
}

function tempCheck()
{
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

</head>
<body>
<s:hidden value="" id="tempX" theme="simple" />
<s:hidden value="" id="tempY" theme="simple" />
<s:hidden value="" id="startX" theme="simple" /> <!-- 출발 X 좌표 -->
<s:hidden value="" id="startY" theme="simple" /> <!-- 출발 Y 좌표 -->
<s:hidden value="" id="via1X" theme="simple" />	<!-- 경유지1 X 좌표 -->
<s:hidden value="" id="via1Y" theme="simple" />	<!-- 경유지1 Y 좌표 -->
<s:hidden value="" id="via2X" theme="simple" />	<!-- 경유지2 X 좌표 -->
<s:hidden value="" id="via2Y" theme="simple" />	<!-- 경유지2 Y 좌표 -->
<s:hidden value="" id="endX" theme="simple" />	<!-- 도착 X 좌표 -->
<s:hidden value="" id="endY" theme="simple" />	<!-- 도착 Y 좌표 -->

<input type="text" id="start" value="" />
<input type="button" value="출발지" onclick="OpenStartMap()" />

<div id="startMap" style="width:400px;height:400px;display:block;"></div>
<input type="button" id="startCheck" value="확정" onclick="StartCheck()" size="5" style="position:absolute;margin-left:59%;display:none;"/>

<br />


<a href="javascript:;" onclick="viaCheck()">경유지 넣을래여?</a>
<input type="text" id="via1" value="" style="display:none;" />
<input type="button" id="viaBtn1" value="경유지1" onclick="OpenVia1Map()" style="display:none;" />
<div id="via1Map" style="width:400px;height:400px;display:block;"></div>
<input type="button" id="via1Check" value="확정" onclick="via1Check()" size="5" style="position:absolute;margin-left:59%;display:none;"/>


<a href="javascript:;" onclick="viaCheck2()">경유지 또 넣을래여?</a>
<input type="text" id="via2" value="" style="display:none;" />
<input type="button" id="viaBtn2" value="경유지2" onclick="OpenVia2Map()" style="display:none;" />
<div id="via2Map" style="width:400px;height:400px;display:block;"></div>
<input type="button" id="via2Check" value="확정" onclick="via2Check()" size="5" style="position:absolute;margin-left:59%;display:none;"/>



<input type="text" id="end" value="" />
<input type="button" value="도착지" onclick="OpenEndMap()" />

<br />

<div id="endMap" style="width:400px;height:400px;display:block;"></div>
<input type="button" id="endCheck" value="확정" onclick="EndCheck()" size="5" style="position:absolute;margin-left:59%;display:none;"/>

<br /><br />

<div id="naviMap" style="width:600px;height:600px;"></div>

<br /> <input type="button" value="경로" onclick="tempCheck()" />

<p id="keisan">거리 / 시간 :</p>

</body>
</html>