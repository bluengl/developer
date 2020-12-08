package com.ngl.designer.modules.controller;

import com.alibaba.fastjson.JSON;
import com.ngl.designer.modules.dao.SystemDao;
import com.ngl.designer.modules.pojo.DictionaryBase;
import com.ngl.designer.modules.pojo.UserEx;
import com.ngl.designer.modules.service.DicService;
import com.ngl.designer.modules.service.LimitService;
import com.ngl.designer.modules.service.UserService;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/systemMg")
public class SystemController {

    @Autowired
    private UserService userService;

    @Autowired
    private DicService dicService;

    @Autowired
    private LimitService limitService;

    @RequestMapping("dictionaryMg/execute.do")
    public String dictionaryExecute() {
        return "systemmg/dictionary/dictionaryMg";
    }

    @RequestMapping("dictionaryMg/getDicData.do")
    public void getDicData(HttpServletResponse response, String type, String page, String limit) throws IOException {
        response.getWriter().print(dicService.getDicDataByType(type));
    }

    @RequestMapping("dictionaryMg/saveDicInfo.do")
    public void saveDicInfo(HttpServletResponse response, String type, String table) throws IOException {
        String s = dicService.saveDicDataByType(type, table);
        response.getWriter().print(s);
    }

    @RequestMapping("dictionaryMg/deleteDicItem.do")
    public void deleteDicItem(HttpServletResponse response, String type, String id) throws IOException {
        String s = dicService.deleteDicItemByType(type, id);
        response.getWriter().print(s);
    }


    @RequestMapping("limitsMg/execute.do")
    public ModelAndView limitsExecute() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("systemmg/limits/limitsMg");

        modelAndView.addObject("selectLoginUser", limitService.selectLoginUser());
        modelAndView.addObject("selectRole", limitService.selectRole());

        return modelAndView;
    }

    @RequestMapping("limitsMg/refreshSelectRole.do")
    public void refreshSelectRole(HttpServletResponse response) throws IOException {
        String s = limitService.selectRole();
        response.getWriter().print(s);
    }

    @RequestMapping("limitsMg/querySelectRole.do")
    public void querySelectRole(HttpServletResponse response, String userId) throws IOException {
        String s = limitService.queryRole(userId);
        response.getWriter().print(s);
    }

    @RequestMapping("limitsMg/saveUserRole.do")
    public void saveUserRole(HttpServletResponse response, String roleId, String loginUserId) throws IOException {
        String s = limitService.updateUserRole(loginUserId, roleId);
        response.getWriter().print(s);
    }

    @RequestMapping("limitsMg/deleteRoleItem.do")
    public void deleteRoleItem(HttpServletResponse response, String id) throws IOException {
        String s = limitService.deleteRoleItem(id);
        response.getWriter().print(s);
    }

    @RequestMapping("limitsMg/saveRoleData.do")
    public void saveRoleData(HttpServletResponse response, String table) throws IOException {
        String s = limitService.saveRoleData(table);
        response.getWriter().print(s);
    }

    @RequestMapping("limitsMg/getRoleData.do")
    public void getRoleData(HttpServletResponse response, String extra) throws IOException {
        String s = limitService.selectRoleData(extra);
        response.getWriter().print(s);
    }

    @RequestMapping("userMg/execute.do")
    public String userExecute() {
        return "systemmg/user/userMg";
    }

    @RequestMapping("userMg/openNewWin.do")
    public ModelAndView userMgOpenNewWin(String userId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("systemmg/user/userMg_newWin");

        modelAndView.addObject("selectPerson", userService.selectPerson());
        modelAndView.addObject("selectRole", userService.selectRole());

        modelAndView.addObject("userInfo", userService.selectUserInfoById(userId));
        modelAndView.addObject("userId", userId);

        return modelAndView;
    }

    @RequestMapping("userMg/getUserData.do")
    public void getContractData(HttpServletResponse response, Integer page, Integer limit, String con_username) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        String s = userService.selectUserData(page, limit, con_username);
        response.getWriter().write(s);
    }

    @RequestMapping("userMg/saveUserInfo.do")
    public void saveUserInfo(HttpServletResponse response, String type, UserEx userEx) throws IOException {
        String s = userService.saveUserInfo(type, userEx);
        response.getWriter().print(s);
    }

    @RequestMapping("userMg/deleteUserItem.do")
    public void deleteUserItem(HttpServletResponse response, String userId) throws IOException {
        response.getWriter().print(userService.deleteUserInfo(userId));
    }

}
