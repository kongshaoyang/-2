package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderManualPaperMapper;
import com.lvshu.model.WorkOrderManualPaper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderManualPaperService {
    @Autowired
    private WorkOrderManualPaperMapper workOrderManualPaperMapper;


    public Integer addWorkOrderManualPaper(WorkOrderManualPaper workOrderManualPaper) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderManualPaperMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERMANUALPAPER_PREFIX);
            workOrderManualPaper.setWorkOrderNum(workOrderNum);
            iRet = workOrderManualPaperMapper.addWorkOrderManualPaper(workOrderManualPaper);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderManualPaper(WorkOrderManualPaper workOrderManualPaper) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderManualPaperMapper.updateWorkOrderManualPaper(workOrderManualPaper);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderManualPaper(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderManualPaperMapper.deleteWorkOrderManualPaper(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderManualPaper getWorkOrderManualPaper(String workOrderNum) throws Exception{
        WorkOrderManualPaper workOrderManualPaper = null;
        try{
            workOrderManualPaper = workOrderManualPaperMapper.getWorkOrderManualPaper(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderManualPaper;
    }
}
