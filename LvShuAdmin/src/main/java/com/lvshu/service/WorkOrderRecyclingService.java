package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderRecyclingMapper;
import com.lvshu.model.WorkOrderRecycling;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderRecyclingService {
    @Autowired
    private WorkOrderRecyclingMapper workOrderRecyclingMapper;


    public Integer addWorkOrderRecycling(WorkOrderRecycling workOrderRecycling) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderRecyclingMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERRECYCLING_PREFIX);
            workOrderRecycling.setWorkOrderNum(workOrderNum);
            iRet = workOrderRecyclingMapper.addWorkOrderRecycling(workOrderRecycling);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderRecycling(WorkOrderRecycling workOrderRecycling) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderRecyclingMapper.updateWorkOrderRecycling(workOrderRecycling);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderRecycling(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderRecyclingMapper.deleteWorkOrderRecycling(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderRecycling getWorkOrderRecycling(String workOrderNum) throws Exception{
        WorkOrderRecycling workOrderRecycling = null;
        try{
            workOrderRecycling = workOrderRecyclingMapper.getWorkOrderRecycling(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderRecycling;
    }
}
