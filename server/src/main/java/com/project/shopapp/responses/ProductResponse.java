package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ProductResponse {

    private Long id;

    private String title;

    private String description;

    private Double price;

    private String slug;

    private boolean sale;

    private Integer discount;

    private List<ProductVariantResponse> variants;

    private List<ProductImageResponse> images;

    @JsonProperty(value = "category_id")
    private Long categoryId;
}
