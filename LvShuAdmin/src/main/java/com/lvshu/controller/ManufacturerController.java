package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.ManualCatalog;
import com.lvshu.model.Manufacturer;
import com.lvshu.service.ManualService;
import com.lvshu.service.ManufacturerService;
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
@RequestMapping("/manufacturer")
public class ManufacturerController {
    @Autowired
    private ManufacturerService manufacturerService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getManufacturerDetails", method = RequestMethod.GET)
    @ResponseBody
    @Deprecated
    public Map<String, Object> getManufacturerDetails(Head head, @RequestParam(value="manufacturerNum", required=false) String manufacturerNum){
        Manufacturer manufacturer = null;
        try{
            manufacturer = manufacturerService.getManufacturer(manufacturerNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("Manufacturer", manufacturer);
        return map;
    }


    @RequestMapping(value = "/deleteManufacturer", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteManufacturer(Head head, @RequestParam(value="manufacturerNum", required=false) String manufacturerNum, @RequestParam(value="type", required=false) String type){
        try{
            manufacturerService.deleteByManufacturerNum(manufacturerNum);
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

    @RequestMapping(value = "/addManufacturer", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addManufacturer(Head head, Manufacturer manufacturer){
        try{
            manufacturerService.addManufacturer(manufacturer);
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



    @RequestMapping(value = "/updateManufacturer", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateManufacturer(Head head, Manufacturer manufacturer){
        try{
            manufacturerService.updateManufacturer(manufacturer);
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
