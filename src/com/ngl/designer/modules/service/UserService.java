package com.ngl.designer.modules.service;

import com.ngl.designer.modules.pojo.UserEx;

public interface UserService {
    String selectUserData(Integer page, Integer limit, String username);

    UserEx selectUserInfoById(String userId);

    String selectPerson();

    String selectRole();

    String saveUserInfo(String type, UserEx userEx);

    String deleteUserInfo(String userId);

}
