package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.dtos.CategoryDto;
import com.project.shopapp.models.Category;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductResponse {

    private String name;

    private String description;

    private Double price;

    private String slug;

    private ProductVariantResponse variant;

    @JsonProperty(value = "category_id")
    private Long categoryId;
}
