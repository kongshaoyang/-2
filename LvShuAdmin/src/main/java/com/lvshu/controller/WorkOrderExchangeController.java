package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderExchange;
import com.lvshu.service.WorkOrderExchangeService;
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
@RequestMapping("/workOrderExchange")
public class WorkOrderExchangeController {
    @Autowired
    private WorkOrderExchangeService workOrderExchangeService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderExchange", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderExchange(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderExchange workOrderExchange = workOrderExchangeService.getWorkOrderExchange(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderExchange", workOrderExchange);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderExchange", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderExchange(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderExchangeService.deleteWorkOrderExchange(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderExchange", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderExchange(Head head, WorkOrderExchange workOrderExchange){
        try{
            workOrderExchangeService.addWorkOrderExchange(workOrderExchange);
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



    @RequestMapping(value = "/updateWorkOrderExchange", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderExchange(Head head, WorkOrderExchange workOrderExchange){
        try{
            workOrderExchangeService.updateWorkOrderExchange(workOrderExchange);
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
