<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>유저 권한 관리</title>
<%@include file="../cmmn/common_top.jsp"%>

<script>
	$(document).ready(function(){
		var user_roll = $("#user_roll option:selected").val();
		var changebox = $("input[type=checkbox]");
		
		if(user_roll == 'admin' || user_roll == 'manager') {
			$(changebox).each(function(index, item){
				$(item).prop('disabled', true);
			});
		}
	});
	
	function rollChange() {
		var user_roll = $("#user_roll option:selected").val();
		var changebox = $("input[type=checkbox]");

		if(user_roll == 'admin' || user_roll == 'manager') {
			$(changebox).each(function(index, item){
				$(item).val('Y');
				$(item).prop('checked', true);
				$(item).prop('disabled', true);
			});
		} else {
			$(changebox).each(function(index, item){
				$(item).val('N');
				$(item).prop('checked', false);
				$(item).prop('disabled', false);
			});
		}
	}

	function valueChange(auth) {
		var changebox = $("input[type=checkbox][name='"+auth+"']");
		
		if(changebox.val() == 'Y'){
			changebox.val('N');
		} else if(changebox.val() == 'N'){
			changebox.val('Y');
		}			
	}
	
	function updateUser() {
		var user_id = $("#user_id").val();
		var user_roll = $("#user_roll option:selected").val();
		var read_YN = $("#read_YN").val();
		var write_YN = $("#write_YN").val();
		var update_YN = $("#update_YN").val();
		var delete_YN = $("#delete_YN").val();
		var reply_YN = $("#reply_YN").val();
		var comment_YN = $("#comment_YN").val();
		
		$.ajax({
			type : 'POST',
			url : "<c:url value='/updateUser.do'/>",
			dataType : "text",
			data : {"user_id": user_id,
					"user_roll" : user_roll,
					"read_YN": read_YN,
					"write_YN": write_YN,
					"update_YN": update_YN,
					"delete_YN": delete_YN,
					"reply_YN": reply_YN,
					"comment_YN": comment_YN
					},
			
			success : function (result) {
				alert("유저권한을 변경하였습니다.");
				window.close();
			}
		});
	}
</script>

</head>
<body class="container">
	
	<h1 class="text-center">회원 권한 설정</h1>
	<hr>
	<div class="panel panel-default">
		<div class="panel-body mt-5">
			<form class="form-horizontal" method="post" id="writeForm">
			
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="user_id">유저 아이디 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="user_id" name="user_id" value="${userInfo.user_id}" readonly>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="control-label col-sm-2" for="user_name">유저명 : </label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="user_name" name="user_name" value="${userInfo.user_name }" readonly>
			    </div>
			  </div>
			  <div class="form-group">
				<fieldset>
			        <legend>유저 권한</legend>
			        	<select name="user_roll" id="user_roll" onchange="rollChange()" class="browser-default custom-select mb-3">
			        		<option value="user" <c:if test="${userInfo.user_roll == 'user'}">selected</c:if>>사용자권한</option>			        	
			        		<option value="manager" <c:if test="${userInfo.user_roll == 'manager'}">selected</c:if>>매니저권한</option>			        	
			        		<option value="admin" <c:if test="${userInfo.user_roll == 'admin'}">selected</c:if>>관리자권한</option>			        	
			        	</select>
			        	
				       	<input type="checkbox" name="read_YN" id="read_YN" value="${userInfo.read_YN }" onclick="valueChange('read_YN')" <c:if test="${userInfo.read_YN == 'Y'}">checked</c:if>>
					    <label for="read_YN">게시판 진입 권한</label><br>
					    <input type="checkbox" name="write_YN" id="write_YN" value="${userInfo.write_YN }" onclick="valueChange('write_YN')" <c:if test="${userInfo.write_YN == 'Y'}">checked</c:if>>
					    <label for="write_YN">글쓰기 권한</label><br>
					    <input type="checkbox" name="update_YN" id="update_YN" value="${userInfo.update_YN }" onclick="valueChange('update_YN')" <c:if test="${userInfo.update_YN == 'Y'}">checked</c:if>>
					    <label for="update_YN">글수정 권한</label><br>
					    <input type="checkbox" name="delete_YN" id="delete_YN" value="${userInfo.delete_YN }" onclick="valueChange('delete_YN')" <c:if test="${userInfo.delete_YN == 'Y'}">checked</c:if>>
					    <label for="delete_YN">글삭제 권한</label><br>
					    <input type="checkbox" name="reply_YN" id="reply_YN" value="${userInfo.reply_YN }" onclick="valueChange('reply_YN')" <c:if test="${userInfo.reply_YN == 'Y'}">checked</c:if>>
					    <label for="reply_YN">답글 권한</label><br>
					    <input type="checkbox" name="comment_YN" id="comment_YN" value="${userInfo.comment_YN }" onclick="valueChange('comment_YN')" <c:if test="${userInfo.comment_YN == 'Y'}">checked</c:if>>
					    <label for="comment_YN">댓글 권한</label><br>
			    </fieldset>
			  </div>
			<div class="panel-footer float-right">
				<button type="button" class="btn btn-primary" onclick="updateUser();">권한 변경</button>
				<button type="button" class="btn btn-primary" onclick="window.close();">취소</button>
			</div>
			</form>
		</div>
	</div>
		
</body>
</html>