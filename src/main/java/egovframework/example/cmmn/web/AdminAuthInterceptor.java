package egovframework.example.cmmn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.example.board.service.UserVO;

public class AdminAuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("user");
		
		if(obj == null || ((UserVO)obj).getUser_id().equals("") ||  !((UserVO)obj).getAdmin_YN().equals("Y")) { 
			response.sendRedirect("/TotalProject/boardMain.do");
			return false;
			
		}
		return true;
	}
}
