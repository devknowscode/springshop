package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.ProductAttributeDto;
import com.project.shopapp.dtos.ProductDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.Category;
import com.project.shopapp.models.Product;
import com.project.shopapp.models.ProductAttribute;
import com.project.shopapp.models.ProductImage;
import com.project.shopapp.repositories.CategoryRepository;
import com.project.shopapp.repositories.ProductAttributeRepository;
import com.project.shopapp.repositories.ProductImageRepository;
import com.project.shopapp.repositories.ProductRepository;
import com.project.shopapp.responses.ProductResponse;
import com.project.shopapp.services.ProductService;
import com.project.shopapp.utils.ImageUtils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository repository;
    private final CategoryRepository categoryRepository;
    private final ProductImageRepository productImageRepository;
    private final ProductAttributeRepository productAttributeRepository;
    private final ModelMapper modelMapper;

    @Override
    public Page<ProductResponse> getAllProducts(
            String keyword,
            Long categoryId,
            PageRequest pageRequest
    ) {
        Page<Product> productsPage = repository.searchProducts(categoryId, keyword, pageRequest);
        return productsPage.map(product -> modelMapper.map(product, ProductResponse.class));
    }


    @Override
    public ProductResponse getProductById(Long id)
            throws Exception {
        Product existingProduct = repository.findById(id)
                .orElseThrow(() ->
                        new DataNotFoundException(
                                "Cannot find product with id: " + id
                        )
                );
        System.out.println(Arrays.toString(ImageUtils.getImage("uploads", existingProduct.getThumbnail())));
        return modelMapper.map(existingProduct, ProductResponse.class);
    }

    @Override
    @Transactional
    public ProductResponse createProduct(ProductDto productDto, List<MultipartFile> files)
            throws Exception {
        // check category_id is existed
        Category existingCategory = categoryRepository.findById(productDto.getCategoryId())
                .orElseThrow(() ->
                        new DataNotFoundException(
                                "Cannot find category with id: " + productDto.getCategoryId()
                        )
                );

        // trim name and description "xe o  to" -> "xe o to"
        String trimmedName = productDto.getName().trim();
        String cleanedName = trimmedName.replaceAll("\\s+", " ");
        productDto.setName(cleanedName);
        String trimmedDescription = productDto.getDescription().trim();
        productDto.setDescription(trimmedDescription);

        // convert product name to slug -> "xe-o-to"
        String slug = productDto.getName()
                .replace(" ", "-")
                .toLowerCase();


        List<String> imageNames = new ArrayList<>();

        // check size of images are uploaded
        if (files.size() > ProductImage.MAXIMUM_IMAGES_PER_PRODUCT) {
            throw new BadRequestException("You can only upload maximum 8 images");
        }
        for (MultipartFile file : files) {
            // check empty file before upload
            if (file.getSize() == 0) {
                break;
            }

            // save image to local storage
            String imageName = ImageUtils.saveImageToStorage("uploads", file);
            imageNames.add(imageName);
        }

        Product product = modelMapper.map(productDto, Product.class);
        product.setSlug(slug);
        product.setCategory(existingCategory);
        product.setThumbnail(imageNames.get(0));

        // save product
        Product newProduct = repository.save(product);

        // save product_attribute
        for (ProductAttributeDto productAttributeDto : productDto.getProductAttributes()) {
            ProductAttribute productAttribute = ProductAttribute.builder()
                    .key(productAttributeDto.getKey())
                    .value(productAttributeDto.getValue())
                    .product(newProduct)
                    .build();

            productAttributeRepository.save(productAttribute);
        }

        // save product_image
        for (String imageName : imageNames) {
            ProductImage productImage = ProductImage.builder()
                    .image_url(imageName)
                    .product(newProduct)
                    .build();
            productImageRepository.save(productImage);
        }

        return modelMapper.map(newProduct, ProductResponse.class);
    }

    // TODO: Update product service
    @Override
    public ProductResponse updateProduct(Long id, ProductDto productDto) {
        return null;
    }
}
