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
<title>Write Reply</title>

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
	function testValidation() {
		
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
		
		insertReply();
	}
	
	function insertReply(){
		var b_no = $("#b_no").val();
		var b_title = $("#b_title").val();
		var b_writer = $("#b_writer").val();
		var b_content = $("#b_content").val();
		var b_depth = $("#b_depth").val();
		var b_origin = $("#b_origin").val();
		var b_bseq = $("#b_bseq").val()
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/insertReply.do' />",
			dataType : "text",
			data : {"b_title": b_title
				   ,"b_writer": b_writer
				   ,"b_content": b_content
				   ,"b_refno": b_no
				   ,"b_depth": b_depth
				   ,"b_origin": b_origin
				   ,"b_bseq": b_bseq
					
			},
			
			success : function(result) {
				alert("답글이 정상적으로 등록되었습니다.");
				opener.location.reload();
				window.close();
			},
			error : function(error) {
		        alert("글 등록에 에러가 발생했습니다.");
				opener.location.reload();
				window.close();
		    }
		});
	}

</script>
</head>
<body class="container">
	<h1 class="text-center">답글작성</h1>
	
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" id="replyForm">
			<c:if test="${sessionScope.user.user_id == 'admin' }">
				<input type="hidden" name="" value="1">
			</c:if>
				<input type="hidden" id="b_no" name="b_no" value="${boardVO.b_no }">
				<input type="hidden" id="b_depth" name="b_depth" value="${boardVO.b_depth }">
				<input type="hidden" id="b_origin" name="b_origin" value="${boardVO.b_origin }">
				<input type="hidden" id="b_bseq" name="b_bseq" value="${boardVO.b_bseq }">
			
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_title">게시글 제목 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_title" name="b_title" value="${boardVO.b_title } 의 답글" placeholder="제목을 입력해주세요." maxlength="100">
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="b_writer">작성자 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="b_writer" name="b_writer" value="${sessionScope.user.user_id }" placeholder="작성자명을 입력해주세요." maxlength="20" readonly>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="form-group">
				  <label for="b_content">게시글 내용</label>
				  <textarea class="form-control" rows="20" id="b_content" name="b_content" maxlength="2000"></textarea>
				</div>
			  </div>
			<div class="panel-footer float-right">
				<button type="button" class="btn btn-primary" onclick="testValidation();">등록</button>
				<button type="button" class="btn btn-primary" onclick="history.back()">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>