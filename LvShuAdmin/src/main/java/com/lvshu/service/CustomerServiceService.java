package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.CustomerServiceMapper;
import com.lvshu.model.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/27.
 */
@Service
public class CustomerServiceService {
    @Autowired
    private CustomerServiceMapper customerServiceMapper;


    public boolean addCustomerService(CustomerService customerService) throws Exception {
        boolean bRet = false;
        try {
            String customerNum = customerServiceMapper.getCustomerServiceNum();
            customerNum = TableID.getTabId(customerNum, TableID.CUSTOMERSERVICE_PREFIX);
            customerService.setCustomerNum(customerNum);
            customerServiceMapper.addCustomerService(customerService);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

    public CustomerService getCustomerService(String customerNum) throws Exception {
        CustomerService customerService = null;
        try {
            customerService = customerServiceMapper.getCustomerService(customerNum);
        } catch (Exception e) {
            throw e;
        }
        return customerService;
    }

    public boolean deleteCustomerServcie(String customerNum) throws Exception {
        boolean bRet = false;
        try {
            customerServiceMapper.deleteCUstomer(customerNum);
            bRet = true;
        } catch (Exception e) {
            throw e;
        }
        return bRet;
    }

}
