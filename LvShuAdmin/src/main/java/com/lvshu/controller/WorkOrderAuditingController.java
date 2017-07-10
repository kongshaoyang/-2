package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderAuditing;
import com.lvshu.service.WorkOrderAuditingService;
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
@RequestMapping("/workOrderAuditing")
public class WorkOrderAuditingController {
    @Autowired
    private WorkOrderAuditingService workOrderAuditingService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderAuditing", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderAuditing(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderAuditing workOrderAuditing = workOrderAuditingService.getWorkOrderAuditing(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderAuditing", workOrderAuditing);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderAuditing", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderAuditing(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderAuditingService.deleteWorkOrderAuditing(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderAuditing", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderAuditing(Head head, WorkOrderAuditing workOrderAuditing){
        try{
            workOrderAuditingService.addWorkOrderAuditing(workOrderAuditing);
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



    @RequestMapping(value = "/updateWorkOrderAuditing", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderAuditing(Head head, WorkOrderAuditing workOrderAuditing){
        try{
            workOrderAuditingService.updateWorkOrderAuditing(workOrderAuditing);
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
