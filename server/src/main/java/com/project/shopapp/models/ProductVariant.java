package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "product_variants")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductVariant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "product_variant_name", nullable = false)
    private String productVariantName;

    @Column(nullable = false, unique = true)
    private String sku;

    @Column(nullable = false)
    private int price;

    @Column(nullable = false)
    private int stock;

    @Column(nullable = false)
    private boolean status; // 0: out of stock, 1: in stock

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @OneToMany(mappedBy = "productVariant", cascade = CascadeType.ALL)
    private List<ProductDetail> productDetails;

    @OneToMany(mappedBy = "productVariant")
    private List<CartProduct> cartProducts;

    @OneToMany(mappedBy = "productVariant")
    private List<OrderProduct> orderProducts;
}
