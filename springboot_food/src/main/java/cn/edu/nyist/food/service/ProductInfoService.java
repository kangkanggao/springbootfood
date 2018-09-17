package cn.edu.nyist.food.service;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoService {
	//添加商品
	@Transactional
	ProductInfo save(ProductInfo productInfo);
	//查找商品
	@Transactional(readOnly=true)
	Page<ProductInfo> findAllProductInfos(int pageNo,String productName,int categoryType);
    //根据id查找
	@Transactional(readOnly=true)
	ProductInfo findById(String productId);
	//删除商品
	@Transactional
	void del(String productId);
	//修改商品
	@Transactional
	ProductInfo update(ProductInfo productInfo);
}
