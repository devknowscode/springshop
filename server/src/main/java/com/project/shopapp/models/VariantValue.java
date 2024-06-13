package com.project.shopapp.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.Set;

@Entity
@Table(name = "variant_value")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class VariantValue {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String value;

    @ManyToOne
    @JoinColumn(name = "variant_id")
    private Variant variant;

    @OneToMany(mappedBy = "variantValue", cascade = CascadeType.ALL)
//    @JsonBackReference
    private Set<ProductDetail> productDetails;
}

