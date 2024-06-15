package com.project.shopapp.repositories;

import com.project.shopapp.models.CartProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartProductRepostiory extends JpaRepository<CartProduct, Long> {

    //    @Query("SELECT cp FROM CartProduct cp WHERE cp.id.cartId = :cartId")
    List<CartProduct> findById_CartId(Long cartId);

    Optional<CartProduct> findCartProductByCartIdAndProductId(Long cartId, Long productId);
}

