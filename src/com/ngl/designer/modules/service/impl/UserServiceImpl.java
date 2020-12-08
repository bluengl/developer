package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.UserEx;
import com.ngl.designer.modules.service.UserService;
import com.ngl.designer.utils.KeyValueTemplate;
import com.ngl.designer.utils.RandomIdUtil;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SystemDao systemDao;

    @Override
    public String selectUserData(Integer page, Integer limit, String username) {
        HashMap<Object, Object> map = new HashMap<>();
        map.put("username", username);
        Integer start = (page - 1) * limit;
        map.put("start", start);
        map.put("end", start + limit);
        List<UserEx> data = systemDao.selectUserDataByCon(map);
        Long count = systemDao.selectUserDataCountByCon(map);
        TableDataTemplate<UserEx> template = new TableDataTemplate<>(0, "msg", count, data);
        return JSON.toJSONString(template);
    }

    @Override
    public UserEx selectUserInfoById(String userId) {
        List<UserEx> userExes = systemDao.select_login_user_ById(userId);
        try {
            if (userExes.size() != 1) {
                return new UserEx();
            }
            return userExes.get(0);
        } catch (Exception e) {
            return new UserEx();
        }
    }

    @Override
    public String selectPerson() {
        List<KeyValueTemplate> keyValueTemplates = systemDao.selectUserPerson();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectRole() {
        List<KeyValueTemplate> keyValueTemplates = systemDao.selectUserRole();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String saveUserInfo(String type, UserEx userEx) {
        Integer integer = 0;
        if ("1".equals(type)) {
            String userId = RandomIdUtil.byTimestamp("yh");
            userEx.setId(userId);
            integer = systemDao.insert_login_user(userEx);
            integer = systemDao.insert_user_role(userId, userEx.getRole());
        } else if ("2".equals(type)) {
            integer = systemDao.update_user_role(userEx.getId(), userEx.getRole());
            integer = systemDao.update_login_user(userEx);
        }
        return "{\"msg\":\"" + integer + "\"}";
    }

    @Override
    public String deleteUserInfo(String userId) {
        Integer integer = systemDao.delete_login_user_ById(userId);
        return "{\"msg\":\"" + integer + "\"}";
    }
}
