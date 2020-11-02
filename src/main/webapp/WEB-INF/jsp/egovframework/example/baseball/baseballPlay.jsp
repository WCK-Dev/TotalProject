<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	   uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>숫자야구게임 메인페이지</title>
<%@include file="../cmmn/common_top.jsp"%>
<style>
	.wrapper { margin: 20px auto; width: 100%; border: 2px solid black; padding: 15px;}
	
	p { font-size: 1.2em}
	
	#done_msg { margin-top: 50px;}
	
	#baseball_try { width: 95%; margin: 20px auto; }
	
	.bt_user { font-size: 1.4em; font-weight: bold;}
</style>

<script>
	function baseballCheck(baseball_seq) {
		var bt_num = $('#bt_num').val();
		var num = RegExp(/^[1-9]+$/);
		
		if(!num.test(bt_num) || bt_num.length != 3){
			alert("1~9사이의 숫자 3자리로 입력해주세요");
			return false;
		} else if (bt_num[0] == bt_num[1] || bt_num[0] == bt_num[2] || bt_num[1] == bt_num[2]){
			alert("동일한 숫자는 반복될 수 없습니다.");
			return false;
		} else {
			$("#baseballCheckForm").submit();
		}
		
	}
						
</script>

</head>
<body>
	<div class="container">
		<jsp:include page="../cmmn/pageHeader.jsp"></jsp:include>
		<div class="wrapper">
			<h3 class="text-center mt-5 mb-5">숫자야구게임</h3>
			<p class="text-center mt-2 mb-4">
				시스템에서 랜덤한 숫자가 생성되었습니다 !<br>
				
				게임번호는 ${baseball.baseball_seq }입니다.<br>
				
				정답을 맞출 때까지 입력란에 3자리 숫자를 입력해 시도해보세요.<br>
			</p>	
			
			<div class="text-center">
				<c:if test="${baseball.baseball_done == 'N' }">
					<form action="baseballCheck.do" method="post" id="baseballCheckForm" onsubmit="return baseballCheck()" >
						<input type="hidden" name="baseball_seq" value="${baseball.baseball_seq }">
						<input type="text" class="col-2 form-control mt-1" id="bt_num" name="bt_num" style="display: inline;">
						<button class="btn btn-primary my-0 mb-2 ml-3" type="submit" style="display: inline;">확인하기</button>
					</form>
				</c:if>
			</div>
			
			<div id="baseball_try">
				<h3 class="text-center mt-5 mb-5">내 댓글</h3>
				
				<c:forEach items="${baseballTryList}" var="bt" varStatus="i">
				
					<div class="text-right">
						<small style="color: blue">(내 댓글)</small><br>
						<p class="bt_user">${bt.bt_num }</p>
					</div>
					<div class="bt_system">
						<small style="color: red">(시스템)</small><br>
						${bt.bt_num } 은(는) ${bt.bt_strike }스트라이크 ${bt.bt_ball }볼 입니다.<br>
						현재 ${i.index + 1}회 시도하셨습니다.
					</div>
					
					<c:if test="${bt.bt_strike == 3 }">
						<p id="done_msg" class="text-center text-success font-weight-bold">
						축하합니다. ^^<br>
						${i.index + 1 }회 만에 정답을 맞추셨습니다.
						</p>
					</c:if>
				</c:forEach>
			</div>
			
			<div class="text-right">
				<button class="btn btn-primary" onclick="location.href='baseballList.do'">게임 목록으로 돌아가기</button>
			</div>
		</div>
	</div>
</body>
</html>