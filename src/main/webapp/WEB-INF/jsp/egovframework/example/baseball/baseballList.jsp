<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="ui"     	uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 메인</title>
<%@include file="../cmmn/common_top.jsp"%>

<script type="text/javascript"src="${pageContext.request.contextPath }/js/checkListMain.js"></script>
</head>
<body>

	<div class="container wrapper">
	
		<jsp:include page="../cmmn/pageHeader.jsp"></jsp:include>
		
		<h2 style="margin-top: 60px; display: inline-block;">${user.user_id }님의 숫자야구 플레이리스트</h2>
		
		<!-- table -->
		<table class="table">
			<thead class="black white-text">
				<tr>
					<th class="text-center" scope="col">게임번호</th>
					<th class="text-center" scope="col">게임생성날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="text-center" scope="row">1</th>
					<td class="text-center">
						2020-10-29
						<%-- <fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate }"/> --%>
					</td>
				</tr>
			</tbody>
		</table>
		
		<div class="panel-footer float-right">
			<button type="button" class="btn btn-primary" onclick="location.href='baseballMain.do'">숫자야구게임 생성</button>
		</div>
		
	</div>
	
</body>
</html>