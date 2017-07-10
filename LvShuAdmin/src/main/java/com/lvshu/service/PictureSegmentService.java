package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.PictureSegmentMapper;
import com.lvshu.model.PictureSegment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/4.
 */
@Service
public class PictureSegmentService {

    @Autowired
    private PictureSegmentMapper pictureSegmentMapper;


    public Integer addPictureSegment(PictureSegment pictureSegment) throws Exception{
        int iRet = 0;
        try{
            String segmentNum = pictureSegmentMapper.getSegmentNum();
            segmentNum = TableID.getTabId(segmentNum, TableID.PICTURESEGMENT_PREFIX);
            pictureSegment.setSegmentNum(segmentNum);
            iRet = pictureSegmentMapper.addPictureSegment(pictureSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updatePictureSegment(PictureSegment pictureSegment) throws Exception{
        int iRet = 0;
        try{
            iRet = pictureSegmentMapper.updatePictureSegment(pictureSegment);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deletePictureSegment(String segmentNum) throws Exception{
        int iRet = 0;
        try{
            iRet = pictureSegmentMapper.deletePictureSegment(segmentNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public PictureSegment getPictureSegment(String segmentNum) throws Exception{
        PictureSegment pictureSegment = null;
        try{
            pictureSegment = pictureSegmentMapper.getPictureSegment(segmentNum);
        }catch (Exception e){
            throw e;
        }
        return pictureSegment;
    }

}
