package com.ngl.project.loginUser.service.impl;

import com.ngl.designer.authority.dao.AuthorityDao;
import com.ngl.project.exception.LoginException;
import com.ngl.project.loginUser.dao.LoginUserDao;
import com.ngl.project.loginUser.pojo.LoginUserEx;
import com.ngl.project.loginUser.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service("loginUserService")
public class LoginUserServiceImpl implements LoginUserService {

    @Autowired
    private LoginUserDao loginUserDao;

    @Autowired
    private AuthorityDao authorityDao;

    @Override
    public Boolean validUser(HttpSession session, LoginUserEx user) {
        noLogoutDeal(session);

        Integer result = loginUserDao.selectLoginUserByLoginInfoCount(user);

        if (result != 1) {
            return false;
        } else {
            successful(session, user);
            return true;
        }
    }

    @Override
    public Boolean noLogoutDeal(HttpSession session) {
        try {
            LoginUserEx obj = (LoginUserEx) session.getAttribute("userInfo");
            if (obj.getLoginStatus() == 1) {
                new LoginException(obj.getUsername() + " 未正常注销");
                session.removeAttribute("userInfo");
            }
        } catch (Exception e) {
            new LoginException("初始登录状态");
        } finally {
            return true;
        }
    }

    @Override
    public String successful(HttpSession session, LoginUserEx userEx) {
        List<LoginUserEx> loginUserExes = loginUserDao.selectLoginUserByLoginInfo(userEx);
        LoginUserEx loginUserEx = loginUserExes.get(0);
        loginUserEx.setLoginStatus(1);
        session.setAttribute("userInfo", loginUserEx);
        login(loginUserEx);
        return "存入session";
    }

    @Override
    public String loginDeal(HttpSession session) {
        try {
            LoginUserEx obj = (LoginUserEx) session.getAttribute("userInfo");
            if (obj.getLoginStatus() != 1) {
                new LoginException(obj.getUsername() + " 登录身份失效");
                return "redirect:/index.jsp";
            } else {
                return "index";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/index.jsp";
        }
    }

    @Override
    public String logoutDeal(HttpSession session) {
        LoginUserEx userEx = (LoginUserEx) session.getAttribute("userInfo");
        logout(userEx);
        try {
            userEx.setLoginStatus(0);
            session.setAttribute("userInfo", userEx);
        } catch (Exception e) {
            return "0";
        }
        return "loginStatus已更改";
    }

    @Override
    public Boolean login(LoginUserEx user) {
        if (loginUserDao.updateDetail_loginDate(user) == 1) {
            return true;
        } else {
            loginUserDao.insertDetail_loginDate(user);
            return false;
        }
    }

    @Override
    public Boolean logout(LoginUserEx user) {
        if (loginUserDao.updateDetail_logoutDate(user) == 1) {
            return true;
        } else {
            return false;
        }
    }
}
