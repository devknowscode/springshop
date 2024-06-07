package com.project.shopapp.repositories;

import com.project.shopapp.models.ProductDiscount;
import com.project.shopapp.models.id.ProductDiscountId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDiscountRepository extends JpaRepository<ProductDiscount, ProductDiscountId> {
}
