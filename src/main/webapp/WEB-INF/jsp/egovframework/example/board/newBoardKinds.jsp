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
<title>Write Board</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
	
	function testValidation() {
		
		if( $("#bk_bname").val() == '' || $("#bk_bname").val().trim() == '' ){
			alert("게시판 이름을 입력해야 합니다.");
			$("#bk_bname").focus();
			return false;
		}
		
		insertBoardKinds();
	}
	
	function insertBoardKinds(){
		var bk_bname = $("#bk_bname").val();
		var bk_type = $(":radio[name='bk_type']:checked").val();
		var bk_breply_YN = $(":radio[name='bk_breply_YN']:checked").val();
		var bk_bcomment_YN = $(":radio[name='bk_bcomment_YN']:checked").val();
		var bk_bsecret_YN = $(":radio[name='bk_bsecret_YN']:checked").val();
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/insertBoardKinds.do'/>",
			dataType : "text",
			data : {"bk_bname": bk_bname
				   ,"bk_type": bk_type
				   ,"bk_breply_YN": bk_breply_YN
				   ,"bk_bcomment_YN": bk_bcomment_YN
				   ,"bk_bsecret_YN": bk_bsecret_YN
				   },
			
			success : function(result) {
				alert("게시판이 추가되었습니다.");
				opener.location.reload();
				window.close();
			}
		});
	}
</script>
</head>
<body class="container">
	<h1 class="text-center">게시판 추가</h1>
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" id="writeForm">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bk_bname">게시판 이름 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="bk_bname" name="bk_bname" placeholder="게시판 이름을 입력하세요" maxlength="30">
			    </div>
			  </div>
			  <div style="width: 100%">
			      <b>게시판 타입 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_type1" name="bk_type" value="0" checked>				<label for="bk_type1">&nbsp;일반형 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_type2" name="bk_type" value="1">						<label for="bk_type2">&nbsp;알림형</label>
			  </div>
			  <div style="width: 100%">
			      <b>답글 허용 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_breply_YN1" name="bk_breply_YN" value="Y" checked>		<label for="bk_breply_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_breply_YN2" name="bk_breply_YN" value="N">        		<label for="bk_breply_YN2">&nbsp;비허용</label>
			  </div>
			  <div style="width: 100%">
			      <b>댓글 허용 : &nbsp;&nbsp;&nbsp;</b>
	      		  <input type="radio" id="bk_bcomment_YN1" name="bk_bcomment_YN" value="Y" checked><label for="bk_bcomment_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_bcomment_YN2" name="bk_bcomment_YN" value="N">        <label for="bk_bcomment_YN2">&nbsp;비허용</label>                 
			  </div>
			  <div style="width: 100%">
			      <b>비밀글 허용 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_bsecret_YN1" name="bk_bsecret_YN" value="Y" checked>	<label for="bk_bsecret_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_bsecret_YN2" name="bk_bsecret_YN" value="N">			<label for="bk_bsecret_YN2">&nbsp;비허용</label>                 
			  </div>
			<div class="panel-footer float-right">
				<button type="button" class="btn btn-primary" onclick="testValidation();">추가</button>
				<button type="button" class="btn btn-primary" onclick="window.close();">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>