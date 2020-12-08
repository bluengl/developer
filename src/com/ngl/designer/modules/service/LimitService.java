package com.ngl.designer.modules.service;

public interface LimitService {

    String deleteRoleItem(String id);

    String saveRoleData(String table);

    String selectRoleData(String extra);

    String selectLoginUser();

    String selectRole();

    String queryRole(String userId);

    String updateUserRole(String loginUserId, String roleId);

}
