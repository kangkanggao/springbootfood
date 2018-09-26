package cn.edu.nyist.food.front.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import cn.edu.nyist.food.model.ProductType;

@Repository(value="frontProductTypeReposity")
public interface ProductTypeReposity extends CrudRepository<ProductType, Integer>{
	
	List<ProductType> findAll();
}
