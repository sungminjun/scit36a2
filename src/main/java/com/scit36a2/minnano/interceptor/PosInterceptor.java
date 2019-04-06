package com.scit36a2.minnano.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PosInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Integer chk = (Integer)session.getAttribute("comp_seq");
		String root = request.getContextPath();
		if ( chk == null ) {
			response.sendRedirect(root + "/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
