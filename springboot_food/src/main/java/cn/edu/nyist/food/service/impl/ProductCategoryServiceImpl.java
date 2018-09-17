package cn.edu.nyist.food.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.model.ProductCategory;
import cn.edu.nyist.food.repository.ProductCategoryReposity;
import cn.edu.nyist.food.service.ProductCategoryService;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {
	
	@Autowired
	private ProductCategoryReposity productCategoryReposity;

	@Override
	public List<ProductCategory> findCategoryTypes() {
		return productCategoryReposity.findAll();
	}

}
