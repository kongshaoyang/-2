package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderRecycling;
import com.lvshu.service.WorkOrderRecyclingService;
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
@RequestMapping("/workOrderRecycling")
public class WorkOrderRecyclingController {
    @Autowired
    private WorkOrderRecyclingService workOrderRecyclingService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderRecycling", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderRecycling(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderRecycling workOrderRecycling = workOrderRecyclingService.getWorkOrderRecycling(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderRecycling", workOrderRecycling);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderRecycling", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderRecycling(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderRecyclingService.deleteWorkOrderRecycling(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderRecycling", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderRecycling(Head head, WorkOrderRecycling workOrderRecycling){
        try{
            workOrderRecyclingService.addWorkOrderRecycling(workOrderRecycling);
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



    @RequestMapping(value = "/updateWorkOrderRecycling", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderRecycling(Head head, WorkOrderRecycling workOrderRecycling){
        try{
            workOrderRecyclingService.updateWorkOrderRecycling(workOrderRecycling);
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
