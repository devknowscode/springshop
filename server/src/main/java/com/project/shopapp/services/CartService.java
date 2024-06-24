package com.project.shopapp.services;

import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.dtos.CartRemoveDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.responses.CartResponse;
import jakarta.transaction.Transactional;

public interface CartService {
    @Transactional
    CartResponse addToCart(String token, CartDto cartDto) throws Exception;

    CartResponse getCartActiveStatus(String token) throws DataNotFoundException;

    CartResponse updateProductInCart(String token, Long cartId, CartDto cartDto) throws Exception;

    @Transactional
    CartResponse removeProductInCart(String token, Long cartId, CartRemoveDto cartRemoveDto) throws Exception;
}
