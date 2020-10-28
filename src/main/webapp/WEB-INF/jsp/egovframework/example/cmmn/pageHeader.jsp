<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
    
<a href="boardMain.do"><h1>eGov Board 메인</h1></a>
<!-- 유저정보 영역 -->
<div class="panel-heading text-right">
	${sessionScope.user.user_name }(${sessionScope.user.user_id })님 환영합니다.
	<button type="button" class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
	<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' && sessionScope.user.admin_YN == 'Y' }">
		<button type="button" class="btn btn-primary" onclick="location.href='adminMain.do'">관리자 페이지</button>
	</c:if>
</div>
<!-- 게시판 리스트 영역 -->
<div class="mt-3 mb-2">
	<c:forEach items="${boardKindsList }" var="boardKinds">
		<a href='boardList.do?b_bseq=${boardKinds.bkBseq }'><b>${boardKinds.bkBname }</b> &nbsp;&nbsp;&nbsp;</a>
	</c:forEach>
	<a href='galleryMain.do'><b>갤러리</b> &nbsp;&nbsp;&nbsp;</a>
	<a href='checkListMain.do'><b>체크리스트</b> &nbsp;&nbsp;&nbsp;</a>
</div>

<hr>