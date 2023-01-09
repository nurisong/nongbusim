package com.kh.nbs.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws IOException {
			HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { 
			return true;
		} else { 
			session.setAttribute("alertMsg", "로그인을 해야 사용할 수 있는 기능입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}

}
