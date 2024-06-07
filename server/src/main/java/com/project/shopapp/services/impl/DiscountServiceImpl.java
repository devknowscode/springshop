package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.DiscountDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.Discount;
import com.project.shopapp.models.ProductCategoryDiscount;
import com.project.shopapp.models.ProductDiscount;
import com.project.shopapp.models.id.ProductCategoryDiscountId;
import com.project.shopapp.models.id.ProductDiscountId;
import com.project.shopapp.repositories.*;
import com.project.shopapp.responses.DiscountDetailResponse;
import com.project.shopapp.responses.DiscountResponse;
import com.project.shopapp.services.DiscountService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class DiscountServiceImpl implements DiscountService {

    private final DiscountRepository repository;
    private final ProductDiscountRepository productDiscountRepository;
    private final ProductCategoryDiscountRepository productCategoryDiscountRepository;
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final ModelMapper modelMapper;

    @Override
    @Transactional
    public DiscountDetailResponse createDiscount(DiscountDto discountDto) throws Exception {
        // TODO: check coupon code is existed in db
        Discount existingDiscount = repository.findDiscountByCouponCode(discountDto.getCouponCode());

        // TODO: check coupon code is starting or end
        LocalDateTime currentTime = LocalDateTime.now();
        if (existingDiscount.getValidFrom().isBefore(currentTime) &&
                existingDiscount.getValidUntil().isAfter(currentTime)) {
            throw new BadRequestException("Discount is starting");
        }

        // TODO: check start time and end time is valid
        if (discountDto.getValidFrom().isAfter(discountDto.getValidUntil()) ||
                discountDto.getValidFrom().isBefore(currentTime) ||
                discountDto.getValidUntil().isBefore(currentTime)
        ) {
            throw new BadRequestException("Invalid time to start or end discount");
        }

        Discount discount = modelMapper.map(discountDto, Discount.class);
        Discount newDiscount = repository.save(discount);

        // check discount is applied to all products
        if (!discountDto.isAllProducts()) {
            if (discountDto.getProductIds() != null) {
                for (Long productId : discountDto.getProductIds()) {
                    // check if products is existing in db
                    if (productRepository.existsById(productId)) {
                        ProductDiscountId productDiscountId = new ProductDiscountId(productId, newDiscount.getId());
                        ProductDiscount productDiscount = new ProductDiscount(productDiscountId);
                        productDiscountRepository.save(productDiscount);
                    }
                }
            }

            if (discountDto.getCategoryIds() != null) {
                for (Long categoryId : discountDto.getCategoryIds()) {
                    // check if products is existing in db
                    if (categoryRepository.existsById(categoryId)) {
                        ProductCategoryDiscountId productCategoryDiscountId = new ProductCategoryDiscountId(categoryId, newDiscount.getId());
                        ProductCategoryDiscount productCategoryDiscount = new ProductCategoryDiscount(productCategoryDiscountId);
                        productCategoryDiscountRepository.save(productCategoryDiscount);
                    }
                }
            }
        }

        return modelMapper.map(newDiscount, DiscountDetailResponse.class);
    }

    @Override
    public List<DiscountResponse> getAllDiscounts() {
        List<Discount> discounts = repository.findAll();
        return discounts
                .stream()
                .map(discount -> modelMapper.map(discount, DiscountResponse.class))
                .collect(Collectors.toList());
    }

    @Override
    public DiscountDetailResponse getDiscountById(Long id) throws Exception {
        Optional<Discount> existingDiscountOptional = repository.findById(id);
        if (existingDiscountOptional.isEmpty()) {
            throw new DataNotFoundException("Discount not found");
        }
        Discount existingDiscount = existingDiscountOptional.get();

        return modelMapper.map(existingDiscount, DiscountDetailResponse.class);
    }

    @Override
    public DiscountDetailResponse updateDiscount(
            DiscountDto discountDto,
            Long id
    ) throws Exception {
        // when to update?
        // *condition: update before discount start
        // 1. update base info: discount_name, description, unit, value
        // 2. change time to discount start and end
        // 3. change maximum_discount_amount, amount_used, max_uses_per_user,
        // minimum_order_value
        // 4. change is_all_products

        // check discount_id is valid
        Optional<Discount> existingDiscountOpt = repository.findById(id);
        if (existingDiscountOpt.isEmpty()) {
            throw new DataNotFoundException("Discount not found");
        }
        // get discount
        Discount existingDiscount = existingDiscountOpt.get();

        // check if the discount has already started
        LocalDateTime currentTime = LocalDateTime.now();
        if (existingDiscount.getValidFrom() != null &&
                existingDiscount.getValidFrom().isBefore(currentTime)) {
            throw new BadRequestException("Discount has already stared, cannot update");
        }

        // check if the discount has already ended
        if (existingDiscount.getValidUntil() != null &&
                existingDiscount.getValidUntil().isBefore(currentTime)) {
            throw new BadRequestException("Discount has already ended, cannot update");
        }

        // set fields to update
        existingDiscount.setDiscountName(discountDto.getDiscountName());
        existingDiscount.setDiscountDescription(discountDto.getDiscountDescription());
        existingDiscount.setDiscountUnit(discountDto.getDiscountUnit());
        existingDiscount.setDiscountValue(discountDto.getDiscountValue());
        existingDiscount.setCouponCode(discountDto.getCouponCode());
        existingDiscount.setValidFrom(discountDto.getValidFrom());
        existingDiscount.setValidUntil(discountDto.getValidUntil());
        existingDiscount.setMaximumDiscountAmount(discountDto.getMaximumDiscountAmount());
        existingDiscount.setMaxUsesPerUser(discountDto.getMaxUsesPerUser());
        existingDiscount.setMinimumOrderValue(discountDto.getMinimumOrderValue());
        existingDiscount.setAllProducts(discountDto.isAllProducts());

        // update
        Discount updatedDiscount = repository.save(existingDiscount);

        return modelMapper.map(updatedDiscount, DiscountDetailResponse.class);
    }

    @Override
    public void deleteDiscount(Long id) throws Exception {
        // soft delete -> change is_active to 'false'
        Optional<Discount> existingDiscountOpt = repository.findById(id);
        if (existingDiscountOpt.isEmpty()) {
            throw new DataNotFoundException("Discount not found");
        }
        Discount existingDiscount = existingDiscountOpt.get();
        existingDiscount.setActive(false);
        repository.save(existingDiscount);
    }
}
