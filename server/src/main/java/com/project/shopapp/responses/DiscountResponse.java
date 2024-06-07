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
public class DiscountResponse {
    @JsonProperty("discount_id")
    private Long id;

    @JsonProperty("discount_name")
    private String discountName;

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

    @JsonProperty("is_active")
    private boolean isActive;
}
