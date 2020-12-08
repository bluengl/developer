package com.ngl.designer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * implements
 * Controller的handleRequest方法返回ModelAndView
 * HttpRequestHandler适配器器的handleRequest方法没有返回ModelAndView，可通过response修改定义响应内容，比如返回json数据：
 */
@Controller
public class TestController {
    @RequestMapping("homePage.do")
    public String homePage(){
        return "default/default";
    }
}
