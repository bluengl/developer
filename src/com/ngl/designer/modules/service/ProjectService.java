package com.ngl.designer.modules.service;

import com.ngl.designer.modules.pojo.ProjectEx;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

public interface ProjectService {
    ModelAndView selectNewWindowSelectInputDataBinding(ModelAndView modelAndView);

    ModelAndView selectNewWindowProjectDetailDataBinding(ModelAndView modelAndView);

    String selectCity(String provinceId);

    String selectCounty(String cityId);

    String selectBuildToUnit();

    String selectProjectItem();

    String selectProjectItemByCon(String projectName, String selectComp, String username);

    String saveProjectInfo(int type, ProjectEx projectEx, String participantUnit, String participantUser, String delArr, HttpSession session);

    String deleteProjectItem(String projectId);

}
