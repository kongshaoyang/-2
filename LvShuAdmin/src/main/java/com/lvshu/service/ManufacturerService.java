package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ManufacturerMapper;
import com.lvshu.model.Manufacturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ManufacturerService {
    @Autowired
    private ManufacturerMapper manufacturerMapper;

    public Manufacturer getManufacturer(String manufacturerNum) throws Exception{

        Manufacturer manufacturer = null;
        try{
            manufacturer = manufacturerMapper.getManufacturer(manufacturerNum);
        }
        catch (Exception e){
            throw e;
        }
        return manufacturer;
    }

    public Integer addManufacturer(Manufacturer manufacturer) throws Exception{
        int iRet = 0;
        try{
            String manufacturerNum = manufacturerMapper.getManufacturerNum();
            manufacturerNum = TableID.getTabId(manufacturerNum, TableID.MANUFACTURER_PREFIX);
            manufacturer.setManufacturerNum(manufacturerNum);
            iRet = manufacturerMapper.addManufacturer(manufacturer);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateManufacturer(Manufacturer manufacturer) throws Exception{
        int iRet = 0;
        try{
            iRet = manufacturerMapper.updateManufacturer(manufacturer);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteByManufacturerNum(String manufacturerNum) throws Exception{
        int iRet = 0;
        try{
            iRet = manufacturerMapper.deleteByManufacturerNum(manufacturerNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer deleteByManufacturerNumType(String manufacturerNum, String type) throws Exception{
        int iRet = 0;
        try{
            iRet = manufacturerMapper.deleteByManufacturerNumType(manufacturerNum, type);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
