package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderExchangeMapper;
import com.lvshu.model.WorkOrderExchange;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderExchangeService {
    @Autowired
    private WorkOrderExchangeMapper workOrderExchangeMapper;


    public Integer addWorkOrderExchange(WorkOrderExchange workOrderExchange) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderExchangeMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDEREXCHANGE_PREFIX);
            workOrderExchange.setWorkOrderNum(workOrderNum);
            iRet = workOrderExchangeMapper.addWorkOrderExchange(workOrderExchange);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderExchange(WorkOrderExchange workOrderExchange) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderExchangeMapper.updateWorkOrderExchange(workOrderExchange);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderExchange(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderExchangeMapper.deleteWorkOrderExchange(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderExchange getWorkOrderExchange(String workOrderNum) throws Exception{
        WorkOrderExchange workOrderExchange = null;
        try{
            workOrderExchange = workOrderExchangeMapper.getWorkOrderExchange(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderExchange;
    }
}
