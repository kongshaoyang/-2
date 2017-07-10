package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderManualPaper;
import com.lvshu.service.WorkOrderManualPaperService;
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
@RequestMapping("/workOrderManualPaper")
public class WorkOrderManualPaperController {
    @Autowired
    private WorkOrderManualPaperService workOrderManualPaperService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderManualPaper", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderManualPaper(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderManualPaper workOrderManualPaper = workOrderManualPaperService.getWorkOrderManualPaper(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderManualPaper", workOrderManualPaper);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderManualPaper", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderManualPaper(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderManualPaperService.deleteWorkOrderManualPaper(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderManualPaper", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderManualPaper(Head head, WorkOrderManualPaper workOrderManualPaper){
        try{
            workOrderManualPaperService.addWorkOrderManualPaper(workOrderManualPaper);
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



    @RequestMapping(value = "/updateWorkOrderManualPaper", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderManualPaper(Head head, WorkOrderManualPaper workOrderManualPaper){
        try{
            workOrderManualPaperService.updateWorkOrderManualPaper(workOrderManualPaper);
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
