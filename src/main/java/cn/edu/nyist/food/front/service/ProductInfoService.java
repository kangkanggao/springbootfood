package cn.edu.nyist.food.front.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoService {

	// 查找商品
	@Transactional(readOnly = true)
	Page<ProductInfo> findAllProductInfos(int pageNo, String productName, int productType, String sortName, int temp);

	// 模糊查找商品
	@Transactional(readOnly = true)
	Page<ProductInfo> findOneProductInfo(String productName);

	// 根据id查找
	@Transactional(readOnly = true)
	ProductInfo findById(int productId);
	//根据类型查找
	@Transactional(readOnly = true)
	List<ProductInfo> findProductInfosByType(int productType);
	
	// 修改商品
	@Transactional
	ProductInfo update(ProductInfo productInfo);
}
