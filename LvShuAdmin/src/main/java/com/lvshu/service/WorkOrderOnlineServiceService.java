package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderOnlineServiceMapper;
import com.lvshu.model.WorkOrderOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderOnlineServiceService {
    @Autowired
    private WorkOrderOnlineServiceMapper workOrderOnlineServiceMapper;


    public Integer addWorkOrderOnlineService(WorkOrderOnlineService workOrderOnlineService) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderOnlineServiceMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERONLINESERVICE_PREFIX);
            workOrderOnlineService.setWorkOrderNum(workOrderNum);
            iRet = workOrderOnlineServiceMapper.addWorkOrderOnlineService(workOrderOnlineService);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderOnlineService(WorkOrderOnlineService workOrderOnlineService) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderOnlineServiceMapper.updateWorkOrderOnlineService(workOrderOnlineService);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderOnlineService(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderOnlineServiceMapper.deleteWorkOrderOnlineService(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderOnlineService getWorkOrderOnlineService(String workOrderNum) throws Exception{
        WorkOrderOnlineService workOrderOnlineService = null;
        try{
            workOrderOnlineService = workOrderOnlineServiceMapper.getWorkOrderOnlineService(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderOnlineService;
    }
}
