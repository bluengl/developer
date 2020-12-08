package com.ngl.project.controller;

import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.RoleBase;
import com.ngl.designer.modules.service.LimitService;
import com.ngl.project.loginUser.pojo.LoginUserEx;
import com.ngl.project.loginUser.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private LoginUserService loginUserService;

    @Autowired
    private SystemDao systemDao;

    // 登录验证
    @RequestMapping("loginCheck.do")
    public String loginCheck(LoginUserEx userEx, HttpSession session) {
        if (loginUserService.validUser(session, userEx)) {
            session.removeAttribute("errorMsg");
            return "redirect:loginSuccess.do";
        } else {
            session.setAttribute("errorMsg", "用户名或密码错误！");
            return "../../index";
        }
    }

    // 登录验证成功
    @RequestMapping("loginSuccess.do")
    public ModelAndView loginSuccess(LoginUserEx userEx, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");

        LoginUserEx userInfo = (LoginUserEx) session.getAttribute("userInfo");

        try {
            RoleBase roleBase = new RoleBase();
            List<RoleBase> list = systemDao.select_system_limit_role(userInfo.getUserId());
            modelAndView.addObject("limitList", list.get(0));
        } catch (Exception e) {

        }
        return modelAndView;
//        return loginUserService.loginDeal(session);
    }

    // 注销登录
    @RequestMapping("logout.do")
    public String logout(HttpSession session) {
        loginUserService.logoutDeal(session);
        return "../../index";
    }

    @RequestMapping("limitCheck.do")
    public void limitCheck(HttpSession session, HttpServletResponse response) throws IOException {
        response.getWriter().print("aqw");
    }

}
