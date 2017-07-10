package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderProposal;
import com.lvshu.service.WorkOrderProposalService;
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
public class WorkOrderProposalController {
    @Autowired
    private WorkOrderProposalService workOrderProposalService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderProposal", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderProposal(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderProposal workOrderProposal = workOrderProposalService.getWorkOrderProposal(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderProposal", workOrderProposal);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderProposal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderProposal(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderProposalService.deleteWorkOrderProposal(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderProposal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderProposal(Head head, WorkOrderProposal workOrderProposal){
        try{
            workOrderProposalService.addWorkOrderProposal(workOrderProposal);
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



    @RequestMapping(value = "/updateWorkOrderProposal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderProposal(Head head, WorkOrderProposal workOrderProposal){
        try{
            workOrderProposalService.updateWorkOrderProposal(workOrderProposal);
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
