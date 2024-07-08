package com.demo.service;

import com.demo.model.Order;
import com.demo.model.OrderDetail;
import com.demo.repo.OrderDetailRepo;
import com.demo.repo.OrderRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    @Autowired
    OrderRepo orderRepo;
    @Autowired
    OrderDetailRepo orderDetailRepo;

    public Order addOrder(Order order){
        return orderRepo.save(order);
    }
    public OrderDetail addOrderDetail(OrderDetail orderDetail){
        return orderDetailRepo.save(orderDetail);
    }
}
