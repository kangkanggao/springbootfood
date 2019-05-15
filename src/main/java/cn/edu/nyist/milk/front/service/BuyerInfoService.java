package cn.edu.nyist.milk.front.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.milk.model.BuyerAddress;
import cn.edu.nyist.milk.model.BuyerInfo;

public interface BuyerInfoService {
	@Transactional(readOnly = true)
	BuyerInfo find(String buyerName, String buyerPwd);

	@Transactional(readOnly = true)
	BuyerInfo findBuyerByName(String name);

	@Transactional(readOnly = true)
	BuyerInfo saveBuyer(BuyerInfo buyerInfo);

	@Transactional(readOnly = true)
	BuyerAddress saveAddress(BuyerAddress buyerAddress);

	@Transactional(readOnly = true)
	List<BuyerAddress> findByBid(int bid);

	@Transactional(readOnly = true)
	void deleAddress(int id);

	@Transactional(readOnly = true)
	BuyerAddress findById(int aid);

	@Transactional(readOnly = true)
	BuyerInfo findBuyerByPwd(String pwd);
}