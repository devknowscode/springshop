package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.CategoryDto;
import com.project.shopapp.exceptions.custom.DataAlreadyExistsException;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.exceptions.custom.InvalidFieldException;
import com.project.shopapp.models.Category;
import com.project.shopapp.repositories.CategoryRepository;
import com.project.shopapp.services.CategoryService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository repository;
    private final ModelMapper modelMapper;

    @Override
    public List<CategoryDto> getAllCategories(int page, int limit) {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category, CategoryDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public CategoryDto getCategoryById(Long id) throws Exception {
        boolean existingCategory = repository.existsById(id);
        if (!existingCategory) {
            throw new DataNotFoundException("Category ID not found");
        }
        return modelMapper.map(repository.findById(id), CategoryDto.class);
    }

    @Override
    public CategoryDto createCategory(CategoryDto categoryDto)
            throws DataAlreadyExistsException {
        // Check category exist
        boolean existingCategory = repository.existsByName(categoryDto.getName());
        if (existingCategory) {
            throw new DataAlreadyExistsException(
                    String.format("Category `%s` has already existed!", categoryDto.getName())
            );
        }

        Category category = modelMapper.map(categoryDto, Category.class);
        return modelMapper.map(repository.save(category), CategoryDto.class);
    }

    @Override
    public CategoryDto updateCategory(CategoryDto categoryDto, Long id) throws Exception {
        // Check category name and description has length > 0
        if (categoryDto.getName().isEmpty()) {
            throw new InvalidFieldException("Category name cannot be empty!");
        }

        Category category = repository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Category not found"));
        category.setName(categoryDto.getName());
        if (categoryDto.getDescription().isEmpty()) {
            category.setDescription(category.getDescription());
        } else {
            category.setDescription(categoryDto.getDescription());
        }

        Category newCategory = repository.save(category);

        return modelMapper.map(newCategory, CategoryDto.class);
    }

    @Override
    public void deleteCategory(Long id) {
        repository.deleteById(id);
    }
}
