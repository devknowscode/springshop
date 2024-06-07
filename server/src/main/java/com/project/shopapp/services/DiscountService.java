package com.project.shopapp.services;

import com.project.shopapp.dtos.DiscountDto;
import com.project.shopapp.responses.DiscountDetailResponse;
import com.project.shopapp.responses.DiscountResponse;

import java.util.List;

public interface DiscountService {
    List<DiscountResponse> getAllDiscounts();

    DiscountDetailResponse getDiscountById(Long id) throws Exception;

    DiscountDetailResponse createDiscount(DiscountDto discount) throws Exception;

    DiscountDetailResponse updateDiscount(DiscountDto discountDto, Long id) throws Exception;

    void deleteDiscount(Long id) throws Exception;
}
