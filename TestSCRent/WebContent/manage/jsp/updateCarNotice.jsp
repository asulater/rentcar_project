<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
	<%@ include file="../menu.jsp" %>
	<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/bootstrap-wysihtml5-2-min.css">
	<link rel="stylesheet" type="text/css" href="/TestSCRent/manage/bootstrap-3.3.5/css/bootstrap-wysihtml5.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	
</head>

<body>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<h3 class="page-header">공지사항 수정</h3>
	
		<form action="updateNotice" method="post" onsubmit="return checkNoticeContent();">
		<!--  입력란 만들기  -->
		<input type="text" placeholder="제목을 입력하세요" name="noticeTitle" id="title" style="width: 780px; height: 25px;" value="${notice.title}">
		<textarea class="textarea" placeholder="Enter text ..." name="noticeContent" id="content" style="width: 780px; height: 480px;">${notice.content}</textarea>
		<input type="hidden" name="noticeNo" value="${notice.noticeno}">
		
		
		<!--  js 적용  -->
		<!--  @@ menu.jsp 적용시 충돌남! (하이퍼링크, 이미지첨부 기능)  -->
<!-- 		<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script> -->
		<script src="/TestSCRent/manage/bootstrap-3.3.5/js/wysihtml5-0.3.0.js"></script>
		<script src="/TestSCRent/manage/bootstrap-3.3.5/js/bootstrap.min.js"></script>
		<script src="/TestSCRent/manage/bootstrap-3.3.5/js/bootstrap-wysihtml5.js"></script>
	
		<script>
			$('.textarea').wysihtml5({
				"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
				"emphasis": true, //Italics, bold, etc. Default true
				"lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
				"html": false, //Button which allows you to edit the generated HTML. Default false
				"link": false, //Button to insert a link. Default true
				"image": false, //Button to insert an image. Default true,
				"color": false //Button to change color of font  
			});
			
			function checkNoticeContent(){
				var title = $('#title').val();
				var contet = $('#content').val();
				
				if((title == '') || (content == '')){
					alert("제목 및 내용을 입력해 주세요");
					return false;
				}else{
					alert("공지사항을 수정합니다");
					return true;
				}
				
			}
		</script>
		
		
		<!--  버튼  -->
		<div style="width: 780px; height: 40px; vertical-align: middle; margin-top: 10px;  text-align: right; padding-right: 10px;"" >
			<button type="submit">저장</button>
			<button type="button" onclick="location.href='deleteNotice.action?noticeNo=' + ${notice.noticeno}">삭제</button>
			<button type="button" onclick="location.href='showNoticeList.action'">목록보기</button>
		</div>
		</form>
		
		
	</div>
	
</body>
</html>