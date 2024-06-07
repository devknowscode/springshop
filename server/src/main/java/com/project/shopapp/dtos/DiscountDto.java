package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class DiscountDto {
    @JsonProperty("discount_name")
    private String discountName;

    @JsonProperty("discount_description")
    private String discountDescription;

    @JsonProperty("discount_unit")
    private String discountUnit;    // percent or money

    @JsonProperty("discount_value")
    private Double discountValue;

    @JsonProperty("coupon_code")
    private String couponCode;

    @JsonProperty("valid_from")
    private LocalDateTime validFrom;

    @JsonProperty("valid_until")
    private LocalDateTime validUntil;

    @JsonProperty("maximum_discount_amount")
    private Double maximumDiscountAmount;

    @JsonProperty("max_uses_per_user")
    private int maxUsesPerUser;

    @JsonProperty("minimum_order_value")
    private Double minimumOrderValue;

    @JsonProperty("is_all_products")
    private boolean isAllProducts = false;

    @JsonProperty("products")
    private List<Long> productIds;

    @JsonProperty("categories")
    private List<Long> categoryIds;
}
