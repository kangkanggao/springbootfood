package cn.edu.nyist.milk.back.repository;

import org.springframework.data.repository.Repository;

import cn.edu.nyist.milk.model.SellerInfo;

@org.springframework.stereotype.Repository(value="backSellerInfoRepository")
public interface SellerInfoRepository extends Repository<SellerInfo,Integer>{
	SellerInfo findByUsernameAndPassword(String username,String password);
}
