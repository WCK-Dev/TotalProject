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
<title>UpdateBoard</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
	var b_writer = $("#b_writer").val();
	if('${sessionScope.user.user_id}' != b_writer && '${sessionScope.user.admin_YN}' != 'Y'){
		alert("글쓴이 본인과 관리자만 게시글을 수정할 수 있습니다.\r\n현재 로그인 정보를 확인해주십시오.");
		history.back();
	}
});
	function update() {
		if( $("#b_title").val() == '' || $("#b_title").val().trim() == '' ){
			alert("제목을 입력해야 합니다.");
			$("#b_title").focus();
			return false;
		}
		
		if( $("#b_content").val() == '' || $("#b_content").val().trim() == '' ){
			alert("내용은 공백일 수 없습니다.");
			$("#b_content").focus();
			return false;
		}
		
		if( '${boardVO.b_secret}' == 1 && '${sessionScope.user.admin_YN}' != 'Y'){
			if($("#b_pwd").val() == '' || $("#b_pwd").val().trim() == ''){
				alert("비밀글 수정을 위해서는 글 비밀번호를 입력해야합니다.");
				$("#b_pwd").focus();
				return false;
			} 
			
			if($("#b_pwd").val() != '${boardVO.b_pwd}'){
				alert("게시글 비밀번호가 틀립니다.");
				return false;
			}
			
		}
		
		return true;
	}

</script>
</head>
<body class="container">
	<h1 class="text-center">게시글 등록</h1>
	
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" action="<c:url value='/updateBoard.do' />" id="updateForm">
			<input type="hidden" name="b_no" value="${boardVO.b_no }">
			
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_title">게시글 제목 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_title" name="b_title" placeholder="제목을 입력해주세요." value="${boardVO.b_title }" maxlength="100">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_writer">작성자 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_writer" name="b_writer" value="${boardVO.b_writer }" placeholder="작성자명을 입력해주세요." maxlength="20" readonly>
			    </div>
			  </div>
			  
			  <!-- 비밀글일때만 비밀번호 입력란 출력 -->
			  <c:if test="${sessionScope.user.admin_YN != 'Y' && boardVO.b_secret == 1}">
				  <div class="form-group mt-1">
				  	  <b>게시글 비밀번호 : &nbsp;&nbsp;&nbsp;</b>
				      <input type="password" id="b_pwd" name="b_pwd" class="form-control" style="width:63%; display:inline-block;" maxlength="20">
				  </div>
			  </c:if>
			  
			  <div class="form-group">
			    <div class="form-group">
				  <label for="b_content">게시글 내용</label>
				  <textarea class="form-control" rows="20" id="b_content" name="b_content" maxlength="1000">${boardVO.b_content }</textarea>
				</div>
			  </div>
			<div class="panel-footer float-right">
				<button type="submit" class="btn btn-primary" onclick="return update()">수정</button>
				<button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>