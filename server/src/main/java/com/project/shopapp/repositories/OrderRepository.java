package com.project.shopapp.repositories;

import com.project.shopapp.models.Order;
import com.project.shopapp.responses.OrderResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
//    @Query("SELECT o.id, o.customerName, oc.totalCheckout, o.status, o.orderDate" +
//            "FROM Order o " +
//            "JOIN OrderCheckout oc " +
//            "ON o.id = oc.order.id")
//    Page<OrderResponse> getAllOrders(Pageable pageable);
//
//    @Query("SELECT new com.project.shopapp.responses.OrderResponse(o.id, o.customerName, oc.totalCheckout, o.status, o.orderDate)" +
//            "FROM Order o " +
//            "JOIN OrderCheckout oc " +
//            "ON o.id = oc.order.id " +
//            "WHERE o.id = :orderId")
//    OrderResponse getOrderById(@Param("orderId") Long orderId);

}
