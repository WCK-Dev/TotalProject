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

<title>메뉴 설정</title>

<script type="text/javascript">

	function managementBoardKinds(bk_bseq){
		var newwin = window.open("<c:url value='/managementBoardKinds.do?bk_bseq=" + bk_bseq + "' />", "popUpBoard", "width=500, height=500, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
</script>

</head>
<body>
	<div class="container wrapper">
		<c:if test="${mode != 'modify'}">
		    <p class="h4 mt-5 mb-4 font-weight-bold text-center">메뉴 등록</p>
		</c:if>
		<c:if test="${mode == 'modify'}">
		    <p class="h4 mt-5 mb-4 font-weight-bold text-center">메뉴 변경</p>
		</c:if>
		
		<form action="createMenu.do" method="post" onsubmit="">
		<input type="hidden" name="mode" value="${mode }">
		
		<table class="table border border-dark text-center">
			<tr>
				<td><h5>메뉴명</h5></td>
				<td colspan="3"><input type="text" id="menu_name" name="menu_name" maxlength="30" placeholder="새로운 메뉴명을 입력해주세요" class="form-control"></td>
			</tr>
			<tr>
				<td><h5>사용여부</h5></td>
				<td>
					<select name="menu_use_yn" id="menu_use_yn" class="browser-default custom-select">
						<option value="N">사용안함</option>
						<option value="Y">사용함</option>
					</select>
				</td>
				<td><h5>접근권한</h5></td>
				<td>
					<select name="menu_auth" id="menu_auth" class="browser-default custom-select">
						<option value="all">전체</option>
						<option value="manager">매니저</option>
						<option value="admin">관리자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><h5>상위메뉴</h5></td>
				<td>
					<select name="menu_ref" id="menu_ref" class="browser-default custom-select">
						<option value="0">없음</option>
						<c:forEach items="${menuList }" var="menu">
							<option value="${menu.menu_id }">${menu.menu_name }</option>
						</c:forEach>
					</select>
				</td>
				<td><h5>메뉴유형</h5></td>
				<td>
					<select name="menu_type" id="menu_type" class="browser-default custom-select">
						<option value="none">없음</option>
						<option value="board">게시판</option>
						<option value="gallery">갤러리</option>
						<option value="checklist">체크리스트</option>
						<option value="servey">설문조사</option>
						<option value="baseball">야구게임</option>
						<option value="videoboard">동영상 게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><h5>메뉴 설명<h5></td>
				<td colspan="3">
					<textarea class="form-control" style="min-height: 140px"></textarea>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
		
		<div class="panel-footer float-right">
			<button type="submit" class="btn btn-primary">메뉴항목 추가</button>
		</div>
		</form>
	</div>
</body>
</html>