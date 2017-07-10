package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.VideoMapper;
import com.lvshu.model.Video;
import com.lvshu.model.VideoRelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class VideoService {
    @Autowired
    private VideoMapper videoMapper;

    public List<Video> getVideoList(String manualNum, String videoType) throws Exception{
        List<Video> list = null;
        try{
            //list = videoMapper.getVideoList(manualNum, videoType);
        }catch (Exception e){
            throw e;
        }
        return list;
    }

    public Video getVideo(String videoNum) throws Exception{
        Video video = null;
        try{
            video = videoMapper.getVideo(videoNum);
        }catch (Exception e){
            throw e;
        }
        return video;
    }

    public List<VideoRelation> getVideoRelationList(String videoNum) throws Exception{
        List<VideoRelation> list = null;
        try{
            list = videoMapper.getVideoRelationList(videoNum);
        }catch (Exception e){
            throw e;
        }
        return list;
    }



    public Integer addVideo(Video video) throws Exception{
        int iRet = 0;
        try{
            String videoNum = videoMapper.getVideoNum();
            videoNum = TableID.getTabId(videoNum, TableID.VIDEO_PREFIX);
            video.setVideoNum(videoNum);
            iRet = videoMapper.addVideo(video);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateVideo(Video video) throws Exception{
        int iRet = 0;
        try{
            iRet = videoMapper.updateVideo(video);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteVideo(String videoNum) throws Exception{
        int iRet = 0;
        try{
            iRet = videoMapper.deleteVideo(videoNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

}
