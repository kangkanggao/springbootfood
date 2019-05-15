package cn.edu.nyist.milk.front.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.milk.front.repository.ProductTypeReposity;
import cn.edu.nyist.milk.front.service.ProductTypeService;
import cn.edu.nyist.milk.model.ProductType;


@Service("frontProductTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {
	
	@Autowired
	private ProductTypeReposity productCategoryReposity;

	@Override
	public List<ProductType> findProductTypes() {
		return productCategoryReposity.findAll();
	}

}
