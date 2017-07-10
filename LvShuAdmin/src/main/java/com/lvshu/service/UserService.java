package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.StringUtils4J;
import com.lvshu.common.TableID;
import com.lvshu.mapper.UserMapper;
import com.lvshu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by 田原 on 2016/12/22.
 */

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public boolean addUser(User user) throws Exception {
        boolean bRet = false;
        try {
            String userNum = userMapper.getUserNum();
            userNum = TableID.getTabId(userNum, TableID.USER_PREFIX);
            user.setUserNum(userNum);
            DateEx dt = new DateEx();
            user.setLastLoginTime(dt.getDateTimeStandard());
            user.setRegisterTime(dt.getDateTimeStandard());
            user.setLoginTimes("1");
            userMapper.addUser(user);
            bRet = true;
        } catch (Exception e) {
            throw e;
            //异常处理
        }
        return bRet;
    }


    public Integer queryUser(String mobile) throws Exception {
        Integer iRet = 0;
        try {
            iRet = userMapper.loginByMobile(mobile);
        } catch (Exception e) {
            throw e;
        }
        return iRet;
    }

    public User login(User user) throws Exception {
        User usr = null;
        try {
            /*usr = userMapper.getUserByMobile(user.getMobile());
            if (!StringUtils4J.isEmpty(user.getMobile())){
                usr = userMapper.getUserByMobile(user.getMobile());
            } else if (!StringUtils4J.isEmpty(user.getWeixinId()) ){
                usr = userMapper.getUserByWeixin(user.getWeixinId());
            } else {
            }*/
        } catch (Exception e) {
            throw e;
        }
        return usr;
    }

    public boolean bindWeixinID(User user) throws Exception{
        boolean bRet = false;
        try {
            userMapper.updateWeixinID(user);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public boolean bindAlipayID(User user) throws Exception{
        boolean bRet = false;
        try {
            //userMapper.updateAlipayId(user);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }
}
