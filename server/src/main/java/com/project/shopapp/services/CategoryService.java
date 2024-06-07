package com.project.shopapp.services;

import com.project.shopapp.dtos.CategoryDto;
import com.project.shopapp.exceptions.custom.DataAlreadyExistsException;
import com.project.shopapp.exceptions.custom.InvalidFieldException;

import java.util.List;

public interface CategoryService {
    List<CategoryDto> getAllCategories(int page, int limit);

    CategoryDto getCategoryById(Long id) throws Exception;

    CategoryDto createCategory(CategoryDto categoryDto) throws DataAlreadyExistsException;

    CategoryDto updateCategory(CategoryDto categoryDto, Long id) throws Exception;

    void deleteCategory(Long id);
}
