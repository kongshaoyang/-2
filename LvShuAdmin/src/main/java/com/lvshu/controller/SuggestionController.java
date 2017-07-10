package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.Suggestion;
import com.lvshu.service.SuggestionService;
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
@RequestMapping("/suggestion")
public class SuggestionController {
    @Autowired
    private SuggestionService suggestionService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/publishSuggestion", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> publishSuggestion(Head head, Suggestion suggestion) {
        try {
            suggestionService.addSuggestion(suggestion);
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

    @RequestMapping(value = "/getSuggestionDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getSuggestionDetails(Head head, @RequestParam(value="suggestionNum", required=false) String suggestionNum) {
        try {
            Suggestion suggestion = suggestionService.getSuggestion(suggestionNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Suggestion", suggestion);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }

    @RequestMapping(value = "/getMySuggestionList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getMySuggestionList(Head head, @RequestParam(value="userNum", required=false) String userNum) {
        try {
            List<Suggestion> list = suggestionService.getSuggestionByUserNum(userNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Suggestion", list);
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }
}
