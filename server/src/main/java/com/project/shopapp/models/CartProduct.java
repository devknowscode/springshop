package com.project.shopapp.models;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.models.id.CartProductId;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "cart_products")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartProduct {
    @EmbeddedId
    private CartProductId id;

    @Column(name = "product_qty")
    @JsonProperty("product_qty")
    private int productQty;
}


