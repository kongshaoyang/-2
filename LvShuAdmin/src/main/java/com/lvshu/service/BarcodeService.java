package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.BarcodeMapper;
import com.lvshu.model.Barcode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/29.
 */
@Service
public class BarcodeService {

    @Autowired
    private BarcodeMapper barcodeMapper;

    public Integer addBarcode(Barcode barcode) throws Exception{
        int iRet = 0;
        try{
            String barcodeNum = barcodeMapper.getBarcodeNum();
            barcodeNum = TableID.getTabId(barcodeNum, TableID.MANUFACTURER_PREFIX);
            barcode.setBarcodeNum(barcodeNum);
            iRet = barcodeMapper.addBarcode(barcode);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateBarcode(Barcode barcode) throws Exception{
        int iRet = 0;
        try{
            iRet = barcodeMapper.updateBarcode(barcode);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteBarcode(String barcodeNum) throws Exception{
        int iRet = 0;
        try{
            iRet = barcodeMapper.deleteBarcode(barcodeNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
