package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.VideoSegmentMapper;
import com.lvshu.model.VideoSegment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class VideoSegmentService {
    @Autowired
    private VideoSegmentMapper videoSegmentMapper;


    public Integer addVideoSegment(VideoSegment videoSegment) throws Exception{
        int iRet = 0;
        try{
            String segmentNum = videoSegmentMapper.getSegmentNum();
            segmentNum = TableID.getTabId(segmentNum, TableID.VIDEOSEGMENT_PREFIX);
            videoSegment.setSegmentNum(segmentNum);
            iRet = videoSegmentMapper.addVideoSegment(videoSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateVideoSegment(VideoSegment videoSegment) throws Exception{
        int iRet = 0;
        try{
            iRet = videoSegmentMapper.updateVideoSegment(videoSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteVideoSegment(String segmentNum) throws Exception{
        int iRet = 0;
        try{
            iRet = videoSegmentMapper.deleteVideoSegment(segmentNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public VideoSegment getVideoSegment(String segmentNum) throws Exception{
        VideoSegment videoSegment = null;
        try{
            videoSegment = videoSegmentMapper.getVideoSegment(segmentNum);
        }catch (Exception e){
            throw e;
        }
        return videoSegment;
    }
}
