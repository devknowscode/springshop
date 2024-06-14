package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {

    @NotEmpty(message = "Product's name is required")
    private String name;

    @NotNull(message = "Product's description cannot be null")
    private String description;

    @JsonProperty("product_variants")
    private List<Map<String, String>> productVariants;

    @JsonProperty("category_id")
    @NotNull(message = "Category ID is required")
    private Long categoryId;
}
