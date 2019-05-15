package cn.edu.nyist.milk.front.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.milk.model.ProductType;

public interface ProductTypeReposity extends CrudRepository<ProductType, Integer>{
	
	List<ProductType> findAll();
}
