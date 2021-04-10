<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Client/image/favicon1.ico">
<title>ID 중복체크 | SmartChoice Rent</title>

<script language="javascript">
//검색어 입력 여부 확인
function formCheck() {
	var searchText = document.getElementById('searchText');
	if (searchText.value == '') {
		alert('검색할 ID를 입력하세요.');
		searchText.focus();
		return false;
	}
	if (searchText.value.length < 3 || searchText.value.length > 12) {
		alert('아이디는 3-12자로 등록 가능합니다.');
		searchText.focus();
		searchText.select();
		return false;
	}
	return true;
}

//ID 사용
function selectId(id) {
	opener.joinForm.id.value = id;
	this.close();
}
</script>
</head>

<body>

<h2>[ ID 중복 확인 ]</h2>

<s:form name="idform" action="idCheck" method="post" onSubmit="return formCheck();" theme="simple">

ID : <s:textfield name="searchText" id="searchText" />
	<s:submit value="검색" />
</s:form>
<br><br>

<!-- ID 검색 후에만 실행 -->
<s:if test="idCheck != null">
	<s:if test="idCheck">
		사용 가능한 아이디 입니다.<br>
		<input type="button" value="ID 사용하기" onClick="selectId('${searchText}')">
	</s:if>
	<s:else>
		${searchText} 은(는) 이미 사용중인 아이디입니다.
	</s:else>
</s:if>

</body>
</html>
