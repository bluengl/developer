package com.ngl.designer.modules.dao;

import com.ngl.designer.modules.pojo.ContractEx;
import com.ngl.designer.utils.KeyValueTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ContractDao {

    List<ContractEx> select_contract_byCon(HashMap<Object, Object> h1);

    Long select_contract_count_byCon(HashMap<Object, Object> h1);

    Integer insert_mod_contract(ContractEx contractEx);

    Integer insert_mod_contract_detail(ContractEx contractEx);

    ContractEx select_mod_contract_detail_ById(String contractId);

    List<KeyValueTemplate> select_selectProject();

    List<KeyValueTemplate> select_selectSupervisor();

    Integer update_mod_contract_status_2_ById(String contractId);

    Integer update_mod_contract_status_3_ById(String contractId);

    Integer update_mod_contract_ById(ContractEx contractEx);

    Integer update_mod_contract_detail_ById(ContractEx contractEx);

    Integer delete_mod_contract_ById(@Param("contractId") String contractId);

}
