package com.lvshu.controller;

import com.lvshu.model.Head;
import com.lvshu.model.ManualCatalog;
import com.lvshu.service.ManualCatalogService;
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
@RequestMapping("/catalog")
public class ManualCatalogController {

    @Autowired
    private ManualCatalogService mcatalogService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    /**
     * 获取说明书列表
     * @param head
     * @return
     */
    @RequestMapping(value = "/getManualCatalogList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getManualList(Head head, @RequestParam(value="manualNum", required=false) String manualNum){
        List<ManualCatalog> list = null;
        try{
            list = mcatalogService.getMCatalogListByManualNum(manualNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        map.put("ManualCatalog", list);
        return map;
    }


    @RequestMapping(value = "/deleteManualCatalog", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteManualCatalog(Head head, @RequestParam(value="catalogNum", required=false) String catalogNum){
        try{
            mcatalogService.deleteManualCatalog(catalogNum);
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

    @RequestMapping(value = "/addManualCatalog", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addManualCatalog(Head head, ManualCatalog manualCatalog){
        try{
            mcatalogService.addManualCatalog(manualCatalog);
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



    @RequestMapping(value = "/updateManualCatalog", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateManualCatalog(Head head, ManualCatalog manualCatalog){
        try{
            mcatalogService.updateManualCatalog(manualCatalog);
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
