package cn.edu.nyist.milk.front.service;

import com.alipay.api.AlipayApiException;

import cn.edu.nyist.milk.dto.AlipayBean;

/*支付服务*/
public interface PayService {

    /*支付宝*/
    String aliPay(AlipayBean alipayBean) throws AlipayApiException;
}
