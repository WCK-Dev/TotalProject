<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀글 패스워드 입력</title>
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	window.resizeTo(500, 300);
});

function pwdCheck(){
	var b_no = '${board.b_no}';
	var b_pwd = '${board.b_pwd}';
	var input_pwd = $("#input_pwd").val();
	
	if(b_pwd == input_pwd) {
		var newwin = window.open("<c:url value='/readBoard.do' />?b_no="+b_no , "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
		newwin.focus();
	}else {
		alert("게시글 비밀번호를 확인해주십시오");
	}
}
</script>
</head>
<body>
	<div class="container" style="width:100%; text-align: center" >
		<h5 class="mt-5">비밀번호를 입력해주십시오.</h5>
		<input type="password" class="form-control" id="input_pwd" maxlength="30">
		<button type="button" class="btn btn-primary" onclick="pwdCheck()">비밀번호 입력</button>
	</div>
</body>
</html>