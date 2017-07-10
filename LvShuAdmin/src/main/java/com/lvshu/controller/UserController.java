package com.lvshu.controller;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lvshu.async.UserAsync;
import com.lvshu.common.JacksonHelper;
import com.lvshu.common.StringUtils4J;
import com.lvshu.model.Head;
import com.lvshu.model.User;
import com.lvshu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 田原 on 2016/12/22.
 */

/**
 * 用户模块controller
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private UserAsync userAsync;

    static Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> postUser(Head head, User user) {
        try {
            if (!StringUtils4J.isEmpty(user.getMobile()) && userService.queryUser(user.getMobile()) > 0) {
                //先查询用户有没有注册过，如果注册过了，则告知已经注册过
                head.setRetCode("00");
                head.setRetDesc("对不起，您的手机号已经被注册");
            } else if (userService.addUser(user)) {
                head.setRetCode("00");
                head.setRetDesc("SUCCESS");
            } else {
                head.setRetCode("01");
                head.setRetDesc("注册用户失败，请联系平台");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("HEAD", head);
        return map;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        Head head = null;
        try {
            System.out.println("ssssssssssssssssssssssssssssss");
//            System.out.println(">>>"+map);
//            head = JacksonHelper.mapToObj(map.get("Head"), Head.class);
//
//            User user = JacksonHelper.mapToObj(map.get("Body"), User.class);
//            System.out.println(head.toString());
//            System.out.println(user.toString());toString
            //System.out.println(user.toString());
            //System.out.println(request.getRequestedSessionId());
            //System.out.println(request.getSession().getId());
            //user = userService.login(user);
            //head.setRetCode("00");
            //head.setRetDesc("SUCCESS");
            //异步执行user登陆后的任务
            //userAsync.executeUserTask(user);
        } catch (Exception e) {
            //head.setRetCode("01");
            //head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        return "system/home";
    }

    @RequestMapping(value = "/bindWeixinID", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> bindWeixinID(Head head, User user) {
        try {
            userService.bindWeixinID(user);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("HEAD", head);
        return map;
    }


    @RequestMapping(value = "/bindAlipayID", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> bindAlipayID(Head head, User user) {
        try {
            userService.bindAlipayID(user);
            head.setRetCode("00");
            head.setRetDesc("SUCCESS");
        } catch (Exception e) {
            head.setRetCode("01");
            head.setRetDesc("FAILED");
            e.printStackTrace();
        }
        map.put("HEAD", head);
        return map;
    }

}
