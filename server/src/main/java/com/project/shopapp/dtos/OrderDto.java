package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.dtos.requests.OrderItemRequest;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
    @JsonProperty("customer_name")
    private String customerName;

    private String phone;

    private String address;

    private String note;

    @JsonProperty("order_items")
    private List<OrderItemRequest> orderItems;

    @JsonProperty("payment_method")
    private String paymentMethod;
}
