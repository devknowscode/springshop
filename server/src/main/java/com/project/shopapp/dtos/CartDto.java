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

public class CartDto {
    @NotNull(message = "User ID is required!")
    @JsonProperty("user_id")
    private Long userId;

    @NotNull(message = "Product ID is required")
    @JsonProperty("product_id")
    private Long productId;

    @JsonProperty("product_qty")
    private int productQty = 1;
}
