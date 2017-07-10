package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.Manual;
import com.lvshu.service.ManualService;
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
 * Created by 田原 on 2016/12/21.
 */

@Controller
@RequestMapping({"/manual"})
public class ManualController {

    @Autowired
    private ManualService manualService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());


    /**
     * 获取说明书列表
     * @param head
     * @return
     */
    @RequestMapping(value = "/getManualList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getManualList(Head head){
        List<Manual> list = null;
        try{
            list = manualService.getManualList(head.getUserNum());
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("Manual", list);
        return map;
    }

    /**
     * 获得说明书详情
     * @param head
     * @param manualNum
     * @return
     */
    @RequestMapping(value = "/getManual", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getManual(Head head, @RequestParam(value="manualNum", required=false) String manualNum){
        Manual manual = null;
        try{
            manual = manualService.getManualByManualNum(manualNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            if(manual != null)
            {
                map.put("Manual", manual);
            }
            else
            {
                map.put("Manual", new Manual());
            }

        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }


    @RequestMapping(value = "/searchManual", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> searchManual(Head head, @RequestParam(value="manualName", required=false) String manualName) {
        try {
            List<Manual> list = manualService.searchManualByManualName(manualName);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Manual", list);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }

    @RequestMapping(value = "/addManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addManual(Head head, Manual manual) {
        try {
            manualService.addManual(manual);
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


    @RequestMapping(value = "/applyPaperManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyPaperManual(Head head, Manual manual) {
        try {
            //manualService.addManual(manual);
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




    @RequestMapping(value = "/deleteManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteManual(Head head, @RequestParam(value="manualNum", required=false) String manualNum){
        try{
            manualService.deleteManual(manualNum);
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


    @RequestMapping(value = "/updateManual", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateManual(Head head, Manual manual){
        try{
            manualService.updateManual(manual);
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
