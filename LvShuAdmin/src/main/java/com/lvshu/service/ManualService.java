package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.ManualMapper;
import com.lvshu.model.Manual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */

@Service
public class ManualService {
    @Autowired
    private ManualMapper manualMapper;

    public List<Manual> getManualList(String userNum) throws Exception {
        List<Manual> list = null;
        try {
            list = manualMapper.getManualList(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }


    public Manual getManualByManualNum(String manualNum) throws Exception {
        Manual manual = null;
        try {
            manual = manualMapper.getManualByManualNum(manualNum);
        } catch (Exception e) {
            throw e;
        }
        return manual;
    }

    public List<Manual> searchManualByManualName(String manualName) throws Exception {
        List<Manual> list = null;
        try {
            list = manualMapper.searchManualByManualName(manualName);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public void addManual(Manual manual) throws Exception {
        try {
            String manualNum = manualMapper.getManualNum();
            manualNum = TableID.getTabId(manualNum, TableID.MANUAL_PREFIX);
            DateEx dt = new DateEx();
            manual.setManualNum(manualNum);
            manual.setCreateTime(dt.getDateTimeStandard());
            manual.setLastUpdateTime(dt.getDateTimeStandard());
            manualMapper.addManual(manual);
        } catch (Exception e) {
            throw e;
        }
    }



    public Integer updateManual(Manual manual) throws Exception{
        int iRet = 0;
        try{
            iRet = manualMapper.updateManual(manual);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteManual(String manualNum) throws Exception{
        int iRet = 0;
        try{
            iRet = manualMapper.deleteManual(manualNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }



}
