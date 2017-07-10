package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderOnlineService;
import com.lvshu.service.WorkOrderOnlineServiceService;
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
@RequestMapping("/workOrderOnlineService")
public class WorkOrderOnlineServiceController {
    @Autowired
    private WorkOrderOnlineServiceService workOrderOnlineServiceService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderOnlineService", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderOnlineService(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderOnlineService workOrderOnlineService = workOrderOnlineServiceService.getWorkOrderOnlineService(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderOnlineService", workOrderOnlineService);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderOnlineService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderOnlineService(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderOnlineServiceService.deleteWorkOrderOnlineService(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderOnlineService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderOnlineService(Head head, WorkOrderOnlineService workOrderOnlineService){
        try{
            workOrderOnlineServiceService.addWorkOrderOnlineService(workOrderOnlineService);
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



    @RequestMapping(value = "/updateWorkOrderOnlineService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderOnlineService(Head head, WorkOrderOnlineService workOrderOnlineService){
        try{
            workOrderOnlineServiceService.updateWorkOrderOnlineService(workOrderOnlineService);
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
