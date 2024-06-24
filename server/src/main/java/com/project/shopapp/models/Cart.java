package com.project.shopapp.models;


import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "carts")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "cart_state")
    private String cartState;

    @OneToMany(mappedBy = "cart")
    private List<CartProduct> cartProducts;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
