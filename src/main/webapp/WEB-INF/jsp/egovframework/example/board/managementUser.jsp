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

<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<title>회원 관리</title>

<script type="text/javascript">
	function updateUser(user_id){
		var newwin = window.open("<c:url value='/updateUser.do?user_id=" + user_id + "' />", "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
	
	/* pagination 페이지 링크 function */
	function fn_link_page(pageNo){
		document.userListForm.pageIndex.value = pageNo;
		document.userListForm.action = "<c:url value='/managementUser.do'/>";
	   	document.userListForm.submit();
	}
</script>

</head>
<body>
	<div class="container wrapper">
		<p class="h2 mb-4 text-center"><a href="adminMain.do">Admin Main</a></p>
	    <p class="h4 mb-4 font-weight-bold text-center">유저 조회</p>
		
		<form class="form-inline" id="userListForm" name="userListForm" action="managementUser.do" method="post">
		<div>
			<select name="searchCondition" class="browser-default custom-select mr-2 mb-2 form-inline">
				<option value="0" <c:if test="${user.searchCondition=='0' || user.searchCondition=='' }">selected</c:if>>회원 아이디</option>
				<option value="1" <c:if test="${user.searchCondition=='1'}">selected</c:if>>회원 이름</option>
			</select>
		  	<input type="text" class="form-control" name="searchKeyword" value="${user.searchKeyword}">
			<button type="submit" class="btn btn-primary">검색</button>
		</div>
		
		<table class="table border border-dark text-center">
			<thead>
				<tr>
					<th class="w-auto"><i class="fas fa-check ml-1" ></i></th>
					<th class="w-50 h4 font-weight-bold">아이디</th>
					<th class="w-25 h4 font-weight-bold">이름</th>
					<th class="w-25 h4 font-weight-bold">유저 권한</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList }" var="user">
					<tr>
						<td class="h5"></td>
						<td class="h5">${user.userId}</td>
						<td class="h5">${user.userName }</td>
						<td><button type="button" class="btn btn-primary" onclick="updateUser('${user.userId}')">권한 수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="text-right" style="width: 100%">
			전체 회원 수 : ${paginationInfo.totalRecordCount } 명
		</div>
		
		<ul class="pagination" style="width: 100%; text-align:center;">
	    	<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
	    </ul>
		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
		</form>
	</div>
</body>
</html>