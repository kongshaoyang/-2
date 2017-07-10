package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderAuditingMapper;
import com.lvshu.model.WorkOrderAuditing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class WorkOrderAuditingService {
    @Autowired
    private WorkOrderAuditingMapper workOrderAuditingMapper;


    public Integer addWorkOrderAuditing(WorkOrderAuditing workOrderAuditing) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderAuditingMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERMANUAL_PREFIX);
            workOrderAuditing.setWorkOrderNum(workOrderNum);
            iRet = workOrderAuditingMapper.addWorkOrderAuditing(workOrderAuditing);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderAuditing(WorkOrderAuditing workOrderAuditing) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderAuditingMapper.updateWorkOrderAuditing(workOrderAuditing);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderAuditing(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderAuditingMapper.deleteWorkOrderAuditing(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderAuditing getWorkOrderAuditing(String workOrderNum) throws Exception{
        WorkOrderAuditing workOrderAuditing = null;
        try{
            workOrderAuditing = workOrderAuditingMapper.getWorkOrderAuditing(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderAuditing;
    }
}
