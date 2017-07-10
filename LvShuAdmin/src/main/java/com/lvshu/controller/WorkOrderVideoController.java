package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderVideo;
import com.lvshu.service.WorkOrderVideoService;
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
 * Created by 田原 on 2017/1/5.
 */
@Controller
@RequestMapping("/workOrderVideo")
public class WorkOrderVideoController {
    @Autowired
    private WorkOrderVideoService workOrderVideoService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderVideo", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderVideo(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderVideo workOrderVideo = workOrderVideoService.getWorkOrderVideo(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderVideo", workOrderVideo);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderVideo(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderVideoService.deleteWorkOrderVideo(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderVideo(Head head, WorkOrderVideo workOrderVideo){
        try{
            workOrderVideoService.addWorkOrderVideo(workOrderVideo);
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



    @RequestMapping(value = "/updateWorkOrderVideo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderVideo(Head head, WorkOrderVideo workOrderVideo){
        try{
            workOrderVideoService.updateWorkOrderVideo(workOrderVideo);
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
