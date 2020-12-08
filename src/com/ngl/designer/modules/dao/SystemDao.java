package com.ngl.designer.modules.dao;

import com.ngl.designer.modules.pojo.DictionaryBase;
import com.ngl.designer.modules.pojo.RoleBase;
import com.ngl.designer.modules.pojo.UserEx;
import com.ngl.designer.utils.KeyValueTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface SystemDao {
    List<UserEx> selectUserDataByCon(HashMap<Object, Object> map);

    Long selectUserDataCountByCon(HashMap<Object, Object> map);

    List<UserEx> select_login_user_ById(@Param("userId") String userId);

    List<KeyValueTemplate> selectUserPerson();

    List<KeyValueTemplate> selectUserRole();

    Integer insert_login_user(UserEx userEx);

    Integer insert_user_role(@Param("userId") String userId, @Param("roleId") String roleId);

    Integer update_user_role(@Param("userId") String userId, @Param("roleId") String roleId);

    Integer update_login_user(UserEx userEx);

    Integer delete_login_user_ById(@Param("userId") String userId);

    List<DictionaryBase> select_dic_comp_dept_comp();

    List<DictionaryBase> select_dic_comp_dept_dept();

    List<DictionaryBase> select_dic_unit();

    List<DictionaryBase> select_dic_mod_project_view();

    List<DictionaryBase> select_dic_mod_project_status();

    List<DictionaryBase> select_dic_mod_person_sex();

    List<DictionaryBase> select_dic_mod_person_position();

    List<DictionaryBase> select_dic_buildtounit();

    Integer update_dic_comp_dept_comp(DictionaryBase dictionaryBase);

    Integer update_dic_comp_dept_dept(DictionaryBase dictionaryBase);

    Integer update_dic_unit(DictionaryBase dictionaryBase);

    Integer update_dic_mod_project_view(DictionaryBase dictionaryBase);

    Integer update_dic_mod_project_status(DictionaryBase dictionaryBase);

    Integer update_dic_mod_person_sex(DictionaryBase dictionaryBase);

    Integer update_dic_mod_person_position(DictionaryBase dictionaryBase);

    Integer update_dic_buildtounit(DictionaryBase dictionaryBase);


    Integer delete_dic_comp_dept_comp(@Param("id") String id);

    Integer delete_dic_comp_dept_dept(@Param("id") String id);

    Integer delete_dic_unit(@Param("id") String id);

    Integer delete_dic_mod_project_view(@Param("id") String id);

    Integer delete_dic_mod_project_status(@Param("id") String id);

    Integer delete_dic_mod_person_sex(@Param("id") String id);

    Integer delete_dic_mod_person_position(@Param("id") String id);

    Integer delete_dic_buildtounit(@Param("id") String id);

    Integer delete_limit_role(@Param("id") String id);

    Integer update_limit_role(RoleBase roleBase);

    List<RoleBase> select_limit_role();

    List<KeyValueTemplate> select_limit_loginuser();

    List<KeyValueTemplate> select_limit_select_role();

    List<String> query_limit_user_role(@Param("id") String id);

    Integer update_limit_user_role(@Param("roleId") String roleId, @Param("loginUserId") String loginUserId);

    List<RoleBase> select_system_limit_role(@Param("userId")String userId);

}
