package com.project.shopapp.dtos;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {

    @NotEmpty(message = "Category's name cannot be empty")
    private String name;

    @NotNull(message = "Category's description cannot be null")
    private String description;

}
