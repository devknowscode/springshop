package com.project.shopapp.repositories;

import com.project.shopapp.models.VariantValue;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VariantValueRepository extends JpaRepository<VariantValue, Long> {
    Optional<VariantValue> findByValueAndVariantId(String value, Long variantId);
}
