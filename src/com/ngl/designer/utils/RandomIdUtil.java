package com.ngl.designer.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RandomIdUtil {

    public static String byData(String tp) {
        return tp + new SimpleDateFormat("yyMMddHHmmssSS").format(new Date());
    }

    public static String byTimestamp(String tp) {
        Long l = System.currentTimeMillis();
        return tp + l.toString();
    }

    public static String byData() {
        return new SimpleDateFormat("yyMMddHHmmssSS").format(new Date());
    }

    public static String byTimestamp() {
        Long l = System.currentTimeMillis();
        return l.toString();
    }
}
