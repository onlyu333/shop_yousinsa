package com.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODOAuto-generated method stub
		// 로그인을 안한경우는 로그인을 하도록 한다./글쓰기,글자세히 보기는 로그인을
		// 해야한다.세션 검사후 클라이언트마다 세션이 있다 클라이 언트가 보낸 쿠키의 아이디와 일치하는 세션의 객체를 가져와라
		
		HttpSession session = request.getSession();
		// 가져온세견에서 login 변수를 찾아서 리턴 받아라 그런데 login 변수의 리턴타입을 모르니 모든 변수의 최상위 오브젝트로 받음

		Object obj = session.getAttribute("login");
		if (obj == null) {
			System.out.println(obj);
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PostHandle start");
		System.out.println("PostHandle end");
		super.postHandle(request, response, handler, modelAndView);
	}

}