package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderComplaintMapper;
import com.lvshu.model.WorkOrderComplaint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderComplaintService {

    @Autowired
    private WorkOrderComplaintMapper workOrderComplaintMapper;


    public Integer addWorkOrderComplaint(WorkOrderComplaint workOrderComplaint) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderComplaintMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERCOMPLAINT_PREFIX);
            workOrderComplaint.setWorkOrderNum(workOrderNum);
            iRet = workOrderComplaintMapper.addWorkOrderComplaint(workOrderComplaint);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderComplaint(WorkOrderComplaint workOrderComplaint) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderComplaintMapper.updateWorkOrderComplaint(workOrderComplaint);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderComplaint(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderComplaintMapper.deleteWorkOrderComplaint(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderComplaint getWorkOrderComplaint(String workOrderNum) throws Exception{
        WorkOrderComplaint workOrderComplaint = null;
        try{
            workOrderComplaint = workOrderComplaintMapper.getWorkOrderComplaint(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderComplaint;
    }
}
