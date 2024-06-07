package com.project.shopapp.models;

import com.project.shopapp.models.id.ProductCategoryDiscountId;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "product_category_discounts")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductCategoryDiscount {
    @EmbeddedId
    private ProductCategoryDiscountId id;
}
