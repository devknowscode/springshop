package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "order_products")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "product_qty")
    private int productQty;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @ManyToOne
    @JoinColumn(name = "product_variant_id", nullable = false)
    private ProductVariant productVariant;
}
