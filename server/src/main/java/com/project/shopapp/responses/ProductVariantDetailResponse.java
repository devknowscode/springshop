package com.project.shopapp.responses;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.Map;

@Getter
@Setter
@Builder
public class ProductVariantDetailResponse {
    private Map<String, String> variantDetail;
}
