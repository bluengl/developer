package com.ngl.designer.modules.service;

import com.ngl.designer.modules.pojo.PersonEx;

public interface PersonService {
    public String selectPersonItem(Integer page, Integer limit, String personId, String personName);

    public String savePersonInfo(int type, PersonEx personEx);

    public PersonEx selectPersonInfo(String personId);

    public String selectPersonPosition();

    public String selectPersonProject();

    String selectPersonComp();

    String selectPersonDept(String compId);

    String selectPersonInterface(String personId, String month);

    String selectPersonStatus(String personId);

}
