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
</style>

</head>
<body>
	<div class="container">
		<jsp:include page="../cmmn/pageHeader.jsp"></jsp:include>
		<div class="wrapper">
			<h3 class="text-center mt-2 mb-2">숫자야구게임</h3>
			<p>
				숫자 야구 게임이란 2명이 서로가 생각한 숫자를 맞추는 게임입니다.<br>
				각자 서로 다른 1~9까지 3자리 임의의 숫자를 정한 뒤 서로에게 3자리의 숫자를 불러서 결과를 확인합니다.<br>
				그리고 그 결과를 토대로 상대가 정한 숫자를 예상한 뒤 맞힙니다.<br>
				* 숫자는 맞지만, 위치가 틀렸을 때는 볼<br>
				* 숫자와 위치가 모두 맞을 때는 스트라이크<br><br>
				예를 들어, 아래의 경우가 있으면<br><br>
				
				<small>
					A : 123<br>
					B : 1스트라이크 1볼.<br>
					A : 356<br>
					B : 1스트라이크 0볼.<br>
					A : 327<br>
					B : 2스트라이크 0볼.<br>
					A : 489<br>
					B : 0스트라이크 1볼.<br><br>
				</small>
				
				이때 가능한 답은 324와 328 두 가지입니다.<br><br>
		
				<h3>제한사항</h3><br>
				질문의 수는 1 이상 100 이하의 자연수입니다.baseball의 각 행은 [세 자리의 수, 스트라이크의 수, 볼의 수] 를 담고 있습니다.
				
				<br><br><br>
				
				<h4>숫자 야구게임을 시작하여 정답을 맞추고, 몇회만에 정답을 맞출 수 있는지 기록을 채점해보세요</h4>
			</p>
			<button class="btn btn-primary btn-block" onclick="location.href='insertBaseball.do'">숫자 야구게임 시작</button>
		</div>
	</div>
</body>
</html>