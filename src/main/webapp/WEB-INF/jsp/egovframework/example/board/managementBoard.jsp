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

	$(function(){ 
		$("#bkTableBody").tableDnD(); 
	});

	function newBoardKinds(){
		var newwin = window.open("<c:url value='/newBoardKinds.do' />", "popUpBoard", "width=500, height=500, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
	
	function managementBoardKinds(bk_bseq){
		var newwin = window.open("<c:url value='/managementBoardKinds.do?bk_bseq=" + bk_bseq + "' />", "popUpBoard", "width=500, height=500, left=500, top=50, scrollbars=1");
		newwin.focus();
	}
	
	function reOrderBoardKinds() {
		location.href = "reOrderBoardKinds.do";
	}
	
	function reOrder(){
		
		$(".orderChageValue").each(function(index, item) {
			var bk_order = index + 1;
			var bk_bseq = item.lastChild.value;
			
			
			
			$.ajax({
				type : 'POST',
				url : "<c:url value='/reOrderBoardKinds.do'/>",
				dataType : "text",
				data : {"bk_bseq" : bk_bseq,
						"bk_order": bk_order
						},
				
				success : function (result) {
					resultCnt++;
					console.log("result="+resultCnt);
				}
			});
		});
		
		
		alert("게시판 노출순서가 변경되었습니다.")
		location.reload();
	}
		
</script>

</head>
<body>
	<div class="container wrapper">
		<p class="h2 mb-4 text-center"><a href="adminMain.do">Admin Main</a></p>
	    <p class="h4 mb-4 font-weight-bold text-center">게시판 관리</p>
		
		<table class="table border border-dark text-center">
			<thead>
				<tr>
					<th style="width: *" class="w-auto h6 font-weight-bold">게시판 이름</th>
					<th style="width: 15%" class="w-5 h6 font-weight-bold">게시판 타입</th>
					<th style="width: 12%" class="w-5 h6 font-weight-bold">답글</th>
					<th style="width: 12%" class="w-5 h6 font-weight-bold">댓글</th>
					<th style="width: 12%" class="w-5 h6 font-weight-bold">비밀글</th>
					<th style="width: 15%" class="w-20 h6 font-weight-bold">수정/삭제</th>
				</tr>
			</thead>
			<tbody id="bkTableBody">
				<c:forEach items="${boardKindsList }" var="boardKinds" varStatus="i">
					<tr>
						<td class="h6 orderChageValue">${boardKinds.bkBname}<input type="hidden" value="${boardKinds.bkBseq }"></td>
						<td class="h6">
							<c:if test="${boardKinds.bkType == 0}">일반형</c:if>
							<c:if test="${boardKinds.bkType == 1}">알림형</c:if>
						</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBreplyYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBreplyYn == 'N'}">비허용</c:if>
						</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBcommentYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBcommentYn == 'N'}">비허용</c:if>
						</td>
						<td class="h6">
							<c:if test="${boardKinds.bkBsecretYn == 'Y'}">허용</c:if>
							<c:if test="${boardKinds.bkBsecretYn == 'N'}">비허용</c:if>
						</td>
						<td><button type="button" class="btn btn-primary" onclick="managementBoardKinds(${boardKinds.bkBseq})">변경</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="panel-footer float-right">
			<small style="color: red">드래그&드랍으로 순서를 결정하고 변경버튼을 눌러주세요.</small>
			<button type="button" class="btn btn-primary" onclick="reOrder()">노출순서 변경</button>
			<button type="button" class="btn btn-primary" onclick="newBoardKinds()">게시판 추가</button>
		</div>
	</div>
</body>
</html>