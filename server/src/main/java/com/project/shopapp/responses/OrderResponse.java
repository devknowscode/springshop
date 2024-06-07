package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderResponse {
    @JsonProperty("order_id")
    private Long id;

    @JsonProperty("customer_name")
    private String fullName;

    @JsonProperty("order_total")
    private Double orderTotal;

    @JsonProperty("order_status")
    private String status;

    @JsonProperty("order_date")
    private LocalDateTime orderDate;
}
