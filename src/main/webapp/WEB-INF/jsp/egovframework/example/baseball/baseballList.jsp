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
<style>
	.baseballList { cursor: pointer;}
</style>

<script>
if('${baseballErrMsg}' == 'true'){
	alert("존재하지 않거나, 접근권한이 없는 게임 번호입니다.");
}
</script>
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
					<th class="text-center" scope="col">게임완료여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${baseballList}" var="baseball" varStatus="i">
					<tr onclick="location.href='baseballPlay.do?baseball_seq=${baseball.baseball_seq}'" class="baseballList">
						<th class="text-center" scope="row">${baseball.baseball_seq }</th>
						<td class="text-center">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${baseball.baseball_regdate }"/>
						</td>
						<td class="text-center">
							<c:if test="${baseball.baseball_done == 'Y' }">
								<b class="text-primary">완료</b>
							</c:if>
							<c:if test="${baseball.baseball_done == 'N' }">
								<b class="text-danger">미완료</b>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="panel-footer float-right">
			<button type="button" class="btn btn-primary" onclick="location.href='baseballMain.do'">숫자야구게임 생성</button>
		</div>
		
	</div>
</body>
</html>