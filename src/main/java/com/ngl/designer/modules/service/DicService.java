package com.ngl.designer.modules.service;

public interface DicService {

    String getDicDataByType(String type);

    String saveDicDataByType(String type, String data);

    String deleteDicItemByType(String type, String id);

}
