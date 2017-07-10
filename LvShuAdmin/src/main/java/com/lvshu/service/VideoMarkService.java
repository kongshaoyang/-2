package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.VideoMarkMapper;
import com.lvshu.model.VideoMark;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class VideoMarkService {
    @Autowired
    private VideoMarkMapper videoMarkMapper;


    public Integer addVideoMark(VideoMark videoMark) throws Exception{
        int iRet = 0;
        try{
            String markNum = videoMarkMapper.getMarkNum();
            markNum = TableID.getTabId(markNum, TableID.VIDEOMARK_PREFIX);
            videoMark.setMarkNum(markNum);
            iRet = videoMarkMapper.addVideoMark(videoMark);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateVideoMark(VideoMark videoMark) throws Exception{
        int iRet = 0;
        try{
            iRet = videoMarkMapper.updateVideoMark(videoMark);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteVideoMark(String markNum) throws Exception{
        int iRet = 0;
        try{
            iRet = videoMarkMapper.deleteVideoMark(markNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


}
