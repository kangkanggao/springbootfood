package cn.edu.nyist.milk.dto;

import java.util.List;

import cn.edu.nyist.milk.model.ProductInfo;

/**
 * 仅作为向前端传值的作用
 * 
 * @author kangkang
 *
 */
public class ProductInfoType {
	private Integer id;
	private String typeName;
	private Integer size;

	private List<ProductInfo> productInfos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public List<ProductInfo> getProductInfos() {
		return productInfos;
	}

	public void setProductInfos(List<ProductInfo> productInfos) {
		this.productInfos = productInfos;
	}

	

}