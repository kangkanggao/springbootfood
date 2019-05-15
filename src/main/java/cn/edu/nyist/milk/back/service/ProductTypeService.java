package cn.edu.nyist.milk.back.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.nyist.milk.model.ProductType;

public interface ProductTypeService {
  @Transactional(readOnly=true)
  List<ProductType> findProductTypes();
}
