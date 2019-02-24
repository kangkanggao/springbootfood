package cn.edu.nyist.food.repository;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.junit4.SpringRunner;

import cn.edu.nyist.food.model.ProductInfo;
import cn.edu.nyist.food.repository.ProductInfoRepository;


@RunWith(SpringRunner.class)
@SpringBootTest
@Configuration
public class ProductInfoRepositoryTest {
	@Autowired
    private ProductInfoRepository repository;
	@Test
	public void save() {
		ProductInfo productInfo=new ProductInfo();
		productInfo.setProductId("00001");
		productInfo.setProductName("胡辣汤");
		productInfo.setProductPrice(new BigDecimal(3.3));
		productInfo.setProductStock(100);
		productInfo.setProductDescription("非常辣");
		productInfo.setProductIcon("001.jpg");
		productInfo.setProductStatus(0);
		productInfo.setCategoryType(2);
		ProductInfo result = repository.save(productInfo);
		System.out.println(result);
	}
	//@Test
	public void findByProductStatus() {
		List<ProductInfo> productInfoList = repository.findByProductStatus(0);
	    System.out.println(productInfoList);
	}

}
