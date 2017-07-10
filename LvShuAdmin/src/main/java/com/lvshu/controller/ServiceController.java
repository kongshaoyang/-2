package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.Service;
import com.lvshu.service.ServiceService;
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
@RequestMapping("/service")
public class ServiceController {
    @Autowired
    private ServiceService sservice;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getServiceDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getServiceDetails(Head head, @RequestParam(value="sserviceNum", required=false) String sserviceNum){
        Service service = null;
        try{
            service = sservice.getService(sserviceNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("Service", service);
        return map;
    }


    @RequestMapping(value = "/deleteService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteService(Head head, @RequestParam(value="serviceNum", required=false) String serviceNum){
        try{
            sservice.deleteService(serviceNum);
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

    @RequestMapping(value = "/addService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addService(Head head, Service service){
        try{
            sservice.addService(service);
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



    @RequestMapping(value = "/updateService", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateService(Head head, Service service){
        try{
            sservice.updateService(service);
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
