package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.project.shopapp.dtos.OrderItemDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailResponse {
    @JsonProperty("order_id")
    private Long id;

    @JsonProperty("customer_name")
    private String fullName;

    @JsonProperty("order_items")
    private List<OrderItemDto> orderItems;

    @JsonProperty("order_total")
    private Double orderTotal;

    @JsonProperty("order_status")
    private String status;

    @JsonProperty("order_date")
    private LocalDateTime orderDate;
}
