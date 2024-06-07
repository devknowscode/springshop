package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
public class DiscountDetailResponse {
    @JsonProperty("discount_id")
    private Long id;

    @JsonProperty("discount_name")
    private String discountName;

    @JsonProperty("discount_description")
    private String discountDescription;

    @JsonProperty("discount_unit")
    private String discountUnit;    // percentage or fixed_amount

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

    @JsonProperty("is_active")
    private boolean isActive;

    @JsonProperty("is_all_products")
    private boolean isAllProducts;
}
