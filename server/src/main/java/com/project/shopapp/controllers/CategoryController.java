package com.project.shopapp.controllers;

import com.project.shopapp.dtos.CategoryDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.services.CategoryService;
import com.project.shopapp.utils.BindingResultError;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/api/categories")
@RequiredArgsConstructor
public class CategoryController {

    private final CategoryService service;

    @GetMapping("")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<List<CategoryDto>> getAllCategories(
            @RequestParam(name = "page", defaultValue = "1") int page,
            @RequestParam(name = "limit", defaultValue = "10") int limit
    ) {
        var response = new BaseResponse<List<CategoryDto>>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Get all categories successfully!");
        response.setMetadata(service.getAllCategories(page, limit));
        return response;
    }

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<CategoryDto> getCategory(@PathVariable Long id) throws Exception {
        var response = new BaseResponse<CategoryDto>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Get category successfully!");
        response.setMetadata(service.getCategoryById(id));
        return response;
    }

    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<CategoryDto> createCategory(
            @RequestBody @Valid CategoryDto categoryDto,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CategoryDto>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage(String.format("Category %s is added.", categoryDto.getName()));
        response.setMetadata(service.createCategory(categoryDto));
        return response;
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<CategoryDto> updateCategory(
            @RequestBody @Valid CategoryDto categoryDto,
            BindingResult bindingResult,
            @PathVariable Long id
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<CategoryDto>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage(String.format("Category %s is updated.", categoryDto.getName()));
        response.setMetadata(service.updateCategory(categoryDto, id));
        return response;
    }

    @DeleteMapping("/{id}")
    public BaseResponse<Void> deleteCategory(@PathVariable Long id) {
        // delete category
        service.deleteCategory(id);

        // Response to user
        var response = new BaseResponse<Void>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Delete category successfully.");
        response.setMetadata(null);
        return response;
    }
}
