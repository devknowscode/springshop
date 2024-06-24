package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "product_attributes")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductAttribute {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "k", nullable = false)
    private String key;

    @Column(name = "v", nullable = false)
    private String value;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
}
