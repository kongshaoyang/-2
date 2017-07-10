package com.lvshu.controller;

import com.lvshu.model.Complaint;
import com.lvshu.model.Head;
import com.lvshu.service.ComplaintService;
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
@RequestMapping("/complaint")
public class ComplaintController {
    @Autowired
    private ComplaintService complaintService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/publishComplaint", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> publishComplaint(Head head, Complaint complaint) {
        try {
            complaintService.addComplaint(complaint);
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

    @RequestMapping(value = "/getComplaintDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getComplaintDetails(Head head, @RequestParam(value="complaintNum", required=false) String complaintNum) {
        try {
            Complaint complaint = complaintService.getComplaint(complaintNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Complaint", complaint);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/getMyComplaintList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getMyComplaintList(Head head, @RequestParam(value="userNum", required=false) String userNum) {
        try {
            List<Complaint> list = complaintService.getComplaintByUserNum(userNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Complaint", list);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }
}
