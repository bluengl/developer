package com.ngl.project.loginUser.dao;

import com.ngl.project.loginUser.pojo.LoginUserEx;

import java.util.List;

public interface LoginUserDao {

    Integer selectLoginUserByLoginInfoCount(LoginUserEx userEx);

    List<LoginUserEx> selectLoginUserByLoginInfo(LoginUserEx userEx);

    Integer insertDetail(LoginUserEx userEx);

    Integer updateDetail_loginDate(LoginUserEx userEx);

    Integer insertDetail_loginDate(LoginUserEx userEx);

    Integer updateDetail_logoutDate(LoginUserEx userEx);

    List<LoginUserEx> selectLoginUserByUsername(String username);
}
