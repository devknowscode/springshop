package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.OrderDto;
import com.project.shopapp.dtos.OrderItemDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.exceptions.custom.ProductNotFoundException;
import com.project.shopapp.models.*;
import com.project.shopapp.repositories.*;
import com.project.shopapp.responses.OrderDetailResponse;
import com.project.shopapp.responses.OrderResponse;
import com.project.shopapp.services.OrderService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository repository;
    private final OrderProductRepository orderProductRepository;
    private final OrderCheckoutRepository orderCheckoutRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;

    @Override
    public Page<OrderResponse> getAllOrders(PageRequest pageRequest) {
        return repository.getAllOrders(pageRequest);
    }

    @Override
    public OrderDetailResponse getOrderById(Long orderId) {
        // get detail in order and order_checkouts
        OrderResponse order = repository.getOrderById(orderId);

        // then loop to get product id from order_products
        List<OrderItemDto> orderProducts = orderProductRepository.getOrderProductsByOrderId(orderId);

        return OrderDetailResponse.builder()
                .id(order.getId())
                .fullName(order.getFullName())
                .orderItems(orderProducts)
                .orderTotal(order.getOrderTotal())
                .status(order.getStatus())
                .orderDate(order.getOrderDate())
                .build();
    }

    @Override
    @Transactional
    public OrderDetailResponse createOrder(OrderDto orderDto) throws Exception {
        // check user is existed
        Optional<User> existingUserOptional = userRepository.findById(orderDto.getUserId());
        if (existingUserOptional.isEmpty()) {
            throw new DataNotFoundException("User not found");
        }

        // transfer dto to model
        Order order = Order.builder()
                .fullName(orderDto.getFullName())
                .phone(orderDto.getPhone())
                .address(orderDto.getAddress())
                .note(orderDto.getNote())
                .paymentMethod(orderDto.getPaymentMethod())
                .trackingNumber(orderDto.getTrackingNumber())
                .orderDate(LocalDateTime.now())
                .user(existingUserOptional.get())
                .status(OrderStatus.PENDING)
                .build();
        Order newOrder = repository.save(order);


        double totalAmount = 0;
        List<OrderItemDto> items = new ArrayList<>();
        // Create OrderProduct entities
        for (var productRequest : orderDto.getOrderItems()) {
            Product product = productRepository.findById(productRequest.getProductId())
                    .orElseThrow(() -> new ProductNotFoundException("Product not found"));

            // TODO: check quantity order and quantity in product before order

            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrder(newOrder);
            orderProduct.setProduct(product);
            orderProduct.setProductPrice(product.getPrice());
            orderProduct.setQuantity(productRequest.getQuantity());
            orderProduct.setTotalPrice(product.getPrice() * productRequest.getQuantity());

            // Save order product entity
            orderProductRepository.save(orderProduct);

            totalAmount += orderProduct.getTotalPrice();

            OrderItemDto item = OrderItemDto.builder()
                    .productId(product.getId())
                    .productName(product.getName())
                    .quantity(orderProduct.getQuantity())
                    .totalPrice(orderProduct.getTotalPrice())
                    .build();

            items.add(item);
        }

        OrderCheckout orderCheckout = new OrderCheckout();
        orderCheckout.setTotalAmount(totalAmount);
        // Set default fee ship
        double feeShip = 2.99;
        orderCheckout.setShippingFee(feeShip);
        orderCheckout.setTotalCheckout(totalAmount + feeShip);
        orderCheckout.setOrder(newOrder);
        orderCheckoutRepository.save(orderCheckout);

        return OrderDetailResponse.builder()
                .id(newOrder.getId())
                .fullName(newOrder.getFullName())
                .orderTotal(orderCheckout.getTotalCheckout())
                .status(newOrder.getStatus())
                .orderDate(newOrder.getOrderDate())
                .orderItems(items)
                .build();
    }

    @Override
    public OrderDetailResponse updateOrder(OrderDto order, Long orderId) {
        // update status
        return null;
    }

    @Override
    @Transactional
    public void deleteOrder(Long id) {
        Order order = repository.findById(id).orElse(null);
        // soft delete
        if(order != null) {
            order.setStatus(OrderStatus.CANCELLED);
            order.setActive(false);
            repository.save(order);
        }
    }
}
