package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.VideoSegment;
import com.lvshu.service.VideoSegmentService;
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
 * Created by 田原 on 2017/1/4.
 */
@Controller
@RequestMapping("/videoSegment")
public class VideoSegmentController {
    @Autowired
    private VideoSegmentService videoSegmentService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getVideoSegment", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getVideoSegment(Head head, @RequestParam(value="segmentNum", required=false) String segmentNum){
        try{
            VideoSegment videoSegment = videoSegmentService.getVideoSegment(segmentNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("VideoSegment", videoSegment);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteVideoSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteVideoSegment(Head head, @RequestParam(value="segmentNum", required=false) String segmentNum){
        try{
            videoSegmentService.deleteVideoSegment(segmentNum);
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

    @RequestMapping(value = "/addVideoSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addVideoSegment(Head head, VideoSegment videoSegment){
        try{
            videoSegmentService.addVideoSegment(videoSegment);
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



    @RequestMapping(value = "/updateVideoSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateVideoSegment(Head head, VideoSegment videoSegment){
        try{
            videoSegmentService.updateVideoSegment(videoSegment);
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
