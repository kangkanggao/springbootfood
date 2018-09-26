package cn.edu.nyist.food.back.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.back.repository.SellerInfoRepository;
import cn.edu.nyist.food.back.service.SellerService;
import cn.edu.nyist.food.model.SellerInfo;
@Service
public class SellerSerivceImpl implements SellerService{
    @Autowired
    private SellerInfoRepository sellerInfoRepository;
	@Override
	public SellerInfo findSellerInfo(String username, String password) {
		return sellerInfoRepository.findByUsernameAndPassword(username, password);
	}

}
