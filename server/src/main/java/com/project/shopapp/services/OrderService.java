package com.project.shopapp.services;

import com.project.shopapp.dtos.OrderDto;
import com.project.shopapp.responses.OrderDetailResponse;
import com.project.shopapp.responses.OrderResponse;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

public interface OrderService {
    Page<OrderResponse> getAllOrders(PageRequest pageRequest);

    OrderDetailResponse getOrderById(Long orderId);

    @Transactional
    OrderDetailResponse createOrder(OrderDto order) throws Exception;

    OrderDetailResponse updateOrder(OrderDto order, Long orderId);

    void deleteOrder(Long id);
}
