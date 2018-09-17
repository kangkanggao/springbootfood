package cn.edu.nyist.food.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nyist.food.model.BuyerInfo;

public interface BuyerInfoRepository extends CrudRepository<BuyerInfo, String> {

	BuyerInfo findByBuyerNameAndBuyerPwd(String buyerName, String buyerPwd);

	BuyerInfo findByBuyerName(String name);
    
	
}
