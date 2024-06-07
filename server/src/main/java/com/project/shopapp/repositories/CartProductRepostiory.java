package com.project.shopapp.repositories;

import com.project.shopapp.models.CartProduct;
import com.project.shopapp.models.id.CartProductId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartProductRepostiory extends JpaRepository<CartProduct, CartProductId> {

//    @Query("SELECT cp FROM CartProduct cp WHERE cp.id.cartId = :cartId")
    List<CartProduct> findById_CartId(Long cartId);
}
