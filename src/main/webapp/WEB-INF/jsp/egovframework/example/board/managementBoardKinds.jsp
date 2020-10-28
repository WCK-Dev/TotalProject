<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<title>게시판 설정 관리</title>

<script>
	
	function testValidation() {
		
		if( $("#bk_bname").val() == '' || $("#bk_bname").val().trim() == '' ){
			alert("게시판 이름을 입력해야 합니다.");
			$("#bk_bname").focus();
			return false;
		}
	}
	
	function updateBoardKinds(bk_bseq){
		
		testValidation();
			
		var bk_bname = $("#bk_bname").val();
		var bk_type = $(":radio[name='bk_type']:checked").val();
		var bk_breply_YN = $(":radio[name='bk_breply_YN']:checked").val();
		var bk_bcomment_YN = $(":radio[name='bk_bcomment_YN']:checked").val();
		var bk_bsecret_YN = $(":radio[name='bk_bsecret_YN']:checked").val();
		var bk_order = $("#bk_order").val();
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/updateBoardKinds.do'/>",
			dataType : "text",
			data : {"bk_bseq": bk_bseq
				   ,"bk_bname": bk_bname
				   ,"bk_type": bk_type
				   ,"bk_breply_YN": bk_breply_YN
				   ,"bk_bcomment_YN": bk_bcomment_YN
				   ,"bk_bsecret_YN": bk_bsecret_YN
				   ,"bk_order": bk_order
				   },
			
			success : function(result) {
				alert("게시판설정이 변경되었습니다.");
				opener.location.reload();
				window.close();
			}
		});
	}
	
	function deleteBoardKinds(bk_bseq){
		
		if(confirm("게시판을 삭제합니다. \r\n삭제된 게시판은 복구할 수 없습니다.")){
			$.ajax({
				type : 'POST',
				url : "<c:url value='/deleteBoardKinds.do'/>",
				dataType : "text",
				data : {"bk_bseq": bk_bseq },
				
				success : function(result) {
					console.log(result);
					alert("게시판이 삭제되었습니다.");
					opener.location.reload();
					window.close();
				}
			});
		}
	}
	
</script>

</head>
<body class="container">
	<h1 class="text-center">게시판 설정변경</h1>
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" id="writeForm">
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="bk_bname">게시판 이름 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="bk_bname" name="bk_bname" value="${boardKinds.bk_bname }" maxlength="30">
			    </div>
			  </div>
			  <div style="width: 100%">
			      <b>게시판 타입 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_type1" name="bk_type" value="0" <c:if test="${boardKinds.bk_type == 0 }">checked</c:if>><label for="bk_type1">&nbsp;일반형 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_type2" name="bk_type" value="1" <c:if test="${boardKinds.bk_type == 1 }">checked</c:if>><label for="bk_type2">&nbsp;알림형</label>
			  </div>
			  <div style="width: 100%">
			      <b>답글 허용 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_breply_YN1" name="bk_breply_YN" value="Y" <c:if test="${boardKinds.bk_breply_YN == 'Y' }">checked</c:if>><label for="bk_breply_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_breply_YN2" name="bk_breply_YN" value="N" <c:if test="${boardKinds.bk_breply_YN == 'N' }">checked</c:if>><label for="bk_breply_YN2">&nbsp;비허용</label>                  
			  </div>
			  <div style="width: 100%">
			      <b>댓글 허용 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_bcomment_YN1" name="bk_bcomment_YN" value="Y" <c:if test="${boardKinds.bk_bcomment_YN == 'Y' }">checked</c:if>><label for="bk_bcomment_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_bcomment_YN2" name="bk_bcomment_YN" value="N" <c:if test="${boardKinds.bk_bcomment_YN == 'N' }">checked</c:if>><label for="bk_bcomment_YN2">&nbsp;비허용</label>                 
			  </div>
			  <div style="width: 100%">
			      <b>비밀글 허용 : &nbsp;&nbsp;&nbsp;</b>
			      <input type="radio" id="bk_bsecret_YN1" name="bk_bsecret_YN" value="Y" <c:if test="${boardKinds.bk_bsecret_YN == 'Y' }">checked</c:if>><label for="bk_bsecret_YN1">&nbsp;허용 &nbsp;&nbsp;&nbsp;</label>
			      <input type="radio" id="bk_bsecret_YN2" name="bk_bsecret_YN" value="N" <c:if test="${boardKinds.bk_bsecret_YN == 'N' }">checked</c:if>><label for="bk_bsecret_YN2">&nbsp;비허용</label>
			  </div>
			  
			  <div class="mb-4">
			  	<b>게시판 노출 순서 : &nbsp;&nbsp;&nbsp;</b>${boardKinds.bk_order}<br>
			  	<small style="color: red">게시판 순서변경은 관리창의 드래그&드랍으로 변경할 수 있습니다.</small>
			  </div>
			  
			<div class="panel-footer float-left">
				<button type="button" class="btn btn-danger" onclick="deleteBoardKinds(${boardKinds.bk_bseq});">게시판 삭제</button>
			</div>
			<div class="panel-footer float-right">
				<button type="button" class="btn btn-primary" onclick="updateBoardKinds(${boardKinds.bk_bseq});">수정</button>
				<button type="button" class="btn btn-primary" onclick="window.close();">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>