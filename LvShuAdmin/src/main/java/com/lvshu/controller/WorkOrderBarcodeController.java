package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.WorkOrderBarcode;
import com.lvshu.service.WorkOrderBarcodeService;
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
@RequestMapping("/workOrderBarcode")
public class WorkOrderBarcodeController {
    @Autowired
    private WorkOrderBarcodeService workOrderBarcodeService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getWorkOrderBarcode", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getWorkOrderBarcode(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            WorkOrderBarcode workOrderBarcode = workOrderBarcodeService.getWorkOrderBarcode(workOrderNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("WorkOrderBarcode", workOrderBarcode);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }


    @RequestMapping(value = "/deleteWorkOrderBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteWorkOrderBarcode(Head head, @RequestParam(value="workOrderNum", required=false) String workOrderNum){
        try{
            workOrderBarcodeService.deleteWorkOrderBarcode(workOrderNum);
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

    @RequestMapping(value = "/addWorkOrderBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addWorkOrderBarcode(Head head, WorkOrderBarcode workOrderBarcode){
        try{
            workOrderBarcodeService.addWorkOrderBarcode(workOrderBarcode);
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



    @RequestMapping(value = "/updateWorkOrderBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateWorkOrderBarcode(Head head, WorkOrderBarcode workOrderBarcode){
        try{
            workOrderBarcodeService.updateWorkOrderBarcode(workOrderBarcode);
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
