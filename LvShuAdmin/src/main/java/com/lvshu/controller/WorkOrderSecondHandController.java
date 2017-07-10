package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderSecondHand;
import com.lvshu.service.WorkOrderSecondHandService;
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
@RequestMapping("/workOrderSecondHand")
public class WorkOrderSecondHandController {
    @Autowired
    private WorkOrderSecondHandService workOrderComplaintService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderSecondHand", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderSecondHand(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderSecondHand workOrderSecondHand = workOrderComplaintService.getWorkOrderSecondHand(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderSecondHand", workOrderSecondHand);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderSecondHand", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderSecondHand(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderComplaintService.deleteWorkOrderSecondHand(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderSecondHand", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderSecondHand(Head head, WorkOrderSecondHand workOrderSecondHand){
        try{
            workOrderComplaintService.addWorkOrderSecondHand(workOrderSecondHand);
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



    @RequestMapping(value = "/updateWorkOrderSecondHand", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderSecondHand(Head head, WorkOrderSecondHand workOrderSecondHand){
        try{
            workOrderComplaintService.updateWorkOrderSecondHand(workOrderSecondHand);
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
