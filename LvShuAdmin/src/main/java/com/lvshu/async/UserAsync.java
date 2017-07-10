package com.lvshu.async;

import com.lvshu.common.DateEx;
import com.lvshu.mapper.UserMapper;
import com.lvshu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * Created by 田原 on 2016/12/23.
 */
@Component
public class UserAsync {

    @Autowired
    private UserMapper userMapper;
    /**
     * 更新最后一次登陆时间
     * 更新最近6个月登录次数
     * @param user
     */
    @Async
    public void executeUserTask(User user){
        try{
            DateEx dt = new DateEx();
            user.setLastLoginTime(dt.getDateTimeStandard());
            //13位长：第一位1~C，表示1到12月；后面每两位00到FF代表当前月到往前6月的登录次数  当前月份和第一位不一致时，从第二位开始补两位置为01，并删除最后两位
            user.setLoginTimes("B01020304FF");
            userMapper.updateUserAsyn(user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
