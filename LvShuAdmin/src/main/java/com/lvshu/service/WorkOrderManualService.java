package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderManualMapper;
import com.lvshu.model.WorkOrderManual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class WorkOrderManualService {
    @Autowired
    private WorkOrderManualMapper workOrderManualMapper;


    public Integer addWorkOrderManual(WorkOrderManual workOrderManual) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderManualMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERMANUAL_PREFIX);
            workOrderManual.setWorkOrderNum(workOrderNum);
            iRet = workOrderManualMapper.addWorkOrderManual(workOrderManual);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderManual(WorkOrderManual workOrderManual) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderManualMapper.updateWorkOrderManual(workOrderManual);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderManual(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderManualMapper.deleteWorkOrderManual(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderManual getWorkOrderManual(String workOrderNum) throws Exception{
        WorkOrderManual workOrderManual = null;
        try{
            workOrderManual = workOrderManualMapper.getWorkOrderManual(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderManual;
    }
}
