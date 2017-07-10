package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderExperience;
import com.lvshu.service.WorkOrderExperienceService;
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
@RequestMapping("/workOrderExperience")
public class WorkOrderExperienceController {
    @Autowired
    private WorkOrderExperienceService workOrderExperienceService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderExperience", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderExperience(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderExperience workOrderExperience = workOrderExperienceService.getWorkOrderExperience(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderExperience", workOrderExperience);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderExperience", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderExperience(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderExperienceService.deleteWorkOrderExperience(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderExperience", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderExperience(Head head, WorkOrderExperience workOrderExperience){
        try{
            workOrderExperienceService.addWorkOrderExperience(workOrderExperience);
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



    @RequestMapping(value = "/updateWorkOrderExperience", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderExperience(Head head, WorkOrderExperience workOrderExperience){
        try{
            workOrderExperienceService.updateWorkOrderExperience(workOrderExperience);
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
