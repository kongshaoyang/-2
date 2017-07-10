package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderCorrectionMapper;
import com.lvshu.model.WorkOrderCorrection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class WorkOrderCorrectionService {
    @Autowired
    private WorkOrderCorrectionMapper workOrderCorrectionMapper;


    public Integer addWorkOrderCorrection(WorkOrderCorrection workOrderCorrection) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderCorrectionMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERCONTRACT_PREFIX);
            workOrderCorrection.setWorkOrderNum(workOrderNum);
            iRet = workOrderCorrectionMapper.addWorkOrderCorrection(workOrderCorrection);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderCorrection(WorkOrderCorrection workOrderCorrection) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderCorrectionMapper.updateWorkOrderCorrection(workOrderCorrection);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderCorrection(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderCorrectionMapper.deleteWorkOrderCorrection(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderCorrection getWorkOrderCorrection(String workOrderNum) throws Exception{
        WorkOrderCorrection workOrderCorrection = null;
        try{
            workOrderCorrection = workOrderCorrectionMapper.getWorkOrderCorrection(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderCorrection;
    }
}
