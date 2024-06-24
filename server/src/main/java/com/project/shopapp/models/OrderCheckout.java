package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "order_checkouts")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderCheckout {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "total_amount")
    private int totalAmount;

    @Column(name = "fee_ship")
    private int shippingFee;

    @Column(name = "total_checkout")
    private int totalCheckout;

    @OneToOne
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;
}
