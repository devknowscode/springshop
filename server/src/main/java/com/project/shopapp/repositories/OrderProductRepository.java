package com.project.shopapp.repositories;

import com.project.shopapp.dtos.OrderItemDto;
import com.project.shopapp.models.OrderProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderProductRepository extends JpaRepository<OrderProduct, Long> {
    // get order items with order_id
//    @Query("SELECT new com.project.shopapp.dtos.OrderItemDto(op.product.id, p.name, op.productQty, p.productVariants)" +
//            "FROM OrderProduct op " +
//            "JOIN Product p " +
//            "ON op.product.id = p.id " +
//            "WHERE op.order.id = :orderId")
//    List<OrderItemDto> getOrderProductsByOrderId(Long orderId);
}
