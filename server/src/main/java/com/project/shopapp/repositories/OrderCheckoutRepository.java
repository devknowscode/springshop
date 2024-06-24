package com.project.shopapp.repositories;

import com.project.shopapp.models.OrderCheckout;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderCheckoutRepository extends JpaRepository<OrderCheckout, Long> {
}
