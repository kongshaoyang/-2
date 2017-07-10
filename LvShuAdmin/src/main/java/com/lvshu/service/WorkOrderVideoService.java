package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderVideoMapper;
import com.lvshu.model.WorkOrderVideo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderVideoService {
    @Autowired
    private WorkOrderVideoMapper workOrderVideoMapper;


    public Integer addWorkOrderVideo(WorkOrderVideo workOrderVideo) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderVideoMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERVIDEO_PREFIX);
            workOrderVideo.setWorkOrderNum(workOrderNum);
            iRet = workOrderVideoMapper.addWorkOrderVideo(workOrderVideo);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderVideo(WorkOrderVideo workOrderVideo) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderVideoMapper.updateWorkOrderVideo(workOrderVideo);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderVideo(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderVideoMapper.deleteWorkOrderVideo(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderVideo getWorkOrderVideo(String workOrderNum) throws Exception{
        WorkOrderVideo workOrderVideo = null;
        try{
            workOrderVideo = workOrderVideoMapper.getWorkOrderVideo(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderVideo;
    }
}
