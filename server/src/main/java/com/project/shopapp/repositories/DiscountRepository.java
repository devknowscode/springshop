package com.project.shopapp.repositories;

import com.project.shopapp.models.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Long> {
    Discount findDiscountByCouponCode(String code);
}
