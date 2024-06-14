package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.ProductDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.*;
import com.project.shopapp.repositories.*;
import com.project.shopapp.responses.ProductImageResponse;
import com.project.shopapp.responses.ProductResponse;
import com.project.shopapp.responses.ProductVariantResponse;
import com.project.shopapp.services.ProductService;
import com.project.shopapp.utils.ImageUtils;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductRepository repository;
    private final CategoryRepository categoryRepository;
    private final VariantRepository variantRepository;
    private final VariantValueRepository variantValueRepository;
    private final ProductImageRepository productImageRepository;
    private final ProductVariantRepository productVariantRepository;
    private final ProductDetailRepository productDetailRepository;

    @Override
    public Page<ProductResponse> getAllProducts(
            String keyword,
            Long categoryId,
            PageRequest pageRequest
    ) {
        Page<Product> productsPage = repository.searchProducts(categoryId, keyword, pageRequest);

        return productsPage.map(this::convertProductResponse);
    }

    @Override
    public ProductResponse getProductBySlug(String slug)
            throws Exception {
        Product existingProduct = repository.findProductBySlug(slug)
                .orElseThrow(() ->
                        new DataNotFoundException(
                                "Cannot find product with slug: " + slug
                        )
                );

        return convertProductResponse(existingProduct);
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

        for (String imageName : imageNames) {
            ProductImage productImage = ProductImage.builder()
                    .src(imageName)
                    .alt(imageName)
                    .product(newProduct)
                    .build();
            productImageRepository.save(productImage);
        }

        // Response data
        ProductResponse response = new ProductResponse();

        // Handle variant attributes
        List<Map<String, String>> variantAttributes = productDto.getProductVariants();
        List<ProductVariantResponse> productVariantResponseList = new ArrayList<>();
        for (Map<String, String> variantAttribute : variantAttributes) {
            String productVariantName = generateProductVariantName(variantAttribute);

            // Create ProductVariant
            ProductVariant productVariant = new ProductVariant();
            productVariant.setProductVariantName(productVariantName);
            productVariant.setSku(generateSku(newProduct.getName(), newProduct.getCategory().getName()));
            productVariant.setPrice(Double.parseDouble(variantAttribute.get("price")));
            productVariant.setStock(Integer.parseInt(variantAttribute.get("stock")));
            productVariant.setStatus(productVariant.getStock() > 0);
            productVariant.setProduct(newProduct);
            productVariantRepository.save(productVariant);

            // Loop product variants
            for (Map.Entry<String, String> entry : variantAttribute.entrySet()) {
                String variantName = entry.getKey();
                String variantValue = entry.getValue();

                if (variantName.equals("sku") || variantName.equals("stock") || variantName.equals("price")) {
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
                productDetailRepository.save(productDetail);
            }

            productVariantResponseList.add(ProductVariantResponse.builder()
                    .productVariantName(productVariantName)
                    .sku(productVariant.getSku())
                    .price(productVariant.getPrice())
                    .stock(productVariant.getStock())
                    .status(productVariant.isStatus())
                    .build());
        }

        response.setTitle(newProduct.getName());
        response.setDescription(newProduct.getDescription());
        response.setPrice(Double.parseDouble(productDto.getProductVariants().get(0).get("price")));
        response.setSlug(newProduct.getSlug());
        response.setSale(newProduct.isSale());
        response.setDiscount(newProduct.getDiscount());
        response.setVariants(productVariantResponseList);
        response.setCategoryId(existingCategory.getId());

        return response;
    }

    // TODO: Update product service
    @Override
    public ProductResponse updateProduct(Long id, ProductDto productDto) {
        return null;
    }

    private ProductResponse convertProductResponse(Product existingProduct) {
        ProductResponse productResponse = new ProductResponse();
        productResponse.setTitle(existingProduct.getName());
        productResponse.setDescription(existingProduct.getDescription());
        productResponse.setPrice(existingProduct.getProductVariants().get(0).getPrice());
        productResponse.setSlug(existingProduct.getSlug());
        productResponse.setSale(existingProduct.isSale());
        productResponse.setDiscount(existingProduct.getDiscount());
        productResponse.setVariants(existingProduct.getProductVariants()
                .stream()
                .map(variant ->
                        ProductVariantResponse.builder()
                                .productVariantName(variant.getProductVariantName())
                                .sku(variant.getSku())
                                .price(variant.getPrice())
                                .stock(variant.getStock())
                                .status(variant.isStatus())
                                .attributes(variant.getProductDetails()
                                        .stream()
                                        .collect(Collectors.toMap(
                                                productDetail -> productDetail.getVariantValue().getVariant().getVariant(),
                                                productDetail -> productDetail.getVariantValue().getValue()
                                        )))
                                .build())
                .collect(Collectors.toList()));
        productResponse.setCategoryId(existingProduct.getCategory().getId());
        productResponse.setImages(existingProduct.getProductImages()
                .stream()
                .map(image ->
                        ProductImageResponse.builder()
                                .src(image.getSrc())
                                .alt(image.getAlt())
                                .build())
                .collect(Collectors.toList()));

        return productResponse;
    }

    private String generateSlug(String productName) {
        String slugifyName = productName
                .replaceAll("[$&+,:;=?@#|'<>.^*()%!-]", "")
                .replaceAll("\\s+", " ") // Replace multiple spaces with a single space
                .replaceAll(" ", "-")
                .replaceAll("-+", "-") // Replace multiple hyphens with a single hyphen
                .replaceAll("^-+|-+$", "");   // Remove leading and trailing hyphens

        String uniqueId = UUID.randomUUID().toString()
                .replaceAll("-", ".");

        return slugifyName + "-i." + uniqueId;
    }

    private String generateProductVariantName(Map<String, String> variantAttributes) {
        return variantAttributes.entrySet().stream()
                .filter(entry -> !"sku".equalsIgnoreCase(entry.getKey()) && !"stock".equalsIgnoreCase(entry.getKey()) && !"price".equalsIgnoreCase(entry.getKey()))
                .map(Map.Entry::getValue)
                .collect(Collectors.joining("-"));
    }

    public static String generateSku(String productName, String category) {
        // Convert attributes to uppercase to standardize the SKU format
        String namePart = productName.replaceAll("\\s+", "").substring(0, 3).toUpperCase();
        String categoryPart = category.replaceAll("\\s+", "").substring(0, 3).toUpperCase();

        // Generate a short UUID for uniqueness
        String uniquePart = UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        // Combine all parts to form the SKU
        return namePart + "-" + categoryPart + "-" + uniquePart;
    }
}
