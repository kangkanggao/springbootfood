package cn.edu.nyist.food.front.service;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoService {
	
	//查找商品
	@Transactional(readOnly=true)
	Page<ProductInfo> findAllProductInfos(int pageNo,String productName,int productType);
	
}
