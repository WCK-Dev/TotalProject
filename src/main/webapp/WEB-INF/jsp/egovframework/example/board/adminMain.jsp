<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	* { box-shadow: 0 0!important;}
	.container { width: 100%; margin: 200px auto;}
</style>

<title>관리자 메인</title>
<%@include file="../cmmn/common_top.jsp"%>
</head>
<body>
	<div class="container row wrapper text-center">
    
		<div class="col-lg p-3 display-inlineblock rounded mb-3">
			<div class="border border-light">
				<p class="h4 m-0 py-3 bg-primary text-white"><i class="fas fa-user prefix mr-3"></i>회원관리 & 게시판관리</p>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="location='managementUser.do'">
					회원 관리</button>
				</div>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="location='managementBoard.do'">
	  				게시판 관리</button>
				</div>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="location='checkListAdmin.do'">
	  				체크리스트 관리</button>
				</div>
				<div class="row-sm">
					<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
						onclick="location='managementMenu.do'">
	  				메뉴관리</button>
				</div>
				<div class="row-sm">
			</div>
		</div>
		
		<div style="width: 100%;" class="center-block">
			<button type="button" class="btn btn-danger" onclick="location='boardMain.do'">게시판 메인으로</button>		
		</div>
		
	</div>
</body>
</html>