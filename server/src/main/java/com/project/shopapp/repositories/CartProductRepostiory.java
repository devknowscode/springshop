package com.project.shopapp.repositories;

import com.project.shopapp.models.Cart;
import com.project.shopapp.models.CartProduct;
import com.project.shopapp.models.Product;
import com.project.shopapp.models.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CartProductRepostiory extends JpaRepository<CartProduct, Long> {

    List<CartProduct> findCartProductByCart(Cart cart);

    Optional<CartProduct> findByCartAndProductAndProductVariant(Cart cart, Product product, ProductVariant productVariant);

    Long deleteByCartAndProductAndProductVariant(Cart cart, Product product, ProductVariant productVariant);
}

