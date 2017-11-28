package com.FPBG.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.FPBG.domain.vo.MemberVO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(HandlerInterceptorAdapter.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("vo") == null){
			response.sendRedirect("/FPBG");
		} else {
			MemberVO vo = (MemberVO) session.getAttribute("vo");
			String memNickName = vo.getMemNickName();
			
			if(memNickName.equals("이준수") || memNickName.equals("김민")) {
				logger.info(memNickName + " 접속 ... ");
			} else {
				response.sendRedirect("/FPBG");
			}
		}
		
		
		return super.preHandle(request, response, handler);
	}

}
