package cn.edu.nyist.food.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoRepository extends PagingAndSortingRepository<ProductInfo, String>,JpaSpecificationExecutor<ProductInfo> {
	// 通过商品状态查询
	List<ProductInfo> findByProductStatus(Integer productStatus);
	
}
