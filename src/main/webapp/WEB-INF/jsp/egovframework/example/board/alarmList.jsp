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
<title>알림형 게시판 리스트</title>
<!-- JQuery -->
<script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<script>
$(document).ready(function(){
		
});

function readBoard(b_no, b_writer, b_secret, login_id, b_pwd){
	if(b_secret == 1 && b_writer != login_id && '${sessionScope.user.admin_YN}' == 'N'){
		//확인 윈도우 오픈
		var newwin = window.open("<c:url value='/boardPwdCheck.do' />", "popUpBoard", "width=400, height=250, left=500, top=50, scrollbars=1");
		
		var formObj = $('<form>', {'id': 'formObj' ,'action': 'boardPwdCheck.do', 'method' : 'post', 'target':'popUpBoard'});
		var inpb_no = $('<input>', {'name': 'b_no', 'value': b_no, 'type': 'hidden' });
		var inpb_pwd = $('<input>', {'name': 'b_pwd', 'value': b_pwd, 'type': 'hidden'  });
		
		formObj.append(inpb_no);
		formObj.append(inpb_pwd);
		$(document.body).append(formObj);
		$("#formObj").submit();
		
	} else {
		var newwin = window.open("<c:url value='/readBoard.do' />?b_no="+b_no , "popUpBoard", "width=500, height=900, left=500, top=50, scrollbars=1");
	}
	
	newwin.focus();
}
</script>

</head>
<body>
	<div class="table-responsive">
	  <table class="table">
	  <thead class="table-dark">
	  	<tr>
	        <th width="*"><b>글 제목</b></th>
	        <th class="text-center" width="30%"><b>작성자</b></th>
	        <th class="text-center" width="20%"><b>작성일</b></th>
	    </tr>
	  </thead>
	    <c:forEach var="board" items="${boardList }">
	      <tr class="table-hover">
	      	<td>
	      		<c:if test="${board.bSecret == 1 }">
	        		<div class="badge badge-primary text-wrap">비밀글</div>
	        	</c:if>
	        	<a href="javascript:readBoard(${board.bNo }, '${board.bWriter }', '${board.bSecret }', '${sessionScope.user.user_id }' , '${board.bPwd }');">
		        	<c:forEach begin="2" end="${board.bDepth }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
		        	<c:if test="${board.bDepth > 1 }">RE: </c:if><c:out value="${board.bTitle }" />
		        	<c:if test="${board.bCommentcnt != 0}"> <small class="text-danger">[${board.bCommentcnt }]</small></c:if>
		        </a>	
	      	</td>
	        <td class="text-center"><c:out value="${board.bWriter }" /></td>
	        <td class="text-center"><fmt:formatDate pattern='yyyy-MM-dd' timeZone="UTC" value='${board.bRegdate }'/></td>
	      </tr>
	    </c:forEach>
	  </table>
	</div>
</body>
</html>