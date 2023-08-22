package com.alcohol.sul.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alcohol.sul.member.MemberDTO;

@Component("list")
public class NoticeInterceptors extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		
	}

	//list 제외 모든 기능 관리자만 할 수 있도록
	
	
