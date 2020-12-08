package com.ngl.designer.authority.dao;

import com.ngl.designer.authority.pojo.Role;

import java.util.List;

public interface AuthorityDao {
    List<Role> selectRoleByLoginUserId(String loginUserId);
}
