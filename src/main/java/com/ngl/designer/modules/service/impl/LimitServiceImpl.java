package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.RoleBase;
import com.ngl.designer.modules.service.LimitService;
import com.ngl.designer.utils.KeyValueTemplate;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LimitServiceImpl implements LimitService {

    @Autowired
    private SystemDao systemDao;

    @Override
    public String deleteRoleItem(String id) {
        JSONObject jsonObject = new JSONObject();
        try {
            if (systemDao.delete_limit_role(id) == 1)
                jsonObject.put("msg", "true");
//            else
//                jsonObject.put("msg", "false");
        } catch (Exception e) {
            jsonObject.put("msg", "false");
        }
        return jsonObject.toJSONString();
    }

    @Override
    public String saveRoleData(String table) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", "true");
        JSONArray objects = JSON.parseArray(table);

        for (int i = 0; i < objects.size(); i++) {
            RoleBase roleBase = new RoleBase();
            try {
                JSONObject o = (JSONObject) objects.get(i);
                roleBase.setId((String) o.get("id"));
                roleBase.setName((String) o.get("name"));
                roleBase.setDesc((String) o.get("desc"));
                roleBase.setProject((String) o.get("project"));
                roleBase.setPerson((String) o.get("person"));
                roleBase.setContract((String) o.get("contract"));
                roleBase.setSystem((String) o.get("system"));
            } catch (Exception e) {
                continue;
            }
            Integer integer = systemDao.update_limit_role(roleBase);
            jsonObject.put("msg", integer);
        }

        return jsonObject.toJSONString();
    }

    @Override
    public String selectRoleData(String extra) {
        List<RoleBase> list = systemDao.select_limit_role();
        if (extra != null) {
            RoleBase roleBase = new RoleBase();
            roleBase.setContract("0");
            roleBase.setPerson("0");
            roleBase.setProject("0");
            roleBase.setSystem("0");
            list.add(0, roleBase);
        }
        TableDataTemplate<RoleBase> template = new TableDataTemplate<>(0, "", Long.parseLong(String.valueOf(list.size())), list);
        return JSON.toJSONString(template);
    }

    @Override
    public String selectLoginUser() {
        List<KeyValueTemplate> keyValueTemplates = systemDao.select_limit_loginuser();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectRole() {
        List<KeyValueTemplate> keyValueTemplates = systemDao.select_limit_select_role();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String queryRole(String userId) {
        List<String> strings = systemDao.query_limit_user_role(userId);
        try {
            return strings.get(0);
        } catch (Exception e) {
            return "0";
        }
    }

    @Override
    public String updateUserRole(String loginUserId, String roleId) {
        Integer integer = systemDao.update_limit_user_role(roleId, loginUserId);
        return "{\"mag\":\"" + integer + "\"}";
    }
}
