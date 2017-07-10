package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderContract;
import com.lvshu.service.WorkOrderContractService;
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
@RequestMapping("/workOrderContract")
public class WorkOrderContractController {
    @Autowired
    private WorkOrderContractService workOrderContractService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderContract", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderContract(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderContract workOrderContract = workOrderContractService.getWorkOrderContract(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Product", workOrderContract);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderContract", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderContract(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderContractService.deleteWorkOrderContract(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderContract", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderContract(Head head, WorkOrderContract workOrderContract){
        try{
            workOrderContractService.addWorkOrderContract(workOrderContract);
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



    @RequestMapping(value = "/updateWorkOrderContract", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderContract(Head head, WorkOrderContract workOrderContract){
        try{
            workOrderContractService.updateWorkOrderContract(workOrderContract);
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
