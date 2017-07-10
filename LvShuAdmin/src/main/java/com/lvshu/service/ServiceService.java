package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ServiceService {
    @Autowired
    private ServiceMapper serviceMapper;

    public com.lvshu.model.Service getService(String serviceNum) throws Exception{
        com.lvshu.model.Service service = null;
        try{
            service = serviceMapper.getService(serviceNum);
        }
        catch (Exception e){
            throw e;
        }
        return service;
    }


    public Integer addService(com.lvshu.model.Service service) throws Exception{
        int iRet = 0;
        try{
            String serviceNum = serviceMapper.getServiceNum();
            serviceNum = TableID.getTabId(serviceNum, TableID.SERVICE_PREFIX);
            service.setServiceNum(serviceNum);
            iRet = serviceMapper.addService(service);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateService(com.lvshu.model.Service service) throws Exception{
        int iRet = 0;
        try{
            iRet = serviceMapper.updateService(service);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteService(String serviceNum) throws Exception{
        int iRet = 0;
        try{
            iRet = serviceMapper.deleteService(serviceNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
