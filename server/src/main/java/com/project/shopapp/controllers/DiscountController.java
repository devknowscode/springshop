package com.project.shopapp.controllers;


import com.project.shopapp.dtos.DiscountDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.DiscountDetailResponse;
import com.project.shopapp.responses.DiscountResponse;
import com.project.shopapp.services.DiscountService;
import com.project.shopapp.utils.BindingResultError;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/api/discounts")
@RequiredArgsConstructor
public class DiscountController {

    private final DiscountService service;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<DiscountDetailResponse> createDiscount(
            @RequestBody DiscountDto discountDto,
            BindingResult bindingResult
    ) throws Exception {
        // Handle binding result error when request is not valid
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<DiscountDetailResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Created discount successfully");
        response.setMetadata(service.createDiscount(discountDto));
        return response;
    }

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<List<DiscountResponse>> getAllDiscounts() {
        // Response to user
        var response = new BaseResponse<List<DiscountResponse>>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Created discount successfully");
        response.setMetadata(service.getAllDiscounts());
        return response;
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<DiscountDetailResponse> getDiscountById(
            @PathVariable Long id
    ) throws Exception {
        // Response to user
        var response = new BaseResponse<DiscountDetailResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Created discount successfully");
        response.setMetadata(service.getDiscountById(id));
        return response;
    }

    @PutMapping("/{id}")
    public BaseResponse<DiscountDetailResponse> updateDiscount(
            @PathVariable Long id,
            @RequestBody DiscountDto discountDto,
            BindingResult bindingResult
    ) throws Exception {
        // handle error
        BindingResultError.handle(bindingResult);

        // response to user
        var response = new BaseResponse<DiscountDetailResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Updated discount successfully");
        response.setMetadata(service.updateDiscount(discountDto, id));
        return response;
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public BaseResponse<Void> deleteDiscount(@PathVariable Long id) throws Exception {
        // soft delete discount
        service.deleteDiscount(id);

        // response to user
        var response = new BaseResponse<Void>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Deleted discount successfully");
        return response;
    }
}
