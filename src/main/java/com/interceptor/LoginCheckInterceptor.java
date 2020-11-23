package com.interceptor;

import java.util.Collection;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	/* filter VS interceptor
	 * filter는 웹 어플리케이션 내에서 동작하기 때문에 Spring Context에 접근이 어려움(주로 인코딩 등에 사용)
	 * 반면에 interceptor는 Spring 영역 내에서 동작하기 때문에 Spring Context에 접근이 용이(주로 세션, 쿠키, 검증 등에 사용)
	 * 흐름 정리 : Request -> Servlet Filter -> Dispatcher Servlet -> HandlerInterceptor -> Controller
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception { 
		//지정된 컨트롤러의 동작 이전에 수행할 동작(preHandle)
		System.out.println("@@preHandle 동작@@");
		HttpSession session = request.getSession();
		if(session.getAttribute("login") == null) { //로그인 검사
			response.sendRedirect("../loginForm?mesg=Login plz"); //servlet-context.xml에서 매핑 
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// view 렌더링 전에 postHandle 호출
		// ModelAndView 인자를 이용, view Model 조작 가능
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//view 렌더링 후 호출되는 메소드 컨트롤러 진입 후
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
