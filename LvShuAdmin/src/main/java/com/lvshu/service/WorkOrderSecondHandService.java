package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderSecondHandMapper;
import com.lvshu.model.WorkOrderSecondHand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderSecondHandService {
    @Autowired
    private WorkOrderSecondHandMapper workOrderSecondHandMapper;


    public Integer addWorkOrderSecondHand(WorkOrderSecondHand workOrderSecondHand) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderSecondHandMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERSECONDHAND_PREFIX);
            workOrderSecondHand.setWorkOrderNum(workOrderNum);
            iRet = workOrderSecondHandMapper.addWorkOrderSecondHand(workOrderSecondHand);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderSecondHand(WorkOrderSecondHand workOrderSecondHand) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderSecondHandMapper.updateWorkOrderSecondHand(workOrderSecondHand);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderSecondHand(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderSecondHandMapper.deleteWorkOrderSecondHand(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderSecondHand getWorkOrderSecondHand(String workOrderNum) throws Exception{
        WorkOrderSecondHand workOrderSecondHand = null;
        try{
            workOrderSecondHand = workOrderSecondHandMapper.getWorkOrderSecondHand(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderSecondHand;
    }
}
