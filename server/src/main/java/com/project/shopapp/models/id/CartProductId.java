package com.project.shopapp.models.id;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class CartProductId implements Serializable {
    @Column(name = "cart_id")
    @JsonProperty("cart_id")
    private Long cartId;
    @Column(name = "product_id")
    @JsonProperty("product_id")
    private Long productId;

    public CartProductId(Long cartId, Long productId) {
        this.cartId = cartId;
        this.productId = productId;
    }

    public CartProductId() {

    }
}
