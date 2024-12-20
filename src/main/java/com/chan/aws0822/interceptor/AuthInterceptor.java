package com.chan.aws0822.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{ //인증 인터셉터 로그인유무
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception { 
		// 가상경로에 해당하는 메소드 접근전에 가로채기
		
		HttpSession session = request.getSession();
		//System.out.println("인터셉터에서 midx값 : "+session);
		
		if(session.getAttribute("midx") == null) {
			//로그인이 안되어 있으면 이동할려고 하는 주소를 보관하고 로그인 페이지로 보낸다
			
			saveUrl(request);  //이동할 경로를 저장한다
			
			response.sendRedirect(request.getContextPath() + "/member/memberLogin.aws");
			
			return false;			
			
		}else {
			return true;
		}
	}

	
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		
		
		
		
	}
	
	
	public void saveUrl(HttpServletRequest request) {
		
		String uri = request.getRequestURI(); //전체경로 주소
		String param = request.getQueryString();	//파라미터를 가져온다
		
		if(param == null || param.equals("null") || param.equals("")) {
			param = "";
			
		}else {
			param = "?"+param;
			
		}
		//이동할 페이지
		String locationUrl = uri+param;
		//System.out.println("aaaaaaa"+locationUrl);
		HttpSession session = request.getSession();
		if(request.getMethod().equals("GET")) { //대문자GET
			
			session.setAttribute("saveUrl", locationUrl);			
			
		}
		
	}
	

}
