package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderManual;
import com.lvshu.service.WorkOrderManualService;
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
@RequestMapping("/workOrderManual")

public class WorkOrderManualController {

    @Autowired
    private WorkOrderManualService workOrderManualService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderManual", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderManual(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderManual workOrderManual = workOrderManualService.getWorkOrderManual(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderManual", workOrderManual);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderManual(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderManualService.deleteWorkOrderManual(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderManual(Head head, WorkOrderManual workOrderManual){
        try{
            workOrderManualService.addWorkOrderManual(workOrderManual);
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



    @RequestMapping(value = "/updateWorkOrderManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderManual(Head head, WorkOrderManual workOrderManual){
        try{
            workOrderManualService.updateWorkOrderManual(workOrderManual);
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
