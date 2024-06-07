package com.project.shopapp.services;

import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.models.Cart;
import com.project.shopapp.models.CartProduct;
import com.project.shopapp.responses.CartResponse;
import jakarta.transaction.Transactional;

import java.util.List;

public interface CartSerice {
    @Transactional
    CartResponse addToCart(CartDto cartDto) throws Exception;
}
