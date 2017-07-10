package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderRepair;
import com.lvshu.service.WorkOrderRepairService;
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
@RequestMapping("/workOrderRepair")
public class WorkOrderRepairController {
    @Autowired
    private WorkOrderRepairService workOrderRepairService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderRepair", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderRepair(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderRepair workOrderRepair = workOrderRepairService.getWorkOrderRepair(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderRepair", workOrderRepair);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderRepair", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderRepair(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderRepairService.deleteWorkOrderRepair(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderRepair", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderRepair(Head head, WorkOrderRepair workOrderRepair){
        try{
            workOrderRepairService.addWorkOrderRepair(workOrderRepair);
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



    @RequestMapping(value = "/updateWorkOrderRepair", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderRepair(Head head, WorkOrderRepair workOrderRepair){
        try{
            workOrderRepairService.updateWorkOrderRepair(workOrderRepair);
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
