package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductResponse {

    private String name;

    private String description;

    private String thumbnail;

    private Double price;

    @JsonProperty("category_id")
    private Long categoryId;
}
