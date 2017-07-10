package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ContractTemplateMapper;
import com.lvshu.model.ContractTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class ContractTemplateService {
    @Autowired
    private ContractTemplateMapper contractTemplateMapper;


    public Integer addVideoContractTemplate(ContractTemplate contractTemplate) throws Exception{
        int iRet = 0;
        try{
            String templateNum = contractTemplateMapper.getTemplateNum();
            templateNum = TableID.getTabId(templateNum, TableID.CONTRACTTEMPLATE_PREFIX);
            contractTemplate.setTemplateNum(templateNum);
            iRet = contractTemplateMapper.addContractTemplate(contractTemplate);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateContractTemplate(ContractTemplate contractTemplate) throws Exception{
        int iRet = 0;
        try{
            iRet = contractTemplateMapper.updateContractTemplate(contractTemplate);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteContractTemplate(String templateNum) throws Exception{
        int iRet = 0;
        try{
            iRet = contractTemplateMapper.deleteContractTemplate(templateNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public ContractTemplate getContractTemplate(String templateNum) throws Exception{
        ContractTemplate contractTemplate = null;
        try{
            contractTemplate = contractTemplateMapper.getContractTemplate(templateNum);
        }catch (Exception e){
            throw e;
        }
        return contractTemplate;
    }
}
