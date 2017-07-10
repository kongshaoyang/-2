package com.lvshu.controller;

import com.lvshu.model.ApplyPaperManual;
import com.lvshu.model.Head;
import com.lvshu.service.ApplyPaperManualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 田原 on 2016/12/27.
 */
@Controller
@RequestMapping("/applyManual")
public class ApplyPaperManualController {

    @Autowired
    private ApplyPaperManualService applyPaperManualService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/applyPaperManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyPaperManual(Head head, ApplyPaperManual applyPaperManual) {
        try {
            applyPaperManualService.addApplyPaperManualMapper(applyPaperManual);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/getPaperManualDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getPaperManualDetails(Head head, @RequestParam(value="applyNum", required=false) String applyNum) {
        try {
            ApplyPaperManual applyPaperManual = applyPaperManualService.getApplyPaperManual(applyNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("ApplyPaperManual", applyPaperManual);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/getMyPaperManualList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getMyPaperManualList(Head head, @RequestParam(value="userNum", required=false) String userNum) {
        try {
            List<ApplyPaperManual> list = applyPaperManualService.getApplyPaperManualByUserNum(userNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("ApplyPaperManual", list);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

}
