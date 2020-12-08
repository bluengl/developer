package com.ngl.designer.modules.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ngl.designer.modules.pojo.ContractEx;
import com.ngl.designer.modules.service.ContractService;
import com.ngl.designer.utils.TableDataTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/contractMg")
public class ContractController {
    @Autowired
    private ContractService contractService;

    @RequestMapping("execute.do")
    public String execute() {
        return "contractmg/contractMg";
    }

    @RequestMapping("openNewWin.do")
    public ModelAndView openNewWin(String id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("contractmg/contractMg_newWin");

        modelAndView.addObject("contractId", id);
        modelAndView.addObject("contractInfo", contractService.selectContractInfoById(id));
        modelAndView.addObject("selectProject", contractService.selectContractProject());
        modelAndView.addObject("selectSupervisor", contractService.selectContractSupervisor());

        return modelAndView;
    }

    @RequestMapping("getContractData.do")
    public void getContractData(HttpServletResponse response, Integer page, Integer limit, String con_contractId, String con_contractName) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        String s = contractService.selectContractItem(page, limit, con_contractId, con_contractName);
        response.getWriter().write(s);
    }

    @RequestMapping("saveContractInfo.do")
    public void saveContractInfo(ContractEx contractEx, String type) {
        Integer integer = contractService.saveContractInfo(Integer.parseInt(type), contractEx);
    }

    @ResponseBody
    @RequestMapping(value = "uploadFile.do", method = RequestMethod.POST)
    public void uploadFile(@RequestParam("file") MultipartFile file, String contractId, HttpServletResponse response, HttpServletRequest request) {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = new JSONObject();
    }

    @RequestMapping("executeContract.do")
    public void executeContract(HttpServletResponse response, String contractId) throws IOException {
        response.getWriter().write(contractService.updateContractStatus(1, contractId));
    }

    @RequestMapping("finishContract.do")
    public void finishContract(HttpServletResponse response, String contractId) throws IOException {
        response.getWriter().write(contractService.updateContractStatus(2, contractId));
    }

    @RequestMapping("deleteContract.do")
    public void deleteContract(HttpServletResponse response, String contractId) throws IOException {
        response.getWriter().write(contractService.deleteContractItem(contractId));
    }

}
