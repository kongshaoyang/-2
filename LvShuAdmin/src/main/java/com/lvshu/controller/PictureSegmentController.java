package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.PictureSegment;
import com.lvshu.service.PictureSegmentService;
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
@RequestMapping("/pictureSegment")
public class PictureSegmentController {
    @Autowired
    private PictureSegmentService pictureSegmentService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getPictureSegment", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getPictureSegment(Head head, @RequestParam(value="segmentNum", required=false) String segmentNum){
        try{
            PictureSegment pictureSegment = pictureSegmentService.getPictureSegment(segmentNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("PictureSegment", pictureSegment);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }


    @RequestMapping(value = "/deletePictureSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deletePictureSegment(Head head, @RequestParam(value="segmentNum", required=false) String segmentNum){
        try{
            pictureSegmentService.deletePictureSegment(segmentNum);
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

    @RequestMapping(value = "/addPictureSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPictureSegment(Head head, PictureSegment pictureSegment){
        try{
            pictureSegmentService.addPictureSegment(pictureSegment);
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



    @RequestMapping(value = "/updatePictureSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updatePictureSegment(Head head, PictureSegment pictureSegment){
        try{
            pictureSegmentService.updatePictureSegment(pictureSegment);
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
