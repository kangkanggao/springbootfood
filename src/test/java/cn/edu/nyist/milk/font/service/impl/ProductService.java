package cn.edu.nyist.milk.font.service.impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import cn.edu.nyist.milk.front.service.BuyerInfoService;
import cn.edu.nyist.milk.front.service.ProductInfoService;
import cn.edu.nyist.milk.model.BuyerInfo;
import cn.edu.nyist.milk.model.ProductInfo;
import cn.edu.nyist.milk.utils.WebUtil;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ProductService {
	@Autowired
   ProductInfoService productInfoService;
	@Autowired
	BuyerInfoService buyerInfoService;

	public void test1() {
		List<ProductInfo> ls = productInfoService.findProductInfosByType(1);
		for (ProductInfo productInfo : ls) {
			System.out.println(productInfo);
		}
	}
	@Test
	public void test2() {
		BuyerInfo buyerInfo=new BuyerInfo();
		buyerInfo.setBuyerName("lisi");
		buyerInfo.setBuyerPhone("15711255657");
		buyerInfo.setBuyerPwd(WebUtil.encryptUserPwd("lisi", "123"));
		BuyerInfo buyerInfo2 = buyerInfoService.saveBuyer(buyerInfo);
		if(buyerInfo2!=null) {
			System.out.println("存库成功!");
		}
	}
}
