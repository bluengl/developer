package com.ngl.designer.modules.pojo;

import com.ngl.designer.utils.MyDateFormat;

import java.util.Date;

public class PersonEx extends PersonBase {

    private String tel;
    private Date birthday;
    private String dateFormat;
    private String address;
    private String project;
    private String comp;
    private String dept;

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }


    public String getDateFormat() {
        try {
            return MyDateFormat.format(this.birthday);
        }catch (Exception e) {
            return null;
        }

    }

    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getComp() {
        return comp;
    }

    public void setComp(String comp) {
        this.comp = comp;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
}
