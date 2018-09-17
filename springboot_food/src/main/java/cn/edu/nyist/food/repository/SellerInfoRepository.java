package cn.edu.nyist.food.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.edu.nyist.food.model.SellerInfo;

public interface SellerInfoRepository extends JpaRepository<SellerInfo, String>{
    @Query("from SellerInfo where username=:username and password=:password")
	SellerInfo find(@Param("username")String username,@Param("password")String password); 
}
