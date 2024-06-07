package com.project.shopapp.models;


import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "discounts")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "discount_name", nullable = false)
    private String discountName;

    @Column(name = "discount_description")
    private String discountDescription;

    @Column(name = "discount_unit", nullable = false)
    private String discountUnit;

    @Column(name = "discount_value", nullable = false)
    private Double discountValue;

    @Column(name = "coupon_code")
    private String couponCode;

    @Column(name = "valid_from")
    private LocalDateTime validFrom;

    @Column(name = "valid_until")
    private LocalDateTime validUntil;

    @Column(name = "maximum_discount_amount")
    private Double maximumDiscountAmount;

    @Column(name = "amount_used")
    private int amountUsed = 0;

    @Column(name = "max_uses_per_user")
    private int maxUsesPerUser;

    @Column(name = "minimum_order_value")
    private Double minimumOrderValue;

    @Column(name = "is_active")
    private boolean isActive = true;

    @Column(name = "is_all_products")
    private boolean isAllProducts = false;


}
