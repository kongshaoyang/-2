package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.OriginalManualMapper;
import com.lvshu.model.OriginalManual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/29.
 */
@Service
public class OriginalManualService {
    @Autowired
    private OriginalManualMapper originalManualMapper;

    public Integer addOriginalManual(OriginalManual originalManual) throws Exception{
        int iRet = 0;
        try{
            String originalManualNum = originalManualMapper.getOriginalManualNum();
            originalManualNum = TableID.getTabId(originalManualNum, TableID.ORIGINALMANUAL_PREFIX);
            originalManual.setOriginalManualNum(originalManualNum);
            iRet = originalManualMapper.addOriginalManual(originalManual);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateOriginalManual(OriginalManual originalManual) throws Exception{
        int iRet = 0;
        try{
            iRet = originalManualMapper.updateOriginalManual(originalManual);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteOriginalManual(String originalManualNum) throws Exception{
        int iRet = 0;
        try{
            iRet = originalManualMapper.deleteOriginalManual(originalManualNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
