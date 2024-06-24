package com.project.shopapp.repositories;

import com.project.shopapp.models.ProductDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductDetailRepository extends JpaRepository<ProductDetail, Long> {
}