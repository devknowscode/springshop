package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.ProductDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.*;
import com.project.shopapp.repositories.*;
import com.project.shopapp.responses.ProductResponse;
import com.project.shopapp.services.ProductService;
import com.project.shopapp.utils.ImageUtils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository repository;
    private final CategoryRepository categoryRepository;
    private final VariantRepository variantRepository;
    private final VariantValueRepository variantValueRepository;
    private final ProductImageRepository productImageRepository;
    private final ModelMapper modelMapper;
    private final ProductVariantRepository productVariantRepository;

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
        return modelMapper.map(existingProduct, ProductResponse.class);
    }

    @Override
    @Transactional
    public ProductResponse createProduct(ProductDto productDto, MultipartFile file)
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
        String trimmedDescription = productDto.getDescription().trim();

        // convert product name to slug -> "xe-o-to"
        String slug = generateSlug(cleanedName);

        Product product = new Product();
        product.setName(cleanedName);
        product.setDescription(trimmedDescription);
        product.setSlug(slug);
        product.setCategory(existingCategory);

        // save product
        Product newProduct = repository.save(product);

        // Handle variant attributes
        Map<String, String> variantAttributes = productDto.getProductVariant();
        String productVariantName = generateProductVariantName(variantAttributes);

        // save image to local storage
        String imageName = ImageUtils.saveImageToStorage("uploads", file);
        ProductImage productImage = ProductImage.builder()
                .src(imageName)
                .alt(imageName)
                .build();
        productImageRepository.save(productImage);

        // Create ProductVariant
        ProductVariant productVariant = new ProductVariant();
        productVariant.setProductVariantName(productVariantName);
        productVariant.setSku(variantAttributes.get("sku"));
        productVariant.setPrice(productDto.getPrice());
        productVariant.setStock(Integer.parseInt(variantAttributes.get("stock")));
        productVariant.setStatus(productVariant.getStock() > 0);
        productVariant.setProduct(product);
        productVariant.setProductImage(productImage);
        productVariantRepository.save(productVariant);

        // Loop product variants
        for (Map.Entry<String, String> entry : productDto.getProductVariant().entrySet()) {
            String variantName = entry.getKey();
            String variantValue = entry.getValue();

            if (variantName.equals("sku") || variantName.equals("stock")) {
                continue;
            }

            Variant existingVariant = variantRepository.findByVariant(variantName)
                    .orElseGet(() -> {
                        Variant newVariant = new Variant();
                        newVariant.setVariant(variantName);
                        return variantRepository.save(newVariant);
                    });

            VariantValue existingVariantValue = variantValueRepository.findByValueAndVariantId(variantValue, existingVariant.getId())
                    .orElseGet(() -> {
                        VariantValue newVariantValue = new VariantValue();
                        newVariantValue.setValue(variantValue);
                        newVariantValue.setVariant(existingVariant);
                        return variantValueRepository.save(newVariantValue);
                    });

            ProductDetail productDetail = new ProductDetail();
            productDetail.setProductVariant(productVariant);
            productDetail.setVariantValue(existingVariantValue);
        }

        return modelMapper.map(newProduct, ProductResponse.class);
    }

    private String generateProductVariantName(Map<String, String> variantAttributes) {
        return variantAttributes.entrySet().stream()
                .filter(entry -> !"sku".equalsIgnoreCase(entry.getKey()) && !"stock".equalsIgnoreCase(entry.getKey()))
                .map(Map.Entry::getValue)
                .collect(Collectors.joining("-"));
    }

    // TODO: Update product service
    @Override
    public ProductResponse updateProduct(Long id, ProductDto productDto) {
        return null;
    }

    private String generateSlug(String name) {
        return name
                .replace(" ", "-")
                .toLowerCase();
    }
}
