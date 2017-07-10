package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.ManualSegment;
import com.lvshu.service.ManualSegmentService;
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
 * Created by 田原 on 2016/12/22.
 */

@Controller
@RequestMapping({"/segment"})
public class ManualSegmentController {
    @Autowired
    private ManualSegmentService msegmentService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    /**
     * 获取说明书列表
     * @param head
     * @return
     */
    @RequestMapping(value = "/getManualSegmentList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getManualList(Head head, @RequestParam(value="manualNum", required=false) String manualNum, @RequestParam(value="segmentNums", required=false) String segmentNums){
        List<ManualSegment> list = null;
        try{
            list = msegmentService.getManualSegmentList(manualNum, segmentNums);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("ManualSegment", list);
        return map;
    }


    @RequestMapping(value = "/deleteManualSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteManualSegment(Head head, @RequestParam(value="segmentNum", required=false) String segmentNum){
        try{
            msegmentService.deleteManualSegment(segmentNum);
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

    @RequestMapping(value = "/addManualSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addManualSegment(Head head, ManualSegment manualSegment){
        try{
            msegmentService.addManualSegment(manualSegment);
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



    @RequestMapping(value = "/updateManualSegment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateManualSegment(Head head, ManualSegment manualSegment){
        try{
            msegmentService.updateManualSegment(manualSegment);
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
