package com.lvshu.controller;

import com.lvshu.model.*;
import com.lvshu.service.PictureService;
import com.lvshu.service.ProductService;
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
@RequestMapping("/picture")
public class PictureController {
    @Autowired
    private PictureService pictureService;

    Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/getPictureDetails", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getProductDetails(Head head, @RequestParam(value="pictureNum", required=false) String pictureNum){
        try{
            Picture picture = pictureService.getPicture(pictureNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("Picture", picture);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);

        return map;
    }

    @RequestMapping(value = "/getRefPictureList", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getRefPictureList(Head head, @RequestParam(value="pictureNum", required=false) String pictureNum){
        try{
            List<PictureRelation> list = pictureService.getPictureRelationList(pictureNum);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
            map.put("PictureRelation", list);
        }catch (Exception e){
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("Head", head);
        return map;
    }




    @RequestMapping(value = "/deletePicture", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deletePicture(Head head, @RequestParam(value="pictureNum", required=false) String pictureNum){
        try{
            pictureService.deletePicture(pictureNum);
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

    @RequestMapping(value = "/addPicture", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPicture(Head head, Picture picture){
        try{
            pictureService.addPicture(picture);
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



    @RequestMapping(value = "/updatePicture", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updatePicture(Head head, Picture picture){
        try{
            pictureService.updatePicture(picture);
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
