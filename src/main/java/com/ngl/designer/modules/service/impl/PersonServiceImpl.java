package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.ngl.designer.modules.dao.PersonDao;
import com.ngl.designer.modules.pojo.PersonEx;
import com.ngl.designer.modules.pojo.PersonInterface;
import com.ngl.designer.modules.service.PersonService;
import com.ngl.designer.utils.KeyValueTemplate;
import com.ngl.designer.utils.MyDateFormat;
import com.ngl.designer.utils.RandomIdUtil;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    private PersonDao personDao;

    @Override
    public String selectPersonItem(Integer page, Integer limit, String personId, String personName) {
        HashMap<Object, Object> map = new HashMap<>();
        PersonEx personEx = new PersonEx();
        personEx.setId(personId);
        personEx.setName(personName);
        map.put("personInfo", personEx);
        Integer start = (page - 1) * limit;
        map.put("start", start);
        map.put("end", start + limit);
        List<PersonEx> data = personDao.select_person_byCon(map);
        Long count = personDao.select_person_count_byCon(map);
        TableDataTemplate<PersonEx> template = new TableDataTemplate<>(0, "msg", count, data);
        return JSON.toJSONString(template);
    }

    @Override
    public String savePersonInfo(int type, PersonEx personEx) {
        Integer integer = 1;
        if (type == 1) {
            personEx.setId(RandomIdUtil.byTimestamp("ry"));
            integer = personDao.insert_person(personEx);
            if (!"".equals(personEx.getProject()) && integer == 1) {
                integer = personDao.insert_project_participant(personEx.getId(), personEx.getProject());
            }
        }
        return integer.toString();
    }

    @Override
    public PersonEx selectPersonInfo(String personId) {
        HashMap<Object, Object> h1 = new HashMap<>();
        h1.put("personId", personId);
        return personDao.select_person_byId(h1);
    }

    @Override
    public String selectPersonPosition() {
        List<KeyValueTemplate> keyValueTemplate = personDao.select_person_position();
        return JSON.toJSONString(keyValueTemplate);
    }

    @Override
    public String selectPersonProject() {
        List<KeyValueTemplate> keyValueTemplate = personDao.select_person_project();
        return JSON.toJSONString(keyValueTemplate);
    }

    @Override
    public String selectPersonComp() {
        List<KeyValueTemplate> keyValueTemplate = personDao.select_person_comp();
        return JSON.toJSONString(keyValueTemplate);
    }

    @Override
    public String selectPersonDept(String compId) {
        List<KeyValueTemplate> keyValueTemplate = personDao.select_person_dept(compId);
        return JSON.toJSONString(keyValueTemplate);
    }

    @Override
    public String selectPersonInterface(String personId, String month) {
        HashMap<Object, Object> h1 = new HashMap<>();
        h1.put("personId", personId);
        h1.put("month", month);
        List<PersonInterface> personInterface = personDao.select_mod_person_interface_ByPersonIdAndMonth(h1);
        String s = "{}";
        try {
            s = JSON.toJSONString(personInterface.get(0));
        } catch (Exception e) {

        }
        return s;
    }

    @Override
    public String selectPersonStatus(String personId) {
        String format = MyDateFormat.format(new Date());
        Integer status = null;
        try {
            status = personDao.select_mod_person_attendance_record(personId, format);
        } catch (Exception e) {
        }
        String s = "{\"status\":\"" + status + "\"}";
        return s;
    }

}
