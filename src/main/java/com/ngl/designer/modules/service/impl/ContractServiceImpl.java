package com.ngl.designer.modules.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.dao.ContractDao;
import com.ngl.designer.modules.pojo.ContractEx;
import com.ngl.designer.modules.service.ContractService;
import com.ngl.designer.utils.KeyValueTemplate;
import com.ngl.designer.utils.RandomIdUtil;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractDao contractDao;

    @Override
    public String selectContractItem(Integer page, Integer limit, String contractId, String contractName) {
        HashMap<Object, Object> map = new HashMap<Object, Object>();
        ContractEx contractEx = new ContractEx();
        contractEx.setId(contractId);
        contractEx.setName(contractName);
        map.put("contractInfo", contractEx);
        Integer start = (page - 1) * limit;
        map.put("start", start);
        map.put("end", start + limit);
        List<ContractEx> data = contractDao.select_contract_byCon(map);
        Long count = contractDao.select_contract_count_byCon(map);
        TableDataTemplate<ContractEx> template = new TableDataTemplate<ContractEx>(0, "msg", count, data);
        return JSON.toJSONString(template);
    }

    @Override
    public ContractEx selectContractInfoById(String contractId) {
        return contractDao.select_mod_contract_detail_ById(contractId);
    }

    @Override
    public String selectContractProject() {
        List<KeyValueTemplate> keyValueTemplates = contractDao.select_selectProject();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public String selectContractSupervisor() {
        List<KeyValueTemplate> keyValueTemplates = contractDao.select_selectSupervisor();
        return JSON.toJSONString(keyValueTemplates);
    }

    @Override
    public Integer saveContractInfo(Integer type, ContractEx contractEx) {
        Integer integer = 0;

        if (type == 1) {
            String contractId = RandomIdUtil.byTimestamp("ht");
            contractEx.setId(contractId);
            contractEx.setStatus("1");
            integer = contractDao.insert_mod_contract(contractEx);
            integer = contractDao.insert_mod_contract_detail(contractEx);
        } else if (type == 2) {
            contractEx.setStatus("1");
            integer = contractDao.update_mod_contract_ById(contractEx);
            integer = contractDao.update_mod_contract_detail_ById(contractEx);
        }
        return integer;
    }

    @Override
    public String updateContractStatus(Integer type, String contractId) {
        Integer integer = 0;
        JSONObject jsonObject = new JSONObject();
        if (type == 1) {
            integer = contractDao.update_mod_contract_status_2_ById(contractId);
        } else if (type == 2) {
            integer = contractDao.update_mod_contract_status_3_ById(contractId);
        }
        jsonObject.put("msg", integer);
        return jsonObject.toJSONString();
    }

    @Override
    public String deleteContractItem(String contractId) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("msg", contractDao.delete_mod_contract_ById(contractId));
        return jsonObject.toJSONString();
    }
}
