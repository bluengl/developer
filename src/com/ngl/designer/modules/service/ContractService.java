package com.ngl.designer.modules.service;

import com.ngl.designer.modules.pojo.ContractEx;

public interface ContractService {

    public String selectContractItem(Integer page, Integer limit, String con_contractId, String con_contractName);

    ContractEx selectContractInfoById(String contractId);

    String selectContractProject();

    String selectContractSupervisor();

    Integer saveContractInfo(Integer type, ContractEx contractEx);

    String updateContractStatus(Integer type, String contractId);

    String deleteContractItem(String contractId);

}
