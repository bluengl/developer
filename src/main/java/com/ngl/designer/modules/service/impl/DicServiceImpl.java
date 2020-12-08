package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.DictionaryBase;
import com.ngl.designer.modules.service.DicService;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DicServiceImpl implements DicService {

    @Autowired
    private SystemDao systemDao;

    @Override
    public String getDicDataByType(String type) {
        List<DictionaryBase> list = new ArrayList<>();
        if (type == null || "".equals(type)) {

        } else if ("1".equals(type)) {
            list = systemDao.select_dic_comp_dept_comp();
        } else if ("2".equals(type)) {
            list = systemDao.select_dic_comp_dept_dept();
        } else if ("3".equals(type)) {
            list = systemDao.select_dic_unit();
        } else if ("4".equals(type)) {
            list = systemDao.select_dic_mod_project_view();
        } else if ("5".equals(type)) {
            list = systemDao.select_dic_mod_project_status();
        } else if ("6".equals(type)) {
            list = systemDao.select_dic_mod_person_sex();
        } else if ("7".equals(type)) {
            list = systemDao.select_dic_mod_person_position();
        } else if ("8".equals(type)) {
            list = systemDao.select_dic_buildtounit();
        }
        DictionaryBase dictionaryBase = new DictionaryBase();
        dictionaryBase.setId("");
        dictionaryBase.setName("");
        dictionaryBase.setDesc("");
        list.add(0, dictionaryBase);
        TableDataTemplate<DictionaryBase> template = new TableDataTemplate<>(0, "", Long.parseLong(String.valueOf(list.size())), list);
        return JSON.toJSONString(template);
    }

    @Override
    public String saveDicDataByType(String type, String data) {
        JSONObject jsonObject = new JSONObject();
        JSONArray objects = JSON.parseArray(data);

        for (int i = 0; i < objects.size(); i++) {
            DictionaryBase dictionaryBase = new DictionaryBase();
            try {
                JSONObject o = (JSONObject) objects.get(i);
                dictionaryBase.setId((String) o.get("id"));
                dictionaryBase.setName((String) o.get("name"));
                try{
                    String a = (String) o.get("desc");
                    if(a.equals("")){ }
                    dictionaryBase.setDesc(a);
                } catch (Exception e) {
                    dictionaryBase.setDesc("");
                }
            } catch (Exception e) {
                continue;
            }
            if (dictionaryBase.isEmpty()) {
                continue;
            }
            if (type == null || "".equals(type)) {
                jsonObject.put("msg", false);
                return jsonObject.toJSONString();
            } else if ("1".equals(type)) {
                systemDao.update_dic_comp_dept_comp(dictionaryBase);
            } else if ("2".equals(type)) {
                systemDao.update_dic_comp_dept_dept(dictionaryBase);
            } else if ("3".equals(type)) {
                systemDao.update_dic_unit(dictionaryBase);
            } else if ("4".equals(type)) {
                systemDao.update_dic_mod_project_view(dictionaryBase);
            } else if ("5".equals(type)) {
                systemDao.update_dic_mod_project_status(dictionaryBase);
            } else if ("6".equals(type)) {
                systemDao.update_dic_mod_person_sex(dictionaryBase);
            } else if ("7".equals(type)) {
                systemDao.update_dic_mod_person_position(dictionaryBase);
            } else if ("8".equals(type)) {
                systemDao.update_dic_buildtounit(dictionaryBase);
            }
        }
        jsonObject.put("msg", true);
        return jsonObject.toJSONString();
    }

    @Override
    public String deleteDicItemByType(String type, String id) {
        JSONObject jsonObject = new JSONObject();
        if (type == null || "".equals(type)) {
            jsonObject.put("msg", false);
            return jsonObject.toJSONString();
        } else if ("1".equals(type)) {
            systemDao.delete_dic_comp_dept_comp(id);
        } else if ("2".equals(type)) {
            systemDao.delete_dic_comp_dept_dept(id);
        } else if ("3".equals(type)) {
            systemDao.delete_dic_unit(id);
        } else if ("4".equals(type)) {
            systemDao.delete_dic_mod_project_view(id);
        } else if ("5".equals(type)) {
            systemDao.delete_dic_mod_project_status(id);
        } else if ("6".equals(type)) {
            systemDao.delete_dic_mod_person_sex(id);
        } else if ("7".equals(type)) {
            systemDao.delete_dic_mod_person_position(id);
        } else if ("8".equals(type)) {
            systemDao.delete_dic_buildtounit(id);
        }
        jsonObject.put("msg", true);
        return jsonObject.toJSONString();
    }
}
