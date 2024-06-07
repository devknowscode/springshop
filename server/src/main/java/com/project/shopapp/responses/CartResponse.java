package com.project.shopapp.responses;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.models.CartProduct;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class CartResponse {
    private Long id;

    @JsonProperty("cart_state")
    private String cartState;

    @JsonProperty("products_in_cart")
    private List<CartProduct> cartProducts;
}
