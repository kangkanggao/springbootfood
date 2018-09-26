package cn.edu.nyist.food.front.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import cn.edu.nyist.food.constant.PageConstant;
import cn.edu.nyist.food.front.repository.ProductInfoRepository;
import cn.edu.nyist.food.front.service.ProductInfoService;
import cn.edu.nyist.food.model.ProductInfo;


@Service("frontProductInfoService")
public class ProductInfoServiceImpl implements ProductInfoService {
	
	@Autowired
	private ProductInfoRepository productInfoRepository;
	@Override
	public Page<ProductInfo> findAllProductInfos(int pageNo, String productName, int productType) {
		Pageable pageable = new PageRequest(pageNo - 1, PageConstant.PAGE_SIZE);

		return productInfoRepository.findAll(new Specification<ProductInfo>() {
			@Override
			public Predicate toPredicate(Root<ProductInfo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (productType != -1) {
					Predicate p1 = cb.equal(root.get("productType"), productType);
					ls.add(p1);
				}
				if (productName != null && !productName.equals("")) {
					Predicate p2 = cb.like(root.get("productName").as(String.class), "%" + productName + "%");
					ls.add(p2);
				}
				Predicate[] arr = new Predicate[ls.size()];
				return cb.and(ls.toArray(arr));

			}
		}, pageable);
	}
}
