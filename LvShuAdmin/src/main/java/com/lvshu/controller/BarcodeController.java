package com.lvshu.controller;

import com.lvshu.model.Barcode;
import com.lvshu.model.Head;
import com.lvshu.service.BarcodeService;
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
 * Created by 田原 on 2016/12/22.
 */
@Controller
@RequestMapping("/barcode")
public class BarcodeController {

    @Autowired
    private BarcodeService barcodeService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/deleteBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteBarcode(Head head, @RequestParam(value="barcodeNum", required=false) String barcodeNum){
        try{
            barcodeService.deleteBarcode(barcodeNum);
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

    @RequestMapping(value = "/addBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addBarcode(Head head, Barcode barcode){
        try{
            barcodeService.addBarcode(barcode);
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



    @RequestMapping(value = "/updateBarcode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateBarcode(Head head, Barcode barcode){
        try{
            barcodeService.updateBarcode(barcode);
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
