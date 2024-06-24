package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "category_variants")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVariant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "variant_id")
    private Variant variant;
}

