package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.dtos.CategoryDto;
import com.project.shopapp.models.Category;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ProductResponse {

    private String title;

    private String description;

    private Double price;

    private String slug;

    @JsonProperty(value = "new")
    private boolean isNew;

    private boolean sale;

    private Integer discount;

    private List<ProductVariantResponse> variants;

    @JsonProperty(value = "category_id")
    private Long categoryId;
}
