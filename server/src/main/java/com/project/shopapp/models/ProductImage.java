package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "product_images")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductImage {

    public static final int MAXIMUM_IMAGES_PER_PRODUCT = 8;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String src;

    private String alt;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
