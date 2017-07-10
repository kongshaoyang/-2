package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.Service;
import com.lvshu.model.Video;
import com.lvshu.model.VideoRelation;
import com.lvshu.service.ServiceService;
import com.lvshu.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 田原 on 2016/12/22.
 */
@Controller
@RequestMapping("/video")
public class VideoController {

    @Autowired
    private VideoService videoService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getManualVideoList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getManualVideoList(Head head, @RequestParam(value="manualNum", required=false) String manualNum,@RequestParam(value="videoType", required=false) String videoType){
        List<Video> list = null;
        try{
            list = videoService.getVideoList(manualNum, videoType);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("Video", list);
        return map;
    }

    @RequestMapping(value = "/getVideoDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getVideoDetails(Head head, @RequestParam(value="videoNum", required=false) String videoNum){
        Video video = null;
        try{
            video = videoService.getVideo(videoNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("Video", video);
        return map;
    }

    @RequestMapping(value = "/getRefVideoList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getRefVideoList(Head head, @RequestParam(value="videoNum", required=false) String videoNum){
        try{
            List<VideoRelation> list = videoService.getVideoRelationList(videoNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("VideoRelation", list);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteVideo(Head head, @RequestParam(value="videoNum", required=false) String videoNum){
        try{
            videoService.deleteVideo(videoNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/addVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addVideo(Head head, Video video){
        try{
            videoService.addVideo(video);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }



    @RequestMapping(value = "/updateVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateVideo(Head head, Video video){
        try{
            videoService.updateVideo(video);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

}
