package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderItemDto {
    @JsonProperty("product_name")
    private String productName;

    @JsonProperty("product_variant_name")
    private String productVariantName;

    @JsonProperty("product_price")
    private int productPrice;

    private int quantity;

    @JsonProperty("total_price")
    private int totalPrice;
}
