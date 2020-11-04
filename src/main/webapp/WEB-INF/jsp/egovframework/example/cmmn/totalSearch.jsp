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
<title>게시판 통합검색</title>
<%@include file="../cmmn/common_top.jsp"%>

<script type="text/javascript"src="${pageContext.request.contextPath }/js/checkListMain.js"></script>
<script>
function readBoard(b_no, b_writer, b_secret, login_id, b_pwd){
	if(b_secret == 1 && b_writer != login_id && '${sessionScope.user.admin_YN}' == 'N'){
		//확인 윈도우 오픈
		var newwin = window.open("<c:url value='/boardPwdCheck.do' />?b_no="+b_no, "popUpBoard", "width=400, height=250, left=500, top=50, scrollbars=1");
		
	} else {
		var newwin = window.open("<c:url value='/readBoard.do' />?b_no="+b_no , "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	}
	
	newwin.focus();
}
</script>
<style>
	.titles { font-size: 1.2em}
</style>
</head>
<body>
	<div class="container wrapper">
	
		<!-- Board Modal -->
		<div class="modal" id="selectModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">체크리스트 상세</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-control text-left" id="b_title"></div>
		    
					    <!-- writer -->
					    <div class="text-left mt-3"><i class="fas fa-user prefix mr-2"></i><b id="b_writer"></b></div>
					    
						<!-- RedDate -->
					    <div class="text-left mt-3"><i class="fas fa-clock mr-2"></i><b id="b_regdate"></b></div>
					    
					    <!-- checkList 항목 -->
					    <div class="text-left mt-3"><i class="fas fa-list"></i> 체크리스트 항목
					    	<div id="c_List">
					    	
					    	</div>
						</div>
						
						<hr>
					    
					    <!-- Comment -->
					    <div class="text-left">
							<pre id="b_comment" style="white-space: pre-wrap;"></pre>
					    </div>
						
					</div>	
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="checkSave()">저장</button>
						<button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	
		<jsp:include page="../cmmn/pageHeader.jsp"></jsp:include>
		
		
		<h3 class="mt-2">[게시판] 검색결과
			<c:if test="${boardSearchCnt != 0 }">
				<small class="text-danger">( ${boardSearchCnt } 개 검색됨 )</small>
			</c:if>
			<c:if test="${boardSearchCnt == 0 }">
				<small class="text-danger">( 검색결과없음 )</small>
			</c:if>
		</h3>
		
		<ul>
			<c:forEach items="${boardKindsList }" var="bk" varStatus="i">
				<c:forEach items="${boardSearchList[i.index] }" var="board" varStatus="bSts" begin="0" end="4">
					<c:if test="${bSts.index == 0}">
						<h4 class="mt-4">[${bk.bk_bname }] 검색 결과  (${fn:length(boardSearchList[i.index])}건)</h4>
					</c:if>
					
					<c:if test="${bk.bk_bseq == board.b_bseq}">
						<li class="mb-3 ml-4">
				        	<c:if test="${board.b_secret == 1 }">
				        		<div class="badge badge-primary text-wrap">비밀글</div>
				        	</c:if>			        	
				        	<a href="javascript:readBoard(${board.b_no }, '${board.b_writer }', '${board.b_secret }', '${sessionScope.user.user_id }' , '${board.b_pwd }');" class="titles">
					        	${board.b_title }<c:if test="${board.b_commentCnt != 0}"> <small class="text-danger">[${board.b_commentCnt }]</small></c:if>
					        </a><br>
					              작성자 : ${board.b_writer } &nbsp;/ &nbsp; 작성일 : <fmt:formatDate value="${board.b_regdate }" pattern="yyyy-MM-dd"/>
						</li>
					</c:if>
				</c:forEach>
			</c:forEach>
		</ul>
		
		<h3 class="mt-5">[갤러리] 검색결과
			<c:if test="${gallerySearchCnt != 0 }">
				<small class="text-danger">( ${gallerySearchCnt } 개 검색됨 )</small>
			</c:if>
			<c:if test="${gallerySearchCnt == 0 }">
				<small class="text-danger">( 검색결과없음 )</small>
			</c:if>
		</h3>
		<ul>
			<c:forEach items="${gallerySearchList }" var="gallery" varStatus="gi">
				<li class="mb-3">
					<a href="readGallery.do?g_seq=${gallery.g_seq }" class="titles">${gallery.g_title }</a><br>
					작성자 : ${gallery.g_writer } &nbsp;/ &nbsp; 작성일 : ${gallery.g_regdate }
				</li>
			</c:forEach>
		</ul>
		<c:if test="${gallerySearchCnt > 10 }">
			<button type="button" class="btn btn-danger" onclick="location.href='galleryMain.do?searchCondition=total&searchKeyword=${searchKeyword }'">갤러리 검색결과 전체보기</button>
		</c:if>
			
		<h3 class="mt-5">[체크리스트] 검색결과
			<c:if test="${checkSearchCnt != 0 }">
				<small class="text-danger">( ${checkSearchCnt } 개 검색됨 )</small><br>
			</c:if>
			<c:if test="${checkSearchCnt == 0 }">
				<small class="text-danger">( 검색결과없음 )</small><br>
			</c:if>
		</h3>
		<ul>
			<c:forEach items="${checkSearchList }" var="check">
				<li class="mb-3">
					<a href='' onclick="openBoardModal('${check.b_seq }')" data-toggle="modal" data-target="#selectModal" class="titles">${check.b_title }</a><br>
					작성자 : ${check.b_writer } &nbsp;/ &nbsp; 작성일 : <fmt:formatDate value="${check.b_regdate }" pattern="yyyy-MM-dd"/>
				</li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>