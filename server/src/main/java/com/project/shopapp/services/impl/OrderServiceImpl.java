package com.project.shopapp.services.impl;

import com.project.shopapp.auth.JwtService;
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
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderRepository repository;
    private final OrderProductRepository orderProductRepository;
    private final OrderCheckoutRepository orderCheckoutRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final JwtService jwtService;
    private final ProductVariantRepository productVariantRepository;
    private final CartRepository cartRepository;

//    @Override
//    public Page<OrderResponse> getAllOrders(PageRequest pageRequest) {
//        return repository.getAllOrders(pageRequest);
//    }
//
//    @Override
//    public OrderDetailResponse getOrderById(Long orderId) {
//        // get detail in order and order_checkouts
//        OrderResponse order = repository.getOrderById(orderId);
//
//        // then loop to get product id from order_products
//        List<OrderItemDto> orderProducts = orderProductRepository.getOrderProductsByOrderId(orderId);
//
//        return OrderDetailResponse.builder()
//                .id(order.getId())
//                .fullName(order.getCustomerName())
//                .orderItems(orderProducts)
//                .orderTotal(order.getOrderTotal())
//                .status(order.getStatus())
//                .orderDate(order.getOrderDate())
//                .build();
//    }

    @Override
    @Transactional
    public OrderDetailResponse createOrder(String token, OrderDto orderDto) throws Exception {
        String email = jwtService.extractUsername(token);
        // check user is existed
        Optional<User> existingUserOptional = userRepository.findByEmail(email);
        if (existingUserOptional.isEmpty()) {
            throw new DataNotFoundException("User not found");
        }

        // transfer dto to model
        Order order = Order.builder()
                .customerName(orderDto.getCustomerName())
                .phone(orderDto.getPhone())
                .address(orderDto.getAddress())
                .note(orderDto.getNote())
                .paymentMethod(orderDto.getPaymentMethod())
                .trackingNumber(generateTrackingNumber())
                .orderDate(LocalDateTime.now())
                .user(existingUserOptional.get())
                .status(OrderStatus.PENDING)
                .build();
        Order newOrder = repository.save(order);

        int totalAmount = 0;
        List<OrderItemDto> items = new ArrayList<>();
        // Create OrderProduct entities
        for (var productRequest : orderDto.getOrderItems()) {
            Product product = productRepository.findById(productRequest.getProductId())
                    .orElseThrow(() -> new ProductNotFoundException("Product not found"));

            ProductVariant productVariant = productVariantRepository.findByProductAndSku(product, productRequest.getProductSku())
                    .orElseThrow(() -> new ProductNotFoundException("Product variant not found"));

            // TODO: check quantity order and stock in product before order

            OrderProduct orderProduct = new OrderProduct();
            orderProduct.setOrder(newOrder);
            orderProduct.setProduct(product);
            orderProduct.setProductVariant(productVariant);
            orderProduct.setProductQty(productRequest.getProductQty());

            // Save order product entity
            orderProductRepository.save(orderProduct);

            totalAmount += productRequest.getProductTotal();

            OrderItemDto item = OrderItemDto.builder()
                    .productName(product.getName())
                    .productVariantName(productVariant.getProductVariantName())
                    .quantity(orderProduct.getProductQty())
                    .productPrice(productVariant.getPrice())
                    .totalPrice(productRequest.getProductTotal())
                    .build();

            items.add(item);
        }

        OrderCheckout orderCheckout = new OrderCheckout();
        orderCheckout.setTotalAmount(totalAmount);
        // Set default fee ship
        int feeShip = 30000;
        orderCheckout.setShippingFee(feeShip);
        orderCheckout.setTotalCheckout(totalAmount + feeShip);
        orderCheckout.setOrder(newOrder);
        OrderCheckout newOrderCheckout = orderCheckoutRepository.save(orderCheckout);

        // inactive cart ordered
        Cart cart = cartRepository.findCartByUserAndCartState(existingUserOptional.get(), "active");
        cart.setCartState("inactive");
        cartRepository.save(cart);

        return OrderDetailResponse.builder()
                .id(newOrder.getId())
                .customerName(newOrder.getCustomerName())
                .orderTotal(newOrderCheckout.getTotalCheckout())
                .status(newOrder.getStatus())
                .orderDate(newOrder.getOrderDate())
                .orderItems(items)
                .build();
    }

//    @Override
//    public OrderDetailResponse updateOrder(OrderDto order, Long orderId) {
//        // update status
//        return null;
//    }
//
//    @Override
//    @Transactional
//    public void deleteOrder(Long id) {
//        Order order = repository.findById(id).orElse(null);
//        // soft delete
//        if(order != null) {
//            order.setStatus(OrderStatus.CANCELLED);
//            order.setActive(false);
//            repository.save(order);
//        }
//    }

    // Method to generate a tracking number
    private static String generateTrackingNumber() {
        // Get the current timestamp
        String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        // Generate a random number
        Random random = new Random();
        int randomNumber = random.nextInt(999999);

        // Optionally, use a UUID for added uniqueness
        String uuid = UUID.randomUUID().toString().substring(0, 8);

        // Combine the parts to create the tracking number
        return timestamp + "-" + String.format("%06d", randomNumber) + "-" + uuid;
    }
}
