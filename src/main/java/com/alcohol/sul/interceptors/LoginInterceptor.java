package com.alcohol.sul.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;



public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj = request.getSession().getAttribute("member");
		
		if(obj!=null) {
			return true;
		}
		
		/*
			String isAJAX = request.getHeader("x-requested-with");
			if(isAJAX != null && isAJAX.equalsIgnoreCase("XmlHttpRequest")) { // AJAX를 통해 요청한 경우
				...
			}
		*/
		
		request.setAttribute("message","로그인이 필요합니다.");
		request.setAttribute("url", "/member/login");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		view.forward(request,response);
		
		return false;
	}
}
	