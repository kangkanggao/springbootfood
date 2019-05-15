package cn.edu.nyist.milk.back.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.milk.back.repository.ProductTypeReposity;
import cn.edu.nyist.milk.back.service.ProductTypeService;
import cn.edu.nyist.milk.model.ProductType;


@Service("bcakProductTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {
	
	@Autowired
	private ProductTypeReposity productCategoryReposity;

	@Override
	public List<ProductType> findProductTypes() {
		return productCategoryReposity.findAll();
	}

}
