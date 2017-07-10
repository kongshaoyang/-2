package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderBarcodeMapper;
import com.lvshu.model.WorkOrderBarcode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderBarcodeService {
    @Autowired
    private WorkOrderBarcodeMapper workOrderBarcodeMapper;


    public Integer addWorkOrderBarcode(WorkOrderBarcode workOrderBarcode) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderBarcodeMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERBARCODE_PREFIX);
            workOrderBarcode.setWorkOrderNum(workOrderNum);
            iRet = workOrderBarcodeMapper.addWorkOrderBarcode(workOrderBarcode);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderBarcode(WorkOrderBarcode workOrderBarcode) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderBarcodeMapper.updateWorkOrderBarcode(workOrderBarcode);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderBarcode(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderBarcodeMapper.deleteWorkOrderBarcode(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderBarcode getWorkOrderBarcode(String workOrderNum) throws Exception{
        WorkOrderBarcode workOrderBarcode = null;
        try{
            workOrderBarcode = workOrderBarcodeMapper.getWorkOrderBarcode(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderBarcode;
    }
}
