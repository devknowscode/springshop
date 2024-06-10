package com.project.shopapp.services;


import com.project.shopapp.dtos.ProductDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.responses.ProductResponse;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ProductService {

    Page<ProductResponse> getAllProducts(String keyword, Long categoryId, PageRequest pageRequest);

    @Transactional
    ProductResponse createProduct(ProductDto productDto, MultipartFile file)
            throws Exception;

    ProductResponse getProductById(Long id) throws Exception;

    ProductResponse updateProduct(Long id, ProductDto productDto);
}
