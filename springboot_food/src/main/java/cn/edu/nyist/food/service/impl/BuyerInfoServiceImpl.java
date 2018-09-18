package cn.edu.nyist.food.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.model.BuyerInfo;
import cn.edu.nyist.food.repository.BuyerInfoRepository;
import cn.edu.nyist.food.service.BuyerInfoService;
@Service
public class BuyerInfoServiceImpl implements BuyerInfoService{
	@Autowired
	private BuyerInfoRepository buyerInfoRepository;
	@Override
	public BuyerInfo find(String buyerName, String buyerPwd) {
		
		return buyerInfoRepository.findByBuyerNameAndBuyerPwd(buyerName, buyerPwd);
	}

	@Override
	public BuyerInfo findBuyerByName(String name) {
		
		return buyerInfoRepository.findByBuyerName(name);
	}

	@Override
	public BuyerInfo saveBuyer(BuyerInfo buyerInfo) {
	
		return buyerInfoRepository.save(buyerInfo);
	}

	

}
