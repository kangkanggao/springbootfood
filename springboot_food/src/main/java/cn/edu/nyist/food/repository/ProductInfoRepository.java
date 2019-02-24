package cn.edu.nyist.food.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.edu.nyist.food.model.ProductInfo;

public interface ProductInfoRepository extends JpaRepository<ProductInfo, String> {
	// 通过商品状态查询
	List<ProductInfo> findByProductStatus(Integer productStatus);
}
