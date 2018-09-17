package cn.edu.nyist.food.service;

import java.util.List;

import cn.edu.nyist.food.model.ProductCategory;

public interface ProductCategoryService {
  List<ProductCategory> findCategoryTypes();
}
