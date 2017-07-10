package com.lvshu.controller;

import com.lvshu.model.Comment;
import com.lvshu.model.CustomerService;
import com.lvshu.model.Head;
import com.lvshu.service.CommentService;
import com.lvshu.service.CustomerServiceService;
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
@RequestMapping("/custService")
public class CustomerServiceController {
    @Autowired
    private CustomerServiceService customerServiceService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addCustomer(Head head, CustomerService customerService) {
        try {
            customerServiceService.addCustomerService(customerService);
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


    @RequestMapping(value = "/deleteCustomer", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteCustomer(Head head, @RequestParam(value="customerNum", required=false) String customerNum ) {
        try {
            customerServiceService.deleteCustomerServcie(customerNum);
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


}
