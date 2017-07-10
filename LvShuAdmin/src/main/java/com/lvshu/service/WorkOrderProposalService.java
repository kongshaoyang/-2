package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.WorkOrderProposalMapper;
import com.lvshu.model.WorkOrderProposal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2017/1/5.
 */
@Service
public class WorkOrderProposalService {
    @Autowired
    private WorkOrderProposalMapper workOrderProposalMapper;


    public Integer addWorkOrderProposal(WorkOrderProposal workOrderProposal) throws Exception{
        int iRet = 0;
        try{
            String workOrderNum = workOrderProposalMapper.getWorkOrderNum();
            workOrderNum = TableID.getTabId(workOrderNum, TableID.WORKORDERPROPOSAL_PREFIX);
            workOrderProposal.setWorkOrderNum(workOrderNum);
            iRet = workOrderProposalMapper.addWorkOrderProposal(workOrderProposal);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateWorkOrderProposal(WorkOrderProposal workOrderProposal) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderProposalMapper.updateWorkOrderProposal(workOrderProposal);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteWorkOrderProposal(String workOrderNum) throws Exception{
        int iRet = 0;
        try{
            iRet = workOrderProposalMapper.deleteWorkOrderProposal(workOrderNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public WorkOrderProposal getWorkOrderProposal(String workOrderNum) throws Exception{
        WorkOrderProposal workOrderProposal = null;
        try{
            workOrderProposal = workOrderProposalMapper.getWorkOrderProposal(workOrderNum);
        }catch (Exception e){
            throw e;
        }
        return workOrderProposal;
    }
}
