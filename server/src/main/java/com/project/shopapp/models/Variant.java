package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Set;

@Entity
@Table(name = "variants")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Variant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String variant;

    @OneToMany(mappedBy = "variant", cascade = CascadeType.ALL)
    private Set<VariantValue> variantValues;

    @OneToMany(mappedBy = "variant", cascade = CascadeType.ALL)
    private Set<CategoryVariant> categoryVariants;

    // getters and setters
}


