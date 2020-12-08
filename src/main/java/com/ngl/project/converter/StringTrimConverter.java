package com.ngl.project.converter;

import org.springframework.core.convert.converter.Converter;

public class StringTrimConverter implements Converter<String, String> {

    @Override
    public String convert(String s) {
        try {
            if (s != null) {
                s = s.trim();
                if ("".equals(s)) {
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }
}
