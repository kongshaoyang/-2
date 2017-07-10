package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.ApplyPaperManualMapper;
import com.lvshu.model.ApplyPaperManual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/27.
 */
@Service
public class ApplyPaperManualService {
    @Autowired
    private ApplyPaperManualMapper applyPaperManualMapper;


    public boolean addApplyPaperManualMapper(ApplyPaperManual applyPaperManual) throws Exception {
        boolean bRet = false;
        try {
            String applyNumNum = applyPaperManualMapper.getApplyNumNum();
            applyNumNum = TableID.getTabId(applyNumNum, TableID.APPLYPAPERMANUAL_PREFIX);
            applyPaperManual.setApplyNum(applyNumNum);
            DateEx dt = new DateEx();
            applyPaperManual.setApplyTime(dt.getDateTimeStandard());
            applyPaperManualMapper.addApplyPaperManual(applyPaperManual);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public ApplyPaperManual getApplyPaperManual(String applyNumNum) throws Exception {
        ApplyPaperManual applyPaperManual = null;
        try {
            applyPaperManual = applyPaperManualMapper.getApplyPaperManual(applyNumNum);
        } catch (Exception e) {
            throw e;
        }
        return applyPaperManual;
    }


    public List<ApplyPaperManual> getApplyPaperManualByUserNum(String userNum) throws Exception{
        List<ApplyPaperManual> list = null;
        try {
            list = applyPaperManualMapper.getCommentByUserNum(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
