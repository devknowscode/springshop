package com.project.shopapp.controllers;


import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.models.Cart;
import com.project.shopapp.models.CartProduct;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.CartResponse;
import com.project.shopapp.services.CartSerice;
import com.project.shopapp.utils.BindingResultError;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/api/carts")
@RequiredArgsConstructor
public class CartController {
    private final CartSerice service;

    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<CartResponse> addToCart(
            @RequestBody CartDto cartDto,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CartResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Add new product to cart!");
        response.setMetadata(service.addToCart(cartDto));
        return response;
    }

//
//    @PutMapping("")
//    public BaseResponse<String> updateProductInCart(
//            @RequestBody CartDto cartDto,
//            BindingResult bindingResult
//    ) throws Exception {
//        // Check valid field before handling
//        BindingResultError.handle(bindingResult);
//
//        // Response to user
//        var response = new BaseResponse<Cart>();
//        response.setStatus(HttpStatus.OK.value());
//        response.setMessage("Add new product to cart!");
//        response.setMetadata(service.updateProductInCart(cartDto));
//        return response;
//    }
}
