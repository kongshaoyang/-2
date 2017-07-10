package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ManualSegmentMapper;
import com.lvshu.model.ManualSegment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ManualSegmentService {

    @Autowired
    private ManualSegmentMapper manualSegmentMapper;

    public List<ManualSegment> getManualSegmentList(String manualNum, String segmentNums) throws Exception{
        List<ManualSegment> list = null;
        try{
            list = manualSegmentMapper.getManualSegmentList(manualNum, segmentNums);
        }catch (Exception e){
            throw e;
        }
        return list;
    }



    public Integer addManualSegment(ManualSegment manualSegment) throws Exception{
        int iRet = 0;
        try{
            String segmentNum = manualSegmentMapper.getManualSegmentNum();
            segmentNum = TableID.getTabId(segmentNum, TableID.MANUALSEGMENT_PREFIX);
            manualSegment.setSegmentNum(segmentNum);
            iRet = manualSegmentMapper.addManualSegment(manualSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateManualSegment(ManualSegment manualSegment) throws Exception{
        int iRet = 0;
        try{
            iRet = manualSegmentMapper.updateManualSegment(manualSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteManualSegment(String segmentNum) throws Exception{
        int iRet = 0;
        try{
            iRet = manualSegmentMapper.deleteManualSegment(segmentNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

}
