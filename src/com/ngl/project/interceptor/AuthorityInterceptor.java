package com.ngl.project.interceptor;

import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.RoleBase;
import com.ngl.project.loginUser.pojo.LoginUserEx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class AuthorityInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private SystemDao systemDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 设置request编码
        request.setCharacterEncoding("utf-8");

        LoginUserEx obj = (LoginUserEx) request.getSession().getAttribute("userInfo");

        try {
            int flag = 1;
            RoleBase roleBase = new RoleBase();
            List<RoleBase> list = systemDao.select_system_limit_role(obj.getUserId());
            RoleBase roleBase1 = list.get(0);
            String servletPath = request.getServletPath();
            if (servletPath.contains("projectMg")) {
                if ("0".equals(roleBase1.getProject())) {
                    flag = 0;
                }
            } else if (servletPath.contains("personMg")) {
                if ("0".equals(roleBase1.getPerson())) {
                    flag = 0;
                }
            } else if (servletPath.contains("contractMg")) {
                if ("0".equals(roleBase1.getContract())) {
                    flag = 0;
                }
            } else if (servletPath.contains("systemMg")) {
                if ("0".equals(roleBase1.getSystem())) {
                    flag = 0;
                }
            }
            if (flag == 0) {
                if ("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
                    response.getWriter().write("{\"msg\":\"timeout\"}");
                } else {
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
                return false;
            }
            System.out.println(servletPath);
        } catch (Exception e) {
            if ("XMLHttpRequest".equals(request.getHeader("x-requested-with"))) {
                response.getWriter().write("{\"msg\":\"timeout\"}");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }
            return false;
        }
        return true;
    }
}
