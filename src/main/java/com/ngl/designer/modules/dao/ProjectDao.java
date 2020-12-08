package com.ngl.designer.modules.dao;

import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.pojo.ProjectEx;
import com.ngl.designer.utils.KeyValueTemplate;

import java.util.HashMap;
import java.util.List;

public interface ProjectDao {
    List<KeyValueTemplate> selectComp();

    List<ProjectEx> selectTmod_project();

    List<ProjectEx> selectTmod_projectByCon(HashMap<Object, Object> h1);

    List<KeyValueTemplate> selectProjectViewOnlyParent();

    List<KeyValueTemplate> selectProjectStatus();

    List<KeyValueTemplate> selectProvince();

    List<KeyValueTemplate> selectCity(HashMap<Object, Object> h1);

    List<KeyValueTemplate> selectCounty(HashMap<Object, Object> h1);

    List<KeyValueTemplate> selectPrincipal();

    List<KeyValueTemplate> selectBuildToUnit();

    List<HashMap<Object, Object>> selectProjectParticipantUnit(HashMap<Object, Object> h1);

    List<HashMap<Object, Object>> selectProjectParticipantUser(HashMap<Object, Object> h1);

    List<ProjectEx> selectTmod_project_detail(HashMap<Object, Object> h1);

    List<KeyValueTemplate> selectCanAddUnit(HashMap<Object, Object> h1);

    List<KeyValueTemplate> selectCanAddUser(HashMap<Object, Object> h1);

    int insertToMod_project(ProjectEx projectEx);

    int insertToMod_project_base(ProjectEx projectEx);

    int insertToMod_project_general(ProjectEx projectEx);

    int insertToMod_project_participantUnit(JSONObject jo);

    int insertToMod_project_participantUser(JSONObject jo);

    int updateMod_project(ProjectEx projectEx);

    int updateMod_project_base(ProjectEx projectEx);

    int updateMod_project_general(ProjectEx projectEx);

    int updateToMod_project_participantUnit(JSONObject jo);

    int updateToMod_project_participantUser(JSONObject jo);

    List<HashMap> selectMod_project_participantUser_ActorByProjectId(String projectId);

    int deleteMod_project_participantUser_ByProjectIdAndActorId(JSONObject jo);

    int updateMod_project_participantUser_status_0(String projectId);

    int deleteTMod_project_ByProjectId(String projectId);

    int insertToMod_project_participant_defaultUser(HashMap<Object, Object> h1);

    int updateMod_project_participant_defaultUser(HashMap<Object, Object> h1);

    int select_mod_project_count_ById(String projectId);

}
