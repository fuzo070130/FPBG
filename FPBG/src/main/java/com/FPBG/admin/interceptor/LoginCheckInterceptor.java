package com.FPBG.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);
			
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		StringBuffer url = request.getRequestURL();
		
		logger.debug("LoginCheckInterceptor - postHandle url : " + url);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		logger.debug("LoginCheckInterceptor - preHandle ");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("vo") == null){
			response.sendRedirect("/FPBG");
		}
		
		return super.preHandle(request, response, handler);
	}

}
