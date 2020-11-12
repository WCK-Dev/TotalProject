<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>게시판 관리</title>
<%@include file="../cmmn/common_top.jsp"%>

<script type="text/javascript">

	function modifyMenu(menu_id, menu_level){
		location.href = "modifyMenu.do?menu_id=" + menu_id
	}
	
	function deleteMenu(menu_id, menu_level){
		if(confirm("메뉴를 삭제하면 해당메뉴와 함께 하위 메뉴도 모두 삭제됩니다.\r\n정말 메뉴를 삭제할까요?")){
			location.href = "deleteMenu.do?menu_id=" + menu_id +"&menu_level=" + menu_level;
		}
	}
</script>

</head>
<body>
	<div class="container wrapper">
		<p class="h2 mb-4 text-center"><a href="adminMain.do">Admin Main</a></p>
	    <p class="h4 mb-4 font-weight-bold text-center">메뉴 관리</p>
		
		<table class="table border border-dark text-center">
			<thead>
				<tr>
					<th style="width: 10%" class="h6 font-weight-bold">메뉴번호</th>
					<th style="width: *" class="w-auto h6 font-weight-bold">메뉴 이름</th>
					<th style="width: 10%" class="w-5 h6 font-weight-bold">메뉴레벨</th>
					<th style="width: 10%" class="w-5 h6 font-weight-bold">접근권한</th>
					<th style="width: 12%" class="w-20 h6 font-weight-bold">변경</th>
					<th style="width: 12%" class="w-20 h6 font-weight-bold">삭제</th>
				</tr>
			</thead>
			<tbody id="menuTableBody">
				<c:forEach items="${menuListAll }" var="menu" varStatus="i">
					<tr>
						<td class="h6">${menu.menu_id}<input type="hidden" value="${menu.menu_id }"></td>
						<td class="h6 text-left">
							<c:forEach begin="2" end="${menu.menu_level }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
							<c:if test="${menu.menu_level > 1 }">ㄴ</c:if> 
							${menu.menu_name}
						</td>
						<td class="h6">${menu.menu_level }</td>
						<td class="h6">
							 <c:if test="${fn:split(menu.menu_auth,'/')[0] == 'user'}"><p class="text-success">전체</p></c:if> 
							 <c:if test="${fn:split(menu.menu_auth,'/')[0] == 'manager'}"><p class="text-warning">매니저</p></c:if> 
							 <c:if test="${fn:split(menu.menu_auth,'/')[0] == 'admin'}"><p class="text-danger">관리자</p></c:if> 
						</td>
						<td><button type="button" class="btn btn-primary" onclick="modifyMenu(${menu.menu_id})">변경</button></td>
						<td><button type="button" class="btn btn-danger" onclick="deleteMenu(${menu.menu_id}, ${menu.menu_level })">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="panel-footer float-right">
			<button type="button" class="btn btn-primary" onclick="location.href='createMenu.do'">메뉴항목 추가</button>
		</div>
	</div>
</body>
</html>