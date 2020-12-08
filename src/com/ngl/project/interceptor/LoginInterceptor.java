package com.ngl.project.interceptor;

import com.ngl.project.loginUser.pojo.LoginUserEx;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static Log logger = LogFactory.getLog(LoginInterceptor.class);

    /**
     * 在请求之前执行
     *
     * @param request
     * @param response
     * @param handler  表示被拦截的请求目标
     * @return false:拦截请求,终止请求 true:继续执行请求
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 设置request编码
        request.setCharacterEncoding("utf-8");
        logger.info("请求地址: " + request.getContextPath() + request.getServletPath());
        // 登录信息校验
        LoginUserEx obj = (LoginUserEx) request.getSession().getAttribute("userInfo");
        if ((obj == null || obj.getLoginStatus() != 1) && response.getStatus() == 200) {
            if ("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
                response.getWriter().write("{\"msg\":\"timeout\"}");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            return false;
        }
        return true;
    }

    /**
     * @param modelAndView 可以对视图进行操作
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("响应状态: " + response.getStatus());
    }

    /**
     * @param ex 异常
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
