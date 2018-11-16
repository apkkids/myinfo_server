package com.apkkids.myinfo_server.common;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 该类用于将String类型转换为Date类型，用在web请求中参数转换为Java对象时，例如Salary对象
 * 在WebMvcConfig的addFormatters方法中调用
 */
public class DateConverter implements Converter<String, Date> {
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public Date convert(String s) {
        if (s == null || "".equals(s)){
            return null;
        }
        try {
            Date date = simpleDateFormat.parse(s);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
