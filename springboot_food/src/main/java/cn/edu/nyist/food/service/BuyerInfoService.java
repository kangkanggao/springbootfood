package cn.edu.nyist.food.service;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.BuyerInfo;

public interface BuyerInfoService {
	@Transactional(readOnly = true)
	BuyerInfo find(String buyerName, String BuyerPwd);

	@Transactional(readOnly = true)
	BuyerInfo findBuyerByName(String name);

	@Transactional
	void saveBuyer();
}
