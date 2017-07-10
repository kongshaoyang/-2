package com.lvshu.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.lvshu.model.Head;
import com.lvshu.model.ProductList;
import com.lvshu.service.ProductListService;

/**
 * Created by 田原 on 2016/12/22.
 */
@Controller
@RequestMapping("/productList")
public class ProductListController {
	@Autowired
	ProductListService productListService;	
	Map<String, Object> map = Collections.synchronizedMap(new HashMap<String, Object>());
	
	 @RequestMapping(value = "/getProductListDetails", method = RequestMethod.GET)
	 @ResponseBody
	 public Map<String, Object> getProductDetails(Head head){
		 System.out.println(">>>>进入产品查询控制层");
		 List<ProductList> productList = null;
	      try{
	    	  productList = productListService.getProductList();
	          head.setRetCode("00");
	          head.setRetDesc("SUCCESS");
	      	}catch (Exception e){
	          head.setRetCode("01");
	          head.setRetDesc("FAILED");
	          e.printStackTrace();
	        }
	        map.put("Head", head);
	        map.put("productList", productList);
	        return map;
	    }
}
