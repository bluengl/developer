package com.ngl.designer.modules.controller;

import com.ngl.designer.modules.dao.ProjectDao;
import com.ngl.designer.modules.pojo.ProjectEx;
import com.ngl.designer.modules.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/projectMg")
public class ProjectController {

    @Autowired
    @Qualifier("projectService")
    private ProjectService projectService;

    @Autowired
    private ProjectDao projectDao;

    @RequestMapping("execute.do")
    public String execute(HttpSession session) {
        return "projectmg/projectMg";
    }

    @RequestMapping("openNewWin.do")
    public ModelAndView openNewWin(String id) {
        ModelAndView modelAndView = new ModelAndView();
        // 添加项目ID到model中
        modelAndView.addObject("projectId", id);
        // 设置统一view
        modelAndView.setViewName("projectmg/projectMg_newWin");
        modelAndView = projectService.selectNewWindowSelectInputDataBinding(modelAndView);
        if (id == null) {
            modelAndView.addObject("type", 1);
            return modelAndView;
        }
        modelAndView = projectService.selectNewWindowProjectDetailDataBinding(modelAndView);
        modelAndView.addObject("type", 2);
        return modelAndView;
    }

    @RequestMapping("getSelectCity.do")
    public void getSelectCity(HttpServletResponse response, String provinceId) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(projectService.selectCity(provinceId));
    }

    @RequestMapping("getSelectCounty.do")
    public void getSelectCounty(HttpServletResponse response, String cityId) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(projectService.selectCounty(cityId));
    }

    @RequestMapping("getSelectComp.do")
    public void getSelectComp(HttpServletResponse response) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(projectService.selectBuildToUnit());
    }

    @RequestMapping("selectProjectItem.do")
    public void selectProjectItem(HttpServletResponse response) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(projectService.selectProjectItem());
    }

    @RequestMapping("queryByCon.do")
    public void queryByCon(String projectName, String selectComp, String username, HttpServletResponse response) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(projectService.selectProjectItemByCon(projectName, selectComp, username));
    }

    @RequestMapping("saveProjectInfo.do")
    @ResponseBody
    public void saveProjectInfo(String type, String participantUnit, String participantUser, String delArr, ProjectEx projectEx, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String msg;
        if ("1".equals(type)) {
            msg = projectService.saveProjectInfo(1, projectEx, participantUnit, participantUser, delArr, request.getSession());
        } else {
            msg = projectService.saveProjectInfo(2, projectEx, participantUnit, participantUser, delArr, request.getSession());
        }
        response.getWriter().write("{\"msg\":\"" + msg + "\"}");
    }

    @RequestMapping("deleteProjectItem.do")
    public void deleteProjectItem(String projectId) {
        String msg = projectService.deleteProjectItem(projectId);
    }

    @RequestMapping("checkProjectId.do")
    public void checkProjectId(HttpServletResponse response, String projectId) throws IOException {
        response.getWriter().write("{\"res\":\"" + projectDao.select_mod_project_count_ById(projectId) + "\"}");
    }

}
