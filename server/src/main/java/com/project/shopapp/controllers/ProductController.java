package com.project.shopapp.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.shopapp.dtos.ProductDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.ProductListResponse;
import com.project.shopapp.responses.ProductResponse;
import com.project.shopapp.services.ProductService;
import com.project.shopapp.utils.BindingResultError;
import com.project.shopapp.utils.ImageUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/v1/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService service;

    @GetMapping("")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<ProductListResponse> getProducts(
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "") String categoryName,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "limit", defaultValue = "8") int limit
    ) {
        // create pageable from page and limit
        PageRequest pageRequest = PageRequest.of(
                page, limit,
                Sort.by("id").ascending()
        );

        Page<ProductResponse> productResponses = service.getAllProducts(keyword, categoryName, pageRequest);
        ProductListResponse metadata = ProductListResponse.builder()
                .products(productResponses.getContent())
                .totalPages(productResponses.getTotalPages())
                .totalProduct(productResponses.getTotalElements())
                .build();

        var response = new BaseResponse<ProductListResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Get all products successfully!");
        response.setMetadata(metadata);
        return response;
    }

    @GetMapping("/{slug}")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<ProductResponse> getProduct(@PathVariable String slug)
            throws Exception {
        var response = new BaseResponse<ProductResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Product created successfully!");
        response.setMetadata(service.getProductBySlug(slug));
        return response;
    }

    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<ProductResponse> createProduct(
            @RequestPart String productDtoObj,
            @RequestPart List<MultipartFile> files,
            BindingResult bindingResult
    ) throws Exception {
        BindingResultError.handle(bindingResult);

        // convert product dto
        ProductDto productDto = convertToProductDto(productDtoObj);

        var response = new BaseResponse<ProductResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Product created successfully!");
        response.setMetadata(service.createProduct(productDto, files));
        return response;
    }

    @PutMapping("/{id}")
    public BaseResponse<ProductResponse> updateProduct(
            @PathVariable Long id,
            @RequestBody ProductDto productDto) {
        var response = new BaseResponse<ProductResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Product updated successfully!");
        response.setMetadata(service.updateProduct(id, productDto));
        return response;
    }

    // view image
    @GetMapping(
            value = "/image/{imageName}",
            produces = {MediaType.IMAGE_PNG_VALUE, MediaType.IMAGE_JPEG_VALUE}
    )
    public @ResponseBody byte[] getFile(@PathVariable String imageName)
            throws IOException {
        return ImageUtils.getImage("uploads", imageName);
    }

    /**
     * Get products with published products
     * Get products with draft products
     * Get products with keyword
     * Get products with category
     * Published product
     * Unpublished product
     */
    private ProductDto convertToProductDto(String productDtoObj) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.readValue(productDtoObj, ProductDto.class);
    }
}
