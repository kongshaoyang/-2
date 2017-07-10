package com.lvshu.service;

import com.lvshu.mapper.ProductListMapper;
import com.lvshu.model.Product;
import com.lvshu.model.ProductList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 田原 on 2016/12/22.
 */
@Service
public class ProductListService {
    @Autowired
    private ProductListMapper productListMapper;
    
    public List<ProductList> getProductList() throws Exception {
    	List<ProductList> list =null;
        try {
        	list = productListMapper.getProductList();
        	for(ProductList pro : list){
        		System.out.println(">>>>>"+pro.getManufacturerNum()+pro.getPsNum()+pro.getShelflife());
        		
        	}
        } catch (Exception e) {
            throw e;
        }
        return list;
    }


}
