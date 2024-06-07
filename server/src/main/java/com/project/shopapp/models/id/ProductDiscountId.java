package com.project.shopapp.models.id;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class ProductDiscountId implements Serializable {

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "discount_id")
    private Long discountId;

    public ProductDiscountId(Long productId, Long discountId) {
        this.productId = productId;
        this.discountId = discountId;
    }

    public ProductDiscountId() {

    }
}
