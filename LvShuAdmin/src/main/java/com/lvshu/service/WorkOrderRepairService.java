package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderRepairMapper;
import com.lvshu.model.WorkOrderRepair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderRepairService {
    @Autowired
    private WorkOrderRepairMapper workOrderRepairMapper;


    public Integer addWorkOrderRepair(WorkOrderRepair workOrderRepair) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderRepairMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERREPAIR_PREFIX);
            workOrderRepair.setWorkOrderNum(workOrderNum);
            iRet = workOrderRepairMapper.addWorkOrderRepair(workOrderRepair);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderRepair(WorkOrderRepair workOrderRepair) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderRepairMapper.updateWorkOrderRepair(workOrderRepair);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderRepair(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderRepairMapper.deleteWorkOrderRepair(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderRepair getWorkOrderRepair(String workOrderNum) throws Exception{
        WorkOrderRepair workOrderRepair = null;
        try{
            workOrderRepair = workOrderRepairMapper.getWorkOrderRepair(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderRepair;
    }
}
