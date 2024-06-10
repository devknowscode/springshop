package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class ProductVariantResponse {
    @JsonProperty("product_variant_name")
    private String productVariantName;

    private String sku;
    private Double price;
    private int stock;
    private boolean status;

}
