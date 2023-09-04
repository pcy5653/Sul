package com.alcohol.sul.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alcohol.sul.member.MemberDTO;



public class RoleInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		int role = memberDTO.getRoleNum();
		
		if(role==1) {
			return true;
		}
		request.setAttribute("message","권한이 없습니다.");
		request.setAttribute("url", "/member/mypage");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/result.jsp");
		view.forward(request,response);
		return false;
			
		
		
	}
}
	