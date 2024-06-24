package com.project.shopapp.controllers;


import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.dtos.CartRemoveDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.CartResponse;
import com.project.shopapp.services.CartService;
import com.project.shopapp.utils.AuthUtils;
import com.project.shopapp.utils.BindingResultError;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/api/carts")
@RequiredArgsConstructor
public class CartController {
    private final CartService service;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<CartResponse> getCartActiveStatus(@RequestHeader HttpHeaders headers) throws Exception {
        final String token = AuthUtils.getTokenInHeaders(headers);

        // Response to user
        var response = new BaseResponse<CartResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Get products in cart successful!");
        response.setMetadata(service.getCartActiveStatus(token));
        return response;
    }

    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<CartResponse> addToCart(
            @RequestHeader HttpHeaders headers,
            @RequestBody CartDto cartDto,
            BindingResult bindingResult
    ) throws Exception {

        // Get token from headers
        final String token = AuthUtils.getTokenInHeaders(headers);

        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CartResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Add new product to cart!");
        response.setMetadata(service.addToCart(token, cartDto));
        return response;
    }


    @PutMapping("/{cartId}")
    public BaseResponse<CartResponse> updateQuantityProductInCart(
            @RequestHeader HttpHeaders headers,
            @PathVariable Long cartId,
            @RequestBody CartDto cartDto,
            BindingResult bindingResult
    ) throws Exception {
        // Get token from headers
        final String token = AuthUtils.getTokenInHeaders(headers);

        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CartResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Update product in cart!");
        response.setMetadata(service.updateProductInCart(token, cartId, cartDto));
        return response;
    }

    @DeleteMapping("/{cartId}")
    public BaseResponse<CartResponse> removeProductInCart(
            @RequestHeader HttpHeaders headers,
            @PathVariable Long cartId,
            @RequestBody CartRemoveDto cartRemoveDto,
            BindingResult bindingResult
    ) throws Exception {
        // Get token from headers
        final String token = AuthUtils.getTokenInHeaders(headers);

        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CartResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Update product in cart!");
        response.setMetadata(service.removeProductInCart(token, cartId, cartRemoveDto));
        return response;
    }
}
