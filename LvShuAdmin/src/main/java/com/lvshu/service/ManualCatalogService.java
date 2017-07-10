package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ManualCatalogMapper;
import com.lvshu.model.ManualCatalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ManualCatalogService {

    @Autowired
    private ManualCatalogMapper mcatlogMapper;

    public List<ManualCatalog> getMCatalogListByManualNum(String manualNum) throws Exception {
        List<ManualCatalog> mcatalogList = null;
        try {
            mcatalogList = mcatlogMapper.getMCatalogListByManualNum(manualNum);
        } catch (Exception e) {
            throw e;
        }
        return mcatalogList;
    }



    public Integer addManualCatalog(ManualCatalog manualCatalog) throws Exception{
        int iRet = 0;
        try{
            String catalogNum = mcatlogMapper.getManualCatalogNum();
            catalogNum = TableID.getTabId(catalogNum, TableID.MANUALCATALOG_PREFIX);
            manualCatalog.setCatalogNum(catalogNum);
            iRet = mcatlogMapper.addManualCatalog(manualCatalog);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateManualCatalog(ManualCatalog manualCatalog) throws Exception{
        int iRet = 0;
        try{
            iRet = mcatlogMapper.updateManualCatalog(manualCatalog);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteManualCatalog(String catalogNum) throws Exception{
        int iRet = 0;
        try{
            iRet = mcatlogMapper.deleteManualCatalog(catalogNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
