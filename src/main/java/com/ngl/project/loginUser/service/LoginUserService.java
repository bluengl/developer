package com.ngl.project.loginUser.service;

import com.ngl.project.loginUser.pojo.LoginUserEx;

import javax.servlet.http.HttpSession;

public interface LoginUserService {
    public Boolean validUser(HttpSession session, LoginUserEx user);

    public Boolean noLogoutDeal(HttpSession session);

    public String successful(HttpSession session, LoginUserEx userEx);

    public String loginDeal(HttpSession session);

    public String logoutDeal(HttpSession session);

    public Boolean login(LoginUserEx user);

    public Boolean logout(LoginUserEx user);
}
