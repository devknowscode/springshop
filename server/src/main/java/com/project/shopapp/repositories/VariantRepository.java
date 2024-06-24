package com.project.shopapp.repositories;

import com.project.shopapp.models.Variant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VariantRepository extends JpaRepository<Variant, Long> {
    Optional<Variant> findByVariant(String variant);
}
