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
<title>로그인</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<style type="text/css">
	.container { width: 30%;}
</style>
<script>
$(document).ready(function(){
	
	/* 로그인 메시지 출력 */
	if('${loginErrorMsg}' != ''){
		alert('${loginErrorMsg}');
	}
	
	if('${loginSuccess}' != ''){
		alert('${loginSuccess}');
	}
	
	/* 회원가입 정상수행 시 */
	if('${joinSuccessMsg}' != ''){
		alert('${joinSuccessMsg}');
	}
	
	/* 회원가입 오류발생시 */
	if('${joinErrorMsg}' != ''){
		alert('${joinErrorMsg}');
	}
});

function loginCheck(){
	if($('#user_id').val() == '' || $('#user_id').val().trim() == ''){
		alert("아이디를 입력해주세요.");
		$('#user_id').focus();
		return false;
	}
	if($('#user_pwd').val() == '' || $('#user_pwd').val().trim() == ''){
		alert("비밀번호를 입력해주세요.");
		$('#user_id').focus();
		return false;
	}
	
	return true;
}


function signUp(){
	location.href = "<c:url value='/signUp.do' />";
}


</script>
</head>
<body>
<div class="container wrapper">
	<form class="text-center border border-light p-5" action="<c:url value='/login.do' />" method="post" onsubmit="return loginCheck()">
		<p class="h4 mb-4">로그인</p>
		<input type="hidden" name="isPopUp" value="true">
		
	    <input type="text" id="user_id" name="user_id" class="form-control mb-4" placeholder="아이디를 입력해주세요">
	
	    <input type="password" id="user_pwd" name="user_pwd" class="form-control mb-4" placeholder="비밀번호를 입력해주세요">
		
		<p class="text-danger" style="font-size: 13px">${alert }</p>
		
	    <button class="btn btn-primary btn-block my-4" type="submit">로그인</button>
	    <button class="btn btn-danger btn-block my-4" type="button" onclick="signUp()">회원가입</button>
	</form>
</div>
</body>
</html>