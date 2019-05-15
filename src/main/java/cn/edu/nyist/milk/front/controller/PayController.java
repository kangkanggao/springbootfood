package cn.edu.nyist.milk.front.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradeWapPayRequest;

import cn.edu.nyist.milk.front.service.OrderService;
import cn.edu.nyist.milk.model.Order;
import cn.edu.nyist.milk.utils.AlipayConfig;

/**
 * 
 * @author kangkang
 *
 */
@Controller
@RequestMapping("/front")
public class PayController {
	private static Logger logger=LoggerFactory.getLogger(PayController.class);
	@Autowired
	private OrderService orderService;

	@RequestMapping(path = "/pay")
	public void pay(@RequestBody Map<String, Object> map, HttpServletRequest request, HttpServletResponse response) {

		try {
			if (map.get("WIDout_trade_no") != null) {
				// 商户订单号，商户网站订单系统中唯一订单号，必填
				String out_trade_no = map.get("WIDout_trade_no").toString();
				// 订单名称，必填
				String subject = map.get("WIDsubject").toString();
				// 付款金额，必填
				String total_amount = map.get("WIDtotal_amount").toString();
				// 商品描述，可空
				String body = map.get("WIDbody").toString();
				// 超时时间 可空
				String timeout_express = "2m";
				// 销售产品码 必填
				String product_code = "QUICK_WAP_WAY";

				// SDK 公共请求类，包含公共请求参数，以及封装了签名与验签，开发者无需关注签名与验签
				// 调用RSA签名方式
				AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL, AlipayConfig.APPID,
						AlipayConfig.RSA_PRIVATE_KEY, AlipayConfig.FORMAT, AlipayConfig.CHARSET,
						AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
				AlipayTradeWapPayRequest alipay_request = new AlipayTradeWapPayRequest();
				// 封装请求支付信息
				AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
				model.setOutTradeNo(out_trade_no);
				model.setSubject(subject);
				model.setTotalAmount(total_amount);
				model.setBody(body);
				model.setTimeoutExpress(timeout_express);
				model.setProductCode(product_code);
				alipay_request.setBizModel(model);
				// 设置异步通知地址
				alipay_request.setNotifyUrl(AlipayConfig.notify_url);
				// 设置同步地址
				alipay_request.setReturnUrl(AlipayConfig.return_url);
				// form表单生产
				String form = "";
				// 调用SDK生成表单
				form = client.pageExecute(alipay_request).getBody();
				
				response.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
				response.getWriter().write(form);// 直接将完整的表单html输出到页面
				response.getWriter().flush();
				response.getWriter().close();
			} else {
				response.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
				response.getWriter().write("test");// 直接将完整的表单html输出到页面
				response.getWriter().flush();
				response.getWriter().close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 以下是返回值
	 * http://localhost:9090/return?charset=UTF-8&out_trade_no=2019417215910637&
	 * method=alipay.trade.wap.pay.return&total_amount=0.01&sign=
	 * cSlnquFOeuUSF4U2YcnCsuJ07HZy%2FXWi%
	 * 2FZGZoGno9c9TfjmSD2IBsvb4OUoVqceP6DKH9al8JvXyG6YZX3k24Kaaiq8mk4r4%
	 * 2BXimlsbq1Ko3tjI8UijWG0Jst78izYbJlnenkS4U%2Bdp%
	 * 2Bw5Lp88dHUXUV5Bj0OPcIWZ6ORg6WdXHs23JLjSHDLT76bt1BUkEQKKPs%
	 * 2BNeGiEh8AqKRcCapcAFQMadAgUCJq6t7kfDXd%2BlQi2U8uqaccX%2FiVMvgCx%
	 * 2Ft6eppt6PlaNoi7kI9bT5cM6GeI0MCFAtoV9nMzhGbKrb6wXMNes2spo3r%
	 * 2F5WMo2H6PZwnEZCLLWq2YzM4bFVLog%3D%3D&trade_no=2019041722001449841000002865&
	 * auth_app_id=2016092700607988&version=1.0&app_id=2016092700607988&sign_type=
	 * RSA2&seller_id=2088102177501150&timestamp=2019-04-17+22%3A02%3A23
	 */

	@RequestMapping("/return")
	public String payreturn(@RequestBody(required = false) Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			Map<String, String[]> parameterMap = request.getParameterMap();
			Iterator<Entry<String, String[]>> iterator = parameterMap.entrySet().iterator();
			while (iterator.hasNext()) {
				Entry<String, String[]> next = iterator.next();
				String key = next.getKey();
				String[] value = next.getValue();
				for (String string : value) {
					String str2 = key + "==>" + string;
					//response.setCharacterEncoding("UTF-8");
					//response.getWriter().println(str2);
					//response.getWriter().flush();
					if(key.equals("out_trade_no")&&StringUtils.isNotBlank(string)) {
						logger.info("要修改的订单号为：{}",string);
						Order order = orderService.findByOrderId(string);
						order.setPayStatus(1);
						orderService.update(order);
					}
					logger.info(str2);
				}
			}
			//response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
/*
		String orderId = (String) request.getAttribute("WIDout_trade_no");
		Order order = orderService.findByOrderId(orderId);
		order.setPayStatus(1);
		orderService.update(order);*/
		return "front/success";

	}
}
