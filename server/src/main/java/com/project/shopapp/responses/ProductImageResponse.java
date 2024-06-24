package com.project.shopapp.responses;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
public class ProductImageResponse {
    private String src;
    private String alt;
}
