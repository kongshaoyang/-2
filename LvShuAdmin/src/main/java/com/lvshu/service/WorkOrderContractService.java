package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderContractMapper;
import com.lvshu.model.WorkOrderContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class WorkOrderContractService
{
    @Autowired
    private WorkOrderContractMapper workOrderContractMapper;


    public Integer addWorkOrderContract(WorkOrderContract workOrderContract) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderContractMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERMANUAL_PREFIX);
            workOrderContract.setWorkOrderNum(workOrderNum);
            iRet = workOrderContractMapper.addWorkOrderContract(workOrderContract);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderContract(WorkOrderContract workOrderContract) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderContractMapper.updateWorkOrderContract(workOrderContract);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderContract(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderContractMapper.deleteWorkOrderContract(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderContract getWorkOrderContract(String workOrderNum) throws Exception{
        WorkOrderContract workOrderContract = null;
        try{
            workOrderContract = workOrderContractMapper.getWorkOrderContract(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderContract;
    }
}
