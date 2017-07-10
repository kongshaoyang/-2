package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderInnerMapper;
import com.lvshu.model.WorkOrderInner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderInnerService {
    @Autowired
    private WorkOrderInnerMapper workOrderInnerMapper;


    public Integer addWorkWorkOrderInner(WorkOrderInner workOrderInner) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderInnerMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERINNER_PREFIX);
            workOrderInner.setWorkOrderNum(workOrderNum);
            iRet = workOrderInnerMapper.addWorkOrderInner(workOrderInner);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderInner(WorkOrderInner workOrderInner) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderInnerMapper.updateWorkOrderInner(workOrderInner);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderInner(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderInnerMapper.deleteWorkOrderInner(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderInner getWorkOrderInner(String workOrderNum) throws Exception{
        WorkOrderInner workOrderInner = null;
        try{
            workOrderInner = workOrderInnerMapper.getWorkOrderRepair(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderInner;
    }
}
