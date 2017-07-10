package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderComplaint;
import com.lvshu.service.WorkOrderComplaintService;
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
@RequestMapping("/workOrderComplaint")
public class WorkOrderComplaintController {
    @Autowired
    private WorkOrderComplaintService workOrderComplaintService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderComplaint", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderComplaint(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderComplaint workOrderComplaint = workOrderComplaintService.getWorkOrderComplaint(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderComplaint", workOrderComplaint);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderComplaint", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderComplaint(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderComplaintService.deleteWorkOrderComplaint(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderComplaint", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderComplaint(Head head, WorkOrderComplaint workOrderComplaint){
        try{
            workOrderComplaintService.addWorkOrderComplaint(workOrderComplaint);
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



    @RequestMapping(value = "/updateWorkOrderComplaint", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderComplaint(Head head, WorkOrderComplaint workOrderComplaint){
        try{
            workOrderComplaintService.updateWorkOrderComplaint(workOrderComplaint);
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
