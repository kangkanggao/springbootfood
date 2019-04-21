package cn.edu.nyist.food.front.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.ProductInfo;
@Repository("frontProductInfoRepository")
public interface ProductInfoRepository extends JpaRepository<ProductInfo,Integer>,JpaSpecificationExecutor<ProductInfo> {
	
	public ProductInfo findByProductNameLike(@Param("productName")String productName);

	public List<ProductInfo> findByProductTid(@Param("productTid")Integer productTid);
}
