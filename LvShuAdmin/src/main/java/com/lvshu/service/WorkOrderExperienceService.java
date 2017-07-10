package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderExperienceMapper;
import com.lvshu.model.WorkOrderExperience;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderExperienceService {
    @Autowired
    private WorkOrderExperienceMapper workOrderExperienceMapper;


    public Integer addWorkOrderExperience(WorkOrderExperience workOrderExperience) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderExperienceMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDEREXPERIENCE_PREFIX);
            workOrderExperience.setWorkOrderNum(workOrderNum);
            iRet = workOrderExperienceMapper.addWorkOrderExperience(workOrderExperience);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderExperience(WorkOrderExperience workOrderExperience) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderExperienceMapper.updateWorkOrderExperience(workOrderExperience);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderExperience(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderExperienceMapper.deleteWorkOrderExperience(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderExperience getWorkOrderExperience(String workOrderNum) throws Exception{
        WorkOrderExperience workOrderExperience = null;
        try{
            workOrderExperience = workOrderExperienceMapper.getWorkOrderExperience(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderExperience;
    }
}
