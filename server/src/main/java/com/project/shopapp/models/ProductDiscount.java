package com.project.shopapp.models;

import com.project.shopapp.models.id.ProductDiscountId;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "product_discounts")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDiscount {
    @EmbeddedId
    private ProductDiscountId id;
}
