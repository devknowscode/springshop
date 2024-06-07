package com.project.shopapp.repositories;

import com.project.shopapp.models.ProductCategoryDiscount;
import com.project.shopapp.models.id.ProductCategoryDiscountId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductCategoryDiscountRepository extends JpaRepository<ProductCategoryDiscount, ProductCategoryDiscountId> {
}