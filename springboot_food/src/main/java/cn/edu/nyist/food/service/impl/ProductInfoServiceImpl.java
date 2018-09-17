package cn.edu.nyist.food.service.impl;

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
import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.repository.ProductInfoRepository;
import cn.edu.nyist.food.service.ProductInfoService;

@Service
public class ProductInfoServiceImpl implements ProductInfoService {
	@Autowired
	private ProductInfoRepository productInfoRepository;

	@Override
	public ProductInfo save(ProductInfo productInfo) {
		return productInfoRepository.save(productInfo);
	}

	@Override
	public Page<ProductInfo> findAllProductInfos(int pageNo, String productName, int categoryType) {
		Pageable pageable = new PageRequest(pageNo - 1, PageConstant.PAGE_SIZE);

		return productInfoRepository.findAll(new Specification<ProductInfo>() {
			@Override
			public Predicate toPredicate(Root<ProductInfo> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> ls = new ArrayList<Predicate>();
				if (categoryType != -1) {
					Predicate p1 = cb.equal(root.get("categoryType"), categoryType);
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

	@Override
	public ProductInfo findById(String productId) {
		return productInfoRepository.findOne(productId);
	}

	@Override
	public void del(String productId) {
       productInfoRepository.delete(productId);
	}

	@Override
	public ProductInfo update(ProductInfo productInfo) {

		return productInfoRepository.save(productInfo);
	}

}
