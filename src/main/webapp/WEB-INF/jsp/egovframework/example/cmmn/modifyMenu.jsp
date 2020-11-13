<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>메뉴 설정</title>
<%@include file="../cmmn/common_top.jsp"%>

<script type="text/javascript">

	function testValidation(){
		
		var menu_ref = $("#menu_ref option:selected").val();
		var menu_refLevel = $("#level"+menu_ref).val();
		
		
		if(menu_refLevel != undefined && !$("#menu_ref").attr("disabled")){
			$("#menu_reflevel").val(menu_refLevel);
		}
		
		if($("#menu_url").val() == '' || $("#menu_url").val().trim() == ''){
			$("#menu_url").val("#");
		}
		
		if($("#menu_name").val() == '' || $("#menu_name").val().trim() == ''){
			alert("메뉴명을 입력해주세요.");
			$("#menu_name").focus();
			return false;
		}
		else {
			$("#MenuForm").submit();
		}
		
	}
	
	function checkLowerMenu(menu_id){
		
		if($("#menu_lv_modify").prop("checked")) {
			$.ajax({
				type : 'POST',
				url : "checkLowerMenu.do",
				async : false,
				dataType : "json",
				data : {"menu_id": menu_id},
				
				success : function (result) {
					console.log(result);
					
					if(result.length == 0) {
						$('#menu_ref').attr('disabled', false);
					} else {
						alert("하위메뉴가 존재하는 메뉴는 상위메뉴를 변경할 수 없습니다.\r\n먼저 하위메뉴를 처리한 후 시도하세요");
						$("#menu_lv_modify").prop("checked", false);
					}
				}
			}); // ajax End
			
		} else {
			$('#menu_ref').attr('disabled', true);
		}
		
	}
</script>

</head>
<body>
	<div class="container wrapper">
	    <p class="h4 mt-5 mb-4 font-weight-bold text-center">메뉴 변경</p>
		
		<form action="modifyMenu.do" method="post" id="MenuForm">
		<input type="hidden" name="menu_id" value="${menuInfo.menu_id }">
		<table class="table border border-dark text-center">
			<tr>
				<td><h5>메뉴명</h5></td>
				<td colspan="3"><input type="text" id="menu_name" name="menu_name" maxlength="30" placeholder="새로운 메뉴명을 입력해주세요" class="form-control" value="${menuInfo.menu_name }" ></td>
			</tr>
			<tr>
				<td>
					<h5>상위메뉴</h5>
					변경하기 <input type="checkbox" id="menu_lv_modify" value="0" onchange="checkLowerMenu(${menuInfo.menu_id })">
				</td>
				<td>
					<input type="hidden" id="menu_reflevel" name="menu_reflevel" value="0">
					<select name="menu_ref" id="menu_ref" class="browser-default custom-select" disabled="disabled">
						<option value="-1">없음</option>
						<c:forEach items="${menuListAll }" var="menu">
							<c:if test="${menu.menu_level != 3 && menu.menu_id != menuInfo.menu_id}">
								<option value="${menu.menu_id }" <c:if test="${menu.menu_id == menuInfo.menu_depth1 || menu.menu_id == menuInfo.menu_depth2 }">selected</c:if>>
									<c:forEach begin="2" end="${menu.menu_level }">&nbsp;</c:forEach>
									<c:if test="${menu.menu_level > 1 }">ㄴ</c:if> 
									${menu.menu_name}
								
								<option style="display: none;" id="level${menu.menu_id}">
									${menu.menu_level}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<td><h5>접근권한</h5></td>
				<td>
					<select name="menu_auth" id="menu_auth" class="browser-default custom-select">
						<option value="user/manager/admin" <c:if test="${menuInfo.menu_auth == 'user/manager/admin' }">selected</c:if>>전체</option>
						<option value="manager/admin" <c:if test="${menuInfo.menu_auth == 'manager/admin' }">selected</c:if>>매니저</option>
						<option value="admin" <c:if test="${menuInfo.menu_auth == 'admin' }">selected</c:if>>관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><h5>메뉴URL</h5></td>
				<td colspan="3"><input type="text" id="menu_url" name="menu_url" maxlength="300" placeholder="메뉴버튼과 연결될 URL주소를 입력해주세요" class="form-control" value="${menuInfo.menu_url }"></td>
			</tr>
			<tr>
				<td><h5>메뉴 설명<h5></td>
				<td colspan="3">
					<textarea class="form-control" style="min-height: 140px" name="menu_info">${menuInfo.menu_info }</textarea>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		
		<div class="panel-footer float-right">
			<button type="button" class="btn btn-primary" onclick="testValidation()">메뉴항목 변경</button>
		</div>
		</form>
	</div>
</body>
</html>