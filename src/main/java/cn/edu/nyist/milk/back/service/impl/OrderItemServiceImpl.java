package cn.edu.nyist.milk.back.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.nyist.milk.back.repository.OrderItemRepository;
import cn.edu.nyist.milk.back.repository.ProductInfoRepository;
import cn.edu.nyist.milk.back.service.OrderItemService;
import cn.edu.nyist.milk.model.OrderItem;

@Service("backOrderItemService")
public class OrderItemServiceImpl implements OrderItemService {
	
	@Autowired
	ProductInfoRepository productInfoRepository;
	
	@Autowired
	OrderItemRepository orderItemRepository;
	
	@Override
	public List<OrderItem> findAllItems(String orderId) {
		//通过订单编号，获得订单对应的商品，及数量
		//要获得订单项
		return orderItemRepository.findByOrderId(orderId);
	}

	@Override
	public void deleteBatch(List<String> orderIds) {
		orderItemRepository.deleteOrderItemByOrderId(orderIds);
	}

}
