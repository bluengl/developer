package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.dao.ProjectDao;
import com.ngl.designer.modules.pojo.ProjectEx;
import com.ngl.designer.modules.service.ProjectService;
import com.ngl.designer.utils.KeyValueTemplate;
import com.ngl.project.loginUser.pojo.LoginUserEx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectDao projectDao;

    @Override
    public ModelAndView selectNewWindowSelectInputDataBinding(ModelAndView modelAndView) {
        // 查询形象下拉列表
        List<KeyValueTemplate> mapsView = projectDao.selectProjectViewOnlyParent();
        // 查询状态下拉列表
        List<KeyValueTemplate> mapsStatus = projectDao.selectProjectStatus();
        // 查询省级下拉列表
        List<KeyValueTemplate> mapsProvince = projectDao.selectProvince();
        // 查询负责人下拉列表
        List<KeyValueTemplate> mapsPrincipal = projectDao.selectPrincipal();
        // 查询建设单位下拉列表
        List<KeyValueTemplate> mapsBuildToUnit = projectDao.selectBuildToUnit();
        // id为空的情况下selectCanAddUnit和selectCanAddUser都可以正常查询
        HashMap<Object, Object> mapsProjectId = new HashMap<>();
        mapsProjectId.put("projectId", modelAndView.getModel().get("projectId"));
        // 查询可添加单位下拉框
        List<KeyValueTemplate> mapsCanAddUnits = projectDao.selectCanAddUnit(mapsProjectId);
        // 查询可添加人员下拉框
        List<KeyValueTemplate> mapsCanAddUsers = projectDao.selectCanAddUser(mapsProjectId);

        // 绑定数据
        modelAndView.addObject("projectView", JSON.toJSONString(mapsView));
        modelAndView.addObject("projectStatus", JSON.toJSONString(mapsStatus));
        modelAndView.addObject("projectProvince", JSON.toJSONString(mapsProvince));
        modelAndView.addObject("projectPrincipal", JSON.toJSONString(mapsPrincipal));
        modelAndView.addObject("projectBuildToUnit", JSON.toJSONString(mapsBuildToUnit));
        modelAndView.addObject("selectCanAddUnit", JSON.toJSONString(mapsCanAddUnits));
        modelAndView.addObject("selectCanAddUser", JSON.toJSONString(mapsCanAddUsers));

        return modelAndView;
    }

    @Override
    public ModelAndView selectNewWindowProjectDetailDataBinding(ModelAndView modelAndView) {
        HashMap<Object, Object> mapsProjectId = new HashMap<>();
        mapsProjectId.put("projectId", modelAndView.getModel().get("projectId"));

        // 查询参建单位表
        List<HashMap<Object, Object>> mapsParticipantUnits = projectDao.selectProjectParticipantUnit(mapsProjectId);
        // 查询参建人员表
        List<HashMap<Object, Object>> mapsParticipantUsers = projectDao.selectProjectParticipantUser(mapsProjectId);
        // 查询项目的基本信息和概况
        List<ProjectEx> projectExes = projectDao.selectTmod_project_detail(mapsProjectId);

        // 绑定数据
        modelAndView.addObject("projectParticipantUnit", JSON.toJSONString(mapsParticipantUnits));
        modelAndView.addObject("projectParticipantUser", JSON.toJSONString(mapsParticipantUsers));
        modelAndView.addObject("projectDetail", projectExes.get(0));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            modelAndView.addObject("projectDetail_startTime", sdf.format(projectExes.get(0).getStartTime()));
        } catch (Exception e) {
            // 查询出的时间为空
        }
        try {
            modelAndView.addObject("projectDetail_endTime", sdf.format(projectExes.get(0).getEndTime()));
        } catch (Exception e) {
            // 查询出的时间为空
        }

        HashMap<Object, Object> mapProvince = new HashMap<>();
        mapProvince.put("provinceId", projectExes.get(0).getProvinceId());

        List<KeyValueTemplate> mapsCity = projectDao.selectCity(mapProvince);
        modelAndView.addObject("projectDetail_City", JSON.toJSONString(mapsCity));

        HashMap<Object, Object> mapCity = new HashMap<>();
        mapCity.put("cityId", projectExes.get(0).getCityId());
        List<KeyValueTemplate> mapsCounty = projectDao.selectCounty(mapCity);
        modelAndView.addObject("projectDetail_County", JSON.toJSONString(mapsCounty));

        modelAndView.addObject("projectDetail_ProvinceId", projectExes.get(0).getProvinceId());
        modelAndView.addObject("projectDetail_CityId", projectExes.get(0).getCityId());
        modelAndView.addObject("projectDetail_CountyId", projectExes.get(0).getCountyId());

        return modelAndView;
    }

    @Override
    public String selectCity(String provinceId) {
        HashMap<Object, Object> mapProvinceId = new HashMap<>();
        mapProvinceId.put("provinceId", provinceId);
        List<KeyValueTemplate> keyValueTemplates = projectDao.selectCity(mapProvinceId);
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectCounty(String cityId) {
        HashMap<Object, Object> mapCityId = new HashMap<>();
        mapCityId.put("cityId", cityId);
        List<KeyValueTemplate> keyValueTemplates = projectDao.selectCounty(mapCityId);
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectBuildToUnit() {
        List<KeyValueTemplate> keyValueTemplates = projectDao.selectComp();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectProjectItem() {
        List<ProjectEx> projectExes = projectDao.selectTmod_project();
        return JSON.toJSONString(projectExes);
    }

    @Override
    public String selectProjectItemByCon(String projectName, String selectComp, String username) {
        HashMap<Object, Object> h1 = new HashMap<>();
        h1.put("projectName", projectName);
        h1.put("selectComp", selectComp);
        h1.put("username", username);
        List<ProjectEx> projectExes = projectDao.selectTmod_projectByCon(h1);
        return JSON.toJSONString(projectExes);
    }

    @Override
    public String saveProjectInfo(int type, ProjectEx projectEx, String participantUnit, String participantUser, String delArr, HttpSession session) {
        try {
            List<List> unitLists = JSONArray.parseArray(participantUnit, List.class);
            List<List> userLists = JSONArray.parseArray(participantUser, List.class);
            List<List> delLists = JSONArray.parseArray(delArr, List.class);
            if (type == 1) {
                // 添加记录
                projectDao.insertToMod_project(projectEx);
                projectDao.insertToMod_project_base(projectEx);
                projectDao.insertToMod_project_general(projectEx);
            } else if (type == 2) {
                // 更新记录
                projectDao.updateMod_project(projectEx);
                projectDao.updateMod_project_base(projectEx);
                projectDao.updateMod_project_general(projectEx);
                for (List item : delLists) {
                    JSONObject jo = (JSONObject) item.remove(0);
                    jo.put("projectId", projectEx.getId());
                    jo.put("userId", ((LoginUserEx) session.getAttribute("userInfo")).getRealUserId());
                    try {
                        projectDao.deleteMod_project_participantUser_ByProjectIdAndActorId(jo);
                    } catch (Exception e) {
                        continue;
                    }
                }
            }
            for (List item : unitLists) {
                JSONObject jo = (JSONObject) item.remove(0);
                jo.put("projectId", projectEx.getId());
                try {
                    if (projectDao.updateToMod_project_participantUnit(jo) == 0)
                        projectDao.insertToMod_project_participantUnit(jo);
                } catch (Exception e) {
                    continue;
                }
            }
            for (List item : userLists) {
                JSONObject jo = (JSONObject) item.remove(0);
                jo.put("projectId", projectEx.getId());
                try {
                    if (projectDao.updateToMod_project_participantUser(jo) == 0)
                        projectDao.insertToMod_project_participantUser(jo);
                } catch (Exception e) {
                    continue;
                }
            }
        } catch (Exception e) {
            return "false";
        }
        return "true";
    }

    @Override
    public String deleteProjectItem(String projectId) {
        try {
            projectDao.deleteTMod_project_ByProjectId(projectId);
        } catch (Exception e) {
            return "false";
        }
        return "true";
    }
}
