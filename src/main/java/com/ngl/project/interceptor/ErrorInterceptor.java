package com.ngl.project.interceptor;

import org.springframework.messaging.handler.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ErrorInterceptor extends HandlerInterceptorAdapter {

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        if (response.getStatus() == 200) {
            response.sendRedirect(request.getContextPath() + "/errorPage/500.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/errorPage/404.jsp");
        }
    }
}
