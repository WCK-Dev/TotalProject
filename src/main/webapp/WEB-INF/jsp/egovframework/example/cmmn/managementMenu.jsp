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
<!-- drag&drop JS-->
<script type="text/javascript"src="${pageContext.request.contextPath }/js/jquery.tablednd.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<title>게시판 관리</title>

<script type="text/javascript">

	function managementBoardKinds(bk_bseq){
		var newwin = window.open("<c:url value='/managementBoardKinds.do?bk_bseq=" + bk_bseq + "' />", "popUpBoard", "width=500, height=500, left=500, top=50, scrollbars=1");
		newwin.focus();
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
					<th style="width: 8%" class="w-auto h6 font-weight-bold">메뉴번호</th>
					<th style="width: *" class="w-auto h6 font-weight-bold">메뉴 이름</th>
					<th style="width: 12%" class="w-5 h6 font-weight-bold">메뉴 생성자<br>(수정자)</th>
					<th style="width: 12%" class="w-5 h6 font-weight-bold">메뉴 생성일<br>(수정일)</th>
					<th style="width: 8%" class="w-5 h6 font-weight-bold">사용여부</th>
					<th style="width: 8%" class="w-5 h6 font-weight-bold">메뉴레벨</th>
					<th style="width: 8%" class="w-5 h6 font-weight-bold">상위메뉴</th>
					<th style="width: 8%" class="w-5 h6 font-weight-bold">접근권한</th>
					<th style="width: 8%" class="w-5 h6 font-weight-bold">메뉴유형</th>
					<th style="width: 15%" class="w-20 h6 font-weight-bold">수정/삭제</th>
				</tr>
			</thead>
			<tbody id="menuTableBody">
				<c:forEach items="${menuList }" var="menu" varStatus="i">
					<tr>
						<td class="h6">${menu.menu_id}<input type="hidden" value="${menu.menu_id }"></td>
						<td class="h6">${menu.menu_name}</td>
						<td class="h6">
							${menu.menu_create_user }
							<c:if test="${menu.menu_modify_user != null}"><br>( ${menu.menu_modify_user } )</c:if>
						</td>
						<td class="h6">
							<fmt:formatDate value="${menu.menu_create_dttm }" pattern="yy.MM.dd"/>
							<c:if test="${menu.menu_modify_dttm != null}"><br>( <fmt:formatDate value="${menu.menu_modify_dttm }" pattern="yy.MM.dd"/> )</c:if>
						</td>
						<td class="h6">${menu.menu_use_yn }</td>
						<td class="h6">${menu.menu_level }</td>
						<td class="h6">${menu.menu_ref }</td>
						<td class="h6">${menu.menu_auth }</td>
						<td class="h6">${menu.menu_type }</td>
						<td><button type="button" class="btn btn-primary" onclick="managementBoardKinds(${boardKinds.bk_bseq})">변경</button></td>
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