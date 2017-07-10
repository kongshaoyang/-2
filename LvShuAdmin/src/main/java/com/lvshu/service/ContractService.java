package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ContractMapper;
import com.lvshu.model.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class ContractService {
    @Autowired
    private ContractMapper contractMapper;


    public Integer addContract(Contract contract) throws Exception{
        int iRet = 0;
        try{
            String contractNum = contractMapper.getContractNum();
            contractNum = TableID.getTabId(contractNum, TableID.CONTRACT_PREFIX);
            contract.setContractNum(contractNum);
            iRet = contractMapper.addContract(contract);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateContract(Contract contract) throws Exception{
        int iRet = 0;
        try{
            iRet = contractMapper.updateContract(contract);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteContract(String contractNum) throws Exception{
        int iRet = 0;
        try{
            iRet = contractMapper.deleteContract(contractNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Contract getContract(String contractNum) throws Exception{
        Contract contract = null;
        try{
            contract = contractMapper.getContract(contractNum);
        }catch (Exception e){
            throw e;
        }
        return contract;
    }
}
