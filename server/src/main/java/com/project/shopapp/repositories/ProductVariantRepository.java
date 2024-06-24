package com.project.shopapp.repositories;

import com.project.shopapp.models.Product;
import com.project.shopapp.models.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ProductVariantRepository extends JpaRepository<ProductVariant, Long> {
    Optional<ProductVariant> findByProductAndSku(Product product, String sku);
}