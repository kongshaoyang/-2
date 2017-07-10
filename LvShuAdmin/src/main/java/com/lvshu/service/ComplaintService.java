package com.lvshu.service;

import com.lvshu.common.DateEx;
import com.lvshu.common.TableID;
import com.lvshu.mapper.ComplaintMapper;
import com.lvshu.model.Complaint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ComplaintService {
    @Autowired
    private ComplaintMapper complaintMapper;

    public boolean addComplaint(Complaint complaint) throws Exception {
        boolean bRet = false;
        try {
            String complaintNum = complaintMapper.getComplaintNum();
            complaintNum = TableID.getTabId(complaintNum, TableID.COMPLAINT_PREFIX);
            complaint.setComplaintNum(complaintNum);
            DateEx dt = new DateEx();
            complaint.setPublishTime(dt.getDateTimeStandard());
            complaintMapper.addComplaint(complaint);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public Complaint getComplaint(String complaintNum) throws Exception {
        Complaint complaint = null;
        try {
            complaint = complaintMapper.getComplaint(complaintNum);
        } catch (Exception e) {
            throw e;
        }
        return complaint;
    }


    public List<Complaint> getComplaintByUserNum(String userNum) throws Exception{
        List<Complaint> list = null;
        try {
            list = complaintMapper.getComplaintByUserNum(userNum);
        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
