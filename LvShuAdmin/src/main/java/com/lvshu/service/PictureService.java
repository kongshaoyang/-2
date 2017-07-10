package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.PictureMapper;
import com.lvshu.model.Picture;
import com.lvshu.model.PictureRelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class PictureService {
    @Autowired
    private PictureMapper pictureMapper;

    public Picture getPicture(String pictureNum) throws Exception{
        Picture picture = null;
        try{
            picture = pictureMapper.getPicture(pictureNum);
        }catch (Exception e){
            throw e;
        }
        return picture;
    }


    public List<PictureRelation> getPictureRelationList(String pictureNum) throws Exception{
        List<PictureRelation> list = null;
        try{
            list = pictureMapper.getPictureRelationList(pictureNum);
        }catch(Exception e){
            throw e;
        }
        return list;
    }




    public Integer addPicture(Picture picture) throws Exception{
        int iRet = 0;
        try{
            String pictureNum = pictureMapper.getPictureNum();
            pictureNum = TableID.getTabId(pictureNum, TableID.PICTURE_PREFIX);
            picture.setPictureNum(pictureNum);
            iRet = pictureMapper.addPicture(picture);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updatePicture(Picture picture) throws Exception{
        int iRet = 0;
        try{
            iRet = pictureMapper.updatePicture(picture);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deletePicture(String pictureNum) throws Exception{
        int iRet = 0;
        try{
            iRet = pictureMapper.deletePicture(pictureNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
