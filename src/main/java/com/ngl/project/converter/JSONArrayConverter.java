package com.ngl.project.converter;

import com.alibaba.fastjson.JSONArray;
import org.springframework.core.convert.converter.Converter;

public class JSONArrayConverter implements Converter<String, JSONArray> {
    @Override
    public JSONArray convert(String s) {
        try {
            return JSONArray.parseArray(s);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
