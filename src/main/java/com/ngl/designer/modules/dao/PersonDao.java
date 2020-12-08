package com.ngl.designer.modules.dao;

import com.ngl.designer.modules.pojo.PersonEx;
import com.ngl.designer.modules.pojo.PersonInterface;
import com.ngl.designer.utils.KeyValueTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface PersonDao {
    List<PersonEx> select_person_byCon(HashMap<Object, Object> h1);

    PersonEx select_person_byId(HashMap<Object, Object> h1);

    Long select_person_count_byCon(HashMap<Object, Object> h1);

    Integer insert_person(PersonEx personEx);

    List<KeyValueTemplate> select_person_position();

    List<KeyValueTemplate> select_person_project();

    List<KeyValueTemplate> select_person_comp();

    List<KeyValueTemplate> select_person_dept(String compId);

    Integer insert_project_participant(@Param("actorId") String actorId, @Param("projectId") String projectId);

    List<PersonInterface> select_mod_person_interface_ByPersonIdAndMonth(HashMap<Object, Object> h1);

    Integer select_mod_person_attendance_record(@Param("personId") String personId, @Param("date") String date);

}
