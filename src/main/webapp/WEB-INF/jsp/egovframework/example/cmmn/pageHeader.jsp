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
	<c:if test= "${sessionScope.user.user_id != null && sessionScope.user.user_id != '' && sessionScope.user.user_roll == 'admin' }">
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

<!-- 메뉴 리스트 영역 -->
<div class="mt-4 mb-2">
	<c:forEach items="${showMenuList }" var="menu">
		<c:if test="${menu.menu_level == 1 }">
			<div class="btn-group">
			  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" onclick="location.href='${menu.menu_url}'">
			   	${menu.menu_name }
			  </button>
			  <div class="dropdown-menu">
				<c:forEach items="${showMenuList }" var="menu2">
			    	<c:if test="${(menu2.menu_depth1 == menu.menu_id )&& menu2.menu_level != 1}">
				    <a class="dropdown-item" href="${menu2.menu_url }">
				    	<c:forEach begin="3" end="${menu2.menu_level }">&nbsp;&nbsp;</c:forEach>
						<c:if test="${menu2.menu_level > 2 }">└</c:if> 
				    	${menu2.menu_name }
				    </a>
                   	</c:if>
			  </c:forEach>
			  </div>
			</div>
		</c:if>
	</c:forEach>
</div>

<hr>