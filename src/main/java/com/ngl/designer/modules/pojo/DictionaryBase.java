package com.ngl.designer.modules.pojo;

public class DictionaryBase {
    private String id;
    private String name;
    private String desc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Boolean isEmpty() {
        if ("".equals(this.id) && "".equals(this.name) && "".equals(this.desc)) {
            return true;
        } else {
            return false;
        }
    }

}
