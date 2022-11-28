package kr.co.hta.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.MethodParameter;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.hta.annotation.LoginUser;


public class LoginCheckInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		boolean isLoginRequired = false; 		
		MethodParameter[] parameters = handlerMethod.getMethodParameters();
		for (MethodParameter parameter : parameters) {
			LoginUser loginUser = parameter.getParameterAnnotation(LoginUser.class);
			if (loginUser != null) {
				isLoginRequired = true;
				break;
			}
		}
		
		if (!isLoginRequired) {
			return true;
		}
		if (request.getSession().getAttribute("LOGIN_USER") != null) {
			return true;
		}
		
		response.sendRedirect("/login?fail=deny");
		return false;
	}
}

