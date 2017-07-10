package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderInner;
import com.lvshu.service.WorkOrderInnerService;
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
@RequestMapping("/workOrderInner")
public class WorkOrderInnerController {
    @Autowired
    private WorkOrderInnerService workOrderInnerService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderInner", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderInner(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderInner workOrderInner = workOrderInnerService.getWorkOrderInner(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderInner", workOrderInner);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderInner", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderInner(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderInnerService.deleteWorkOrderInner(workOrderNum);
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

    @RequestMapping(value = "/addWorkWorkOrderInner", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkWorkOrderInner(Head head, WorkOrderInner workOrderInner){
        try{
            workOrderInnerService.addWorkWorkOrderInner(workOrderInner);
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



    @RequestMapping(value = "/updateWorkOrderInner", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderInner(Head head, WorkOrderInner workOrderInner){
        try{
            workOrderInnerService.updateWorkOrderInner(workOrderInner);
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
