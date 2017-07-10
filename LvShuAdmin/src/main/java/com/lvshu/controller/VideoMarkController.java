package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.VideoMark;
import com.lvshu.service.VideoMarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 田原 on 2016/12/22.
 */
@Controller
@RequestMapping("/videoMark")
public class VideoMarkController {

    @Autowired
    private VideoMarkService videoMarkService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/deleteVideoMark", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteVideoMark(Head head, @RequestParam(value="markNum", required=false) String markNum){
        try{
            videoMarkService.deleteVideoMark(markNum);
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

    @RequestMapping(value = "/addVideoMark", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addVideoMark(Head head, VideoMark videoMark){
        try{
            videoMarkService.addVideoMark(videoMark);
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



    @RequestMapping(value = "/updateVideoMark", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateVideoMark(Head head, VideoMark videoMark){
        try{
            videoMarkService.updateVideoMark(videoMark);
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
