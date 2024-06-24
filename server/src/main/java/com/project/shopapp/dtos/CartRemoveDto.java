package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartRemoveDto {
    @NotNull(message = "Product ID is required")
    @JsonProperty("product_id")
    private Long productId;

    @NotNull(message = "Product sku is required")
    @JsonProperty("product_sku")
    private String productSku;
}
