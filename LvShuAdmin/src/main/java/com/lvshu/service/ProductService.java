package com.lvshu.service;

import com.lvshu.common.TableID;
import com.lvshu.mapper.ProductMapper;
import com.lvshu.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;

    public Product getProduct(String productNum) throws Exception {
        Product product = null;
        try {
            product = productMapper.getProduct(productNum);
        } catch (Exception e) {
            throw e;
        }
        return product;
    }

    public Integer addProduct(Product product) throws Exception{
        int iRet = 0;
        try{
            String productNum = productMapper.getProductNum();
            productNum = TableID.getTabId(productNum, TableID.MANUFACTURER_PREFIX);
            product.setManufacturerNum(productNum);
            iRet = productMapper.addProduct(product);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }

    public Integer updateProduct(Product product) throws Exception{
        int iRet = 0;
        try{
            iRet = productMapper.updateProduct(product);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }


    public Integer deleteProduct(String productNum) throws Exception{
        int iRet = 0;
        try{
            iRet = productMapper.deleteProduct(productNum);
        }
        catch (Exception e){
            throw e;
        }
        return iRet;
    }
}
