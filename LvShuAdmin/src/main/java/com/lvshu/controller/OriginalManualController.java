package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.OriginalManual;
import com.lvshu.service.OriginalManualService;
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
 * Created by 田原 on 2016/12/29.
 */
@Controller
@RequestMapping("/originalManual")
public class OriginalManualController {

    @Autowired
    private OriginalManualService originalManualService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/deleteOriginalManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteOriginalManual(Head head, @RequestParam(value="originalManualNum", required=false) String originalManualNum){
        try{
            originalManualService.deleteOriginalManual(originalManualNum);
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

    @RequestMapping(value = "/addOriginalManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addOriginalManual(Head head, OriginalManual originalManual){
        try{
            originalManualService.addOriginalManual(originalManual);
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



    @RequestMapping(value = "/updateOriginalManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateOriginalManual(Head head, OriginalManual originalManual){
        try{
            originalManualService.updateOriginalManual(originalManual);
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
