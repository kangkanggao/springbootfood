/*package cn.edu.nyist.milk.front.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alipay.api.AlipayApiException;

import cn.edu.nyist.milk.dto.AlipayBean;
import cn.edu.nyist.milk.front.service.OrderService;
import cn.edu.nyist.milk.front.service.PayService;
import cn.edu.nyist.milk.model.Order;

 订单接口 
@RestController()
@RequestMapping("order")
public class OrderPayController {
	private static Logger logger=LoggerFactory.getLogger(OrderPayController.class);
	@Autowired
	private OrderService orderService;
    @Resource
    private PayService payService;//调用支付服务
    @RequestMapping("kang")
    public String toPay() {
    	return "index";
    }
    阿里支付
    @PostMapping(value = "alipay")
    public String alipay(String out_trade_no,String subject,String total_amount,String body) throws AlipayApiException {
        AlipayBean ab=new AlipayBean();
        ab.setBody(body);
        ab.setOut_trade_no(out_trade_no);
        //ab.setProduct_code(product_code);
        ab.setSubject(subject);
        ab.setTotal_amount(new StringBuffer().append(total_amount));
        return  payService.aliPay(ab);
    }
    
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

		String orderId = (String) request.getAttribute("WIDout_trade_no");
		Order order = orderService.findByOrderId(orderId);
		order.setPayStatus(1);
		orderService.update(order);
		return "front/success";

	}
}
*/