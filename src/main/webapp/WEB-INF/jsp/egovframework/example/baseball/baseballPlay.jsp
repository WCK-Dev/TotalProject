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
				시스템에서 랜덤한 숫자가 생성되었습니다 !<br>
				
				생성된 숫자는 ${baseballNumber }입니다 ㅎㅎ;
				
				입력란에 3자리 숫자를 입력해, 정답을 맞춰보세요.<br>
				
				<div class="row mx-0">
					<input type="text" class="col-2 form-control mt-1" id="baseball" name="baseball">
					<button class="btn btn-primary my-0 mb-2 ml-3" type="submit">확인하기</button>
				</div>
				
				<div id="baseball_try">
				
				</div>
			</p>
		</div>
	</div>
</body>
</html>