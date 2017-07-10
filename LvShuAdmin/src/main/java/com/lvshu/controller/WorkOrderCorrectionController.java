package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderCorrection;
import com.lvshu.service.WorkOrderCorrectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by 田原 on 2017/1/4.
 */
@Controller
@RequestMapping("/workOrderCorrection")
public class WorkOrderCorrectionController {
    @Autowired
    private WorkOrderCorrectionService workOrderCorrectionService;

    Map<String, Object> map = new ConcurrentHashMap<String, Object>();

    @RequestMapping(value = "/getWorkOrderCorrection", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderCorrection(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){

        try{
            WorkOrderCorrection workOrderCorrection = workOrderCorrectionService.getWorkOrderCorrection(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderCorrection", workOrderCorrection);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderCorrection", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderCorrection(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderCorrectionService.deleteWorkOrderCorrection(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderCorrection", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderCorrection(Head head, WorkOrderCorrection workOrderCorrection){
        try{
            workOrderCorrectionService.addWorkOrderCorrection(workOrderCorrection);
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



    @RequestMapping(value = "/updateWorkOrderCorrection", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderCorrection(Head head, WorkOrderCorrection workOrderCorrection){
        try{
            workOrderCorrectionService.updateWorkOrderCorrection(workOrderCorrection);
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
