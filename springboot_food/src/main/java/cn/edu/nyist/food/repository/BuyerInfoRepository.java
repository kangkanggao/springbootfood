package cn.edu.nyist.food.repository;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.food.model.BuyerInfo;

public interface BuyerInfoRepository extends CrudRepository<BuyerInfo, Integer> {

	BuyerInfo findByBuyerNameAndBuyerPwd(String buyerName, String buyerPwd);

	BuyerInfo findByBuyerName(String name);

}
