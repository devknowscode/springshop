package com.project.shopapp.models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "orders")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "note", columnDefinition = "TEXT")
    private String note;

    // enum: paypal, mastercard, visa, cash, momo, zalopay
    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "tracking_number")
    private String trackingNumber;

    @Column(name = "order_date", nullable = false)
    @CreatedDate
    private LocalDateTime orderDate;

    @Column(name = "status")
    private String status;

    @Column(name = "is_active")
    private boolean isActive = true;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "order")
    private List<OrderProduct> orderProducts;

    @OneToOne(mappedBy = "order")
    private OrderCheckout orderCheckout;
}
