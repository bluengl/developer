package com.ngl.designer.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyDateFormat {
    public static String format(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
}
