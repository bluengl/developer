package com.ngl.designer.modules.controller;

import com.ngl.designer.modules.dao.PersonDao;
import com.ngl.designer.modules.pojo.PersonEx;
import com.ngl.designer.modules.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/personMg")
public class PersonController {

    @Autowired
    private PersonService personService;

    @Autowired
    private PersonDao personDao;

    @RequestMapping("execute.do")
    public String execute() {
        return "personmg/personMg";
    }

    @RequestMapping("openNewWin.do")
    public ModelAndView openNewWin(String id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("personmg/personMg_newWin");

        modelAndView.addObject("selectPosition", personService.selectPersonPosition());
        modelAndView.addObject("selectProject", personService.selectPersonProject());
        modelAndView.addObject("selectComp", personService.selectPersonComp());

        modelAndView.addObject("personId", id);
        PersonEx personEx = personService.selectPersonInfo(id);
        modelAndView.addObject("personInfo", personEx);

        try {
            modelAndView.addObject("selectDept", personService.selectPersonDept(personEx.getComp()));
        } catch (Exception e) {
            modelAndView.addObject("selectDept", "[]");
        }

        return modelAndView;
    }

    @RequestMapping("getPersonData.do")
    public void getPersonData(HttpServletResponse response, Integer page, Integer limit, String con_personId, String con_personName) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        String s = personService.selectPersonItem(page, limit, con_personId, con_personName);
        response.getWriter().write(s);
    }

    @RequestMapping("savePersonInfo.do")
    public void savePersonInfo(PersonEx personEx, HttpServletResponse response) {
        personService.savePersonInfo(1, personEx);
    }

    @RequestMapping("getSelectDept.do")
    public void getSelectDept(HttpServletResponse response, String compId) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(personService.selectPersonDept(compId));
    }

    @RequestMapping("getPersonInterface.do")
    public void getPersonInterface(HttpServletResponse response, String personId, String month) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(personService.selectPersonInterface(personId, month));
    }

    @RequestMapping("getPersonStatus.do")
    public void getPersonStatus(HttpServletResponse response, String personId) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(personService.selectPersonStatus(personId));
    }

}
