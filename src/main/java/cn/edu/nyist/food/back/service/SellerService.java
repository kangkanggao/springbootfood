package cn.edu.nyist.food.back.service;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.food.model.SellerInfo;

public interface SellerService {
	@Transactional(readOnly = true)
	SellerInfo findSellerInfo(String username, String password);
}
