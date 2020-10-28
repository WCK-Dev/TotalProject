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
<title>유저 조회이력 확인</title>
<%@include file="../cmmn/common_top.jsp"%>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/selectUserLog.js"></script>
</head>
<body>

	<div class="container wrapper">
		
		<!-- Read Modal -->
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
						<div class="form-control text-left" id="b_title">${boardInfo.b_title }</div>
		    
					    <!-- writer -->
					    <div class="text-left mt-3">
					    	<i class="fas fa-user prefix mr-2"></i>
					    	<b id="b_writer">
					    		${boardInfo.b_writer }
						    	<c:if test="${boardInfo.b_modifier != null }">
						    		<span style='color:gray; margin-left: 10px;'>(${boardInfo.b_modifier }가 수정함)</span>
						    	</c:if>
					    	</b>
					    </div>
					    
						<!-- RedDate -->
					    <div class="text-left mt-3">
					    	<i class="fas fa-clock mr-2"></i>
					    	<b id="b_regdate">
					    		<fmt:formatDate value="${boardInfo.b_regdate }" pattern="yyyy-MM-dd"/>
					    		<c:if test="${boardInfo.b_modifydate != null }">
						    		<span style='color:gray; margin-left: 10px;'>(<fmt:formatDate value="${boardInfo.b_modifydate }" pattern="yyyy-MM-dd"/>에 수정됨)</span>
						    	</c:if>
					    	</b>
					    </div>
					    
					    <!-- checkList 항목 -->
					    <div class="text-left mt-3"><i class="fas fa-list"></i> 체크리스트 항목
					    	<div id="c_List">
					    	
					    	</div>
						</div>
						
						<hr>
					    
					    <!-- Comment -->
					    <div class="text-left">
					    	<pre id="b_comment" style="white-space: pre-wrap;">${boardInfo.b_comment }</pre>
					    </div>
						
					</div>	
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" id="cancelBtn" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	
		<div class="text-right">
			${user.user_name }(${user.user_id })님 어서오세요! 
			<button class="btn btn-danger" type="button" onclick="location.href='logout.do'">로그아웃</button>
		</div>
		
		<h2 style="margin-top: 60px; display: inline-block;" class="text-center">유저 조회이력</h2>
		
		<hr>
		
		<h3>${boardInfo.b_seq}. [${boardInfo.b_title }]</h3>
		<input type="hidden" name="b_seq" value="${boardInfo.b_seq }">
		
		<!-- table -->
		<table class="table">
			<thead class="black white-text">
				<tr>
					<th class="text-center" scope="col" width="30%">회원아이디</th>
					<th class="text-center" scope="col" width="12%">조회여부</th>
					<th class="text-center" scope="col">최종 조회일</th>
					<th class="text-center" scope="col">최초 답변일</th>
					<th class="text-center" scope="col">최종 수정일</th>
					<th class="text-center" scope="col" width="18%">체크확인</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${svoList }" var="show">
				<tr>
					<th class="text-center align-middle" scope="row">${show.user_id }</th>
					<td class="text-center align-middle isRead">
						<c:forEach items="${lvoList }" var="log">
							<c:if test="${show.user_id == log.user_id}">
								<span style="color: blue">조회함</span>
							</c:if>
						</c:forEach>
					</td>
					<td class="text-center align-middle readDate">
						<c:forEach items="${lvoList }" var="log">
							<c:if test="${show.user_id == log.user_id}">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${log.l_readdate }"/>
							</c:if>
						</c:forEach>
					</td>
					<td class="text-center align-middle regDate">
						<c:forEach items="${userAnswerList }" var="userAnswer">
							<c:if test="${show.user_id == userAnswer.user_id}">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${userAnswer.a_regdate }"/>
							</c:if>
						</c:forEach>
					</td>
					<td class="text-center align-middle modifyDate">
						<c:forEach items="${userAnswerList }" var="userAnswer">
							<c:if test="${show.user_id == userAnswer.user_id}">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${userAnswer.a_modifydate }"/>
							</c:if>
						</c:forEach>
					</td>
					<td class="text-center align-middle readAnswer">
						<c:forEach items="${userAnswerList }" var="userAnswer">
							<c:if test="${show.user_id == userAnswer.user_id}">
								<button type="button" onclick="readUserAnswer('${userAnswer.user_id}')" class="btn btn-primary" data-toggle="modal" data-target="#selectModal">답변 확인</button>
							</c:if>
						</c:forEach>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- Paging -->
		
		<div class="text-right">
			<button type="button" class="btn btn-dark" onclick="history.back();">이전 페이지</button>
		</div>
	</div>
</body>
</html>