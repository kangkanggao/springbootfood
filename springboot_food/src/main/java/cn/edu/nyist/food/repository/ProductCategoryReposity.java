package cn.edu.nyist.food.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.food.model.ProductCategory;

public interface ProductCategoryReposity extends CrudRepository<ProductCategory, Integer>{
	
	List<ProductCategory> findAll();
}
