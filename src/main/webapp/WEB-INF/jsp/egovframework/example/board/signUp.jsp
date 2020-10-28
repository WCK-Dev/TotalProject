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
<title>User signUp</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
	var isPass = [false, false, false, false];
	
	function boardList() {
		location.href = "<c:url value='/boardList.do'/>"
	}
	
	//사용자 아이디 유효성검사
	function idCheck(){
		var user_id = $("#user_id").val();
		var id = RegExp(/^[a-z0-9]+$/);
		
		// 사용불가능한 아이디일 때, 폰트 컬러 초기화(빨강)  
		$("#alertId").css("color", "red");
		
		if(!id.test(user_id) || (user_id.length > 20 || user_id.length < 6)) {
			$("#alertId").text("아이디는 6~20자의 영문 소문자와 숫자로 작성해주세요.");
		}else{
			$.ajax({
				type : 'POST',
				url : "<c:url value='/idCheck.do'/>",
				data : {"user_id": user_id},
				
				success : function(result) {
					if(result == 1) {
						$("#alertId").text("같은 아이디가 존재합니다.");
						isPass[0] = false;
					}
					else {
						// 사용가능한 아이디일 때, 폰트 컬러 지정(초록색)  
						$("#alertId").css("color", "#03C75A");
						$("#alertId").text("사용가능한 아이디입니다.");
						isPass[0] = true;
					}
				}
			});
		}
	}
	
	//비밀번호 유효성 검사
	function pwdCheck() {
		var user_id = $("#user_id").val();
		var user_pwd = $("#user_pwd").val();
		var pwd = RegExp(/^[a-z0-9]+$/);
		
	    if(!pwd.test(user_pwd) || user_pwd.length > 20 || user_pwd.length < 6) {
	    	$("#alertPwd1").css("color", "red");
			$("#alertPwd1").text("6 ~ 20자의 영문 소문자와 숫자로 작성해주세요.");
			$("#user_pwd2").val("");
			$("#user_pwd2").attr("disabled", "disabled");
			$("#alertPwd2").css("color", "red");
	        $("#alertPwd2").text("");
			isPass[1] = false;
			isPass[2] = false;
	    }else{
	    	$("#alertPwd1").css("color", "#03C75A");
			$("#alertPwd1").text("사용하실수 있는 비밀번호 입니다.");
			$("#user_pwd2").val("");
			$("#user_pwd2").removeAttr("disabled");
			isPass[1] = true;
	    }
	}
	
	//비밀번호 & 비밀번호 확인 일치 검사
	function isSame(){
		var pwd = $("#user_pwd").val();
		var pwd2 = $("#user_pwd2").val();
		
		if(pwd != pwd2){
			$("#alertPwd2").css("color", "red");
	        $("#alertPwd2").text("비밀번호가 일치하지 않습니다.");
			isPass[2] = false;
	    }else{
	    	$("#alertPwd2").css("color", "#03C75A");
	        $("#alertPwd2").text("비밀번호가 일치합니다.");
			isPass[2] = true;
	    }
	}
	
	//사용자명 유효성 검사
	function nameCheck(){
		var user_name = $("#user_name").val();
		var name = RegExp(/^[가-힣]+$/);
		
		if(!name.test(user_name) || user_name.length < 2) {
			$("#alertName").css("color", "red");
			$("#alertName").text("띄어쓰기 없이 이름을 입력해주세요.");
			isPass[3] = false;
	    }else{
	    	$("#alertName").css("color", "#03C75A");
	        $("#alertName").text("입력양식에 맞습니다.");
			isPass[3] = true;
	    }
	}
	
	
	function signUp() {
		if(!isPass[0]) {
			alert("사용자 아이디를 중복확인 해주세요.");
			$("#user_id").focus();
			return false;
		}
		if(!isPass[1]) {
			alert("비밀번호를 입력해주세요.");
			$("#user_pwd").focus();
			return false;
		}
		
		isSame();
		
		if(!isPass[2]) {
			alert("비밀번호 확인란을 재입력해주세요.");
			$("#user_pwd2").focus();
			return false;
		}
		if(!isPass[3]) {
			alert("이름을 입력 해주세요.");
			$("#user_name").focus();
			return false;
		}
		
		return (isPass[0] && isPass[1] && isPass[2] && isPass[3] && isPass[4]);
	}

</script>
</head>
<body>
	<div class="container wrapper" style="width:600px">
		<h1 class="text-center">회원가입</h1>
		<form class="text-center border border-light p-5" action="<c:url value='/signUp.do' />" method="post">
			
			<!-- ID -->
			<div class="mb-4">
		    	<input type="text" id="user_id" name="user_id" class="form-control" placeholder="ID를 입력하세요" onchange="idCheck()" maxlength="20">
		    	<p id="alertId" class="m-0 ml-2 text-left" style="font-size: 13px;"></p>
		    </div>
		    
		    <!-- Password -->
			<div class="mb-4">
		    	<input type="password" id="user_pwd" name="user_pwd" class="form-control" placeholder="Password를 입력하세요" onchange="pwdCheck()" maxlength="20">
		    	<p id="alertPwd1" class="m-0 ml-2 text-left" style="font-size: 13px;"></p>
		    </div>
		    
		     <!-- Password check -->
		    <div class="mb-4">
		    	<input type="password" id="user_pwd2" name="user_pwd2" class="form-control" placeholder="Password를 다시한번 입력하세요" onchange="isSame()" disabled="disabled" maxlength="20">
		    	<p id="alertPwd2" class="m-0 ml-2 text-left" style="font-size: 13px;"></p>
		    </div>
		    
		    <!-- Name -->
		    <div class="mb-4">
		    	<input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름을 입력하세요" onchange="nameCheck()" maxlength="20">
		    	<p id="alertName" class="m-0 ml-2 text-left" style="font-size: 13px;"></p>
		 	</div>
			
		    <button class="btn btn-primary btn-block" type="submit" onclick="return signUp()">회원가입하기</button>
		    <button class="btn btn-danger btn-block mt-3" type="button" onclick="return boardList()">메인으로</button>
		</form>
	</div>
</body>
</html>