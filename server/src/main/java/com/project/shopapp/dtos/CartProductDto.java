package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartProductDto {
    @JsonProperty("product_id")
    private Long productId;

    @JsonProperty("product_sku")
    private String productSku;

    @JsonProperty("product_name")
    private String productName;

    @JsonProperty("product_variant_name")
    private String productVariantName;

    @JsonProperty("product_slug")
    private String productSlug;

    @JsonProperty("product_image")
    private String productImage;

    @JsonProperty("product_stock")
    private int productStock;

    @JsonProperty("product_price")
    private int productPrice;

    @JsonProperty("product_discount")
    private Integer productDiscount;

    @JsonProperty("product_qty")
    private int productQty;

    private int total;
}
