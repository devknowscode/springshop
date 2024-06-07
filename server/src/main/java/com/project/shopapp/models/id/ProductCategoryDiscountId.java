package com.project.shopapp.models.id;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;

@Embeddable
public class ProductCategoryDiscountId implements Serializable {
    @Column(name = "category_id")
    private Long categoryId;

    @Column(name = "discount_id")
    private Long discountId;

    public ProductCategoryDiscountId(Long categoryId, Long discountId) {
        this.categoryId = categoryId;
        this.discountId = discountId;
    }

    public ProductCategoryDiscountId() {

    }
}
