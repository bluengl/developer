package com.ngl.project.loginUser.pojo;

import com.ngl.designer.authority.pojo.Role;

import java.util.List;

public class LoginUserEx extends LoginUserBase {
    private Integer loginStatus;
    private String realUserId;
    private String realUsername;
    private List<Role> roles;

    public Integer getLoginStatus() {
        return loginStatus;
    }

    public void setLoginStatus(Integer loginStatus) {
        this.loginStatus = loginStatus;
    }

    public String getRealUserId() {
        return realUserId;
    }

    public void setRealUserId(String realUserId) {
        this.realUserId = realUserId;
    }

    public String getRealUsername() {
        return realUsername;
    }

    public void setRealUsername(String realUsername) {
        this.realUsername = realUsername;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
