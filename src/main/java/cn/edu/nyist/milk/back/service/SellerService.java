package cn.edu.nyist.milk.back.service;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.milk.model.SellerInfo;

public interface SellerService {
	@Transactional(readOnly = true)
	SellerInfo findSellerInfo(String username, String password);
}
