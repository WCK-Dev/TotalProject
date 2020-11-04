<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function checkKeyword(){
	var searchKeyword = $("#searchKeyword").val();
	
	if(searchKeyword == '' || searchKeyword.trim() == '') {
		alert("검색어를 입력해주세요.");
		return false;
	}
}
</script>
    
<a href="boardMain.do"><h1 style="display: inline;">eGov Board 메인</h1></a>

<!-- 유저정보 영역 -->
<div class="panel-heading text-right mb-3" style="float: right">
	${sessionScope.user.user_name }(${sessionScope.user.user_id })님 환영합니다.
	<button type="button" class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
	<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' && sessionScope.user.admin_YN == 'Y' }">
		<button type="button" class="btn btn-primary" onclick="location.href='adminMain.do'">관리자 페이지</button>
	</c:if>
</div>

<!-- 통합검색 영역 -->
<form action="totalSearch.do" method="get" id="totalSearchForm" name="totalSearchForm" style="clear:both;" onsubmit="return checkKeyword()">
   <div class="form-group row">
    <label for="searchKeyword" class="col-sm-2 col-form-label col-form-label-lg">게시판 통합검색</label>
    <div class="col-sm-8">
      <input type="text" class="form-control form-control-lg" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력해주세요" value="${searchKeyword }">
    </div>
      <button type="submit" class="btn btn-primary">통합검색</button>
  </div>
</form>

<!-- 게시판 리스트 영역 -->
<div class="mt-4 mb-2">
	<c:forEach items="${boardKindsList }" var="boardKinds">
		<a href='boardList.do?b_bseq=${boardKinds.bk_bseq }'><b>${boardKinds.bk_bname }</b> &nbsp;&nbsp;&nbsp;</a>
	</c:forEach>
	<a href='serveyList.do'><b>설문조사</b> &nbsp;&nbsp;&nbsp;</a>
	<a href='galleryMain.do'><b>갤러리</b> &nbsp;&nbsp;&nbsp;</a>
	<c:if test="${sessionScope.user.admin_YN != 'Y' }">
		<a href='checkListMain.do'><b>체크리스트</b> &nbsp;&nbsp;&nbsp;</a>
	</c:if>
	<a href='baseballList.do'><b>숫자야구게임</b> &nbsp;&nbsp;&nbsp;</a>
	
</div>

<hr>