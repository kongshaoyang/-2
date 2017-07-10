package com.lvshu.controller;

import com.lvshu.model.Experience;
import com.lvshu.model.Head;
import com.lvshu.service.ExperienceService;
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
@RequestMapping("/experience")
public class ExperienceController {

    @Autowired
    private ExperienceService expService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/publishExperience", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> publishExperience(Head head, Experience experience) {
        try {
            expService.addExperience(experience);
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

    @RequestMapping(value = "/getExperienceDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getExperienceDetails(Head head, @RequestParam(value="experienceNum", required=false) String experienceNum) {
        try {
            Experience experience = expService.getExperience(experienceNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Experience", experience);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/getMyExperienceList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getMyExperienceList(Head head, @RequestParam(value="userNum", required=false) String userNum) {
        try {
            List<Experience> list = expService.getExperienceByUserNum(userNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Experience", list);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }
}
