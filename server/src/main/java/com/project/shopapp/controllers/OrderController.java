package com.project.shopapp.controllers;

import com.project.shopapp.dtos.OrderDto;
import com.project.shopapp.responses.*;
import com.project.shopapp.services.OrderService;
import com.project.shopapp.utils.AuthUtils;
import com.project.shopapp.utils.BindingResultError;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/api/orders")
@RequiredArgsConstructor
public class OrderController {
    private final OrderService service;

    // Endpoint to create a new order
    @PostMapping
    public BaseResponse<OrderDetailResponse> createOrder(
            @RequestHeader HttpHeaders headers,
            @RequestBody OrderDto order,
            BindingResult bindingResult
    ) throws Exception {
        String token = AuthUtils.getTokenInHeaders(headers);
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<OrderDetailResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("Ordered products successfully!");
        response.setMetadata(service.createOrder(token, order));
        return response;
    }

//    @GetMapping
//    @ResponseStatus(HttpStatus.OK)
//    public BaseResponse<OrderListResponse> getAllOrders(
//            @RequestParam(name = "page", defaultValue = "0") int page,
//            @RequestParam(name = "limit", defaultValue = "5") int limit
//    ) {
//        // create pageable from page and limit
//        PageRequest pageRequest = PageRequest.of(
//                page, limit,
//                Sort.by("id").ascending()
//        );
//
//        Page<OrderResponse> orderResponses = service.getAllOrders(pageRequest);
//        OrderListResponse metadata = OrderListResponse.builder()
//                .orders(orderResponses.getContent())
//                .totalPages(orderResponses.getTotalPages())
//                .build();
//
//        var response = new BaseResponse<OrderListResponse>();
//        response.setStatus(HttpStatus.OK.value());
//        response.setMessage("Get all products successfully!");
//        response.setMetadata(metadata);
//        return response;
//    }
//
//    // Endpoint to get a specific order by ID
//    @GetMapping("/{orderId}")
//    @ResponseStatus(HttpStatus.OK)
//    public BaseResponse<OrderDetailResponse> getOrderById(@PathVariable("orderId") Long orderId) {
//        var response = new BaseResponse<OrderDetailResponse>();
//        response.setStatus(HttpStatus.OK.value());
//        response.setMessage("Get order by ID successfully");
//        response.setMetadata(service.getOrderById(orderId));
//        return response;
//    }
//
//    // Endpoint to update an existing order
//    @PatchMapping("/{orderId}")
//    public BaseResponse<OrderDetailResponse> updateOrder(
//            @PathVariable("orderId") Long orderId,
//            @RequestBody OrderDto order,
//            BindingResult bindingResult
//    ) throws Exception {
//        // Check valid field before handling
//        BindingResultError.handle(bindingResult);
//
//        // Response to user
//        var response = new BaseResponse<OrderDetailResponse>();
//        response.setStatus(HttpStatus.OK.value());
//        response.setMessage("Updated order successfully");
//        response.setMetadata(service.updateOrder(order, orderId));
//        return response;
//    }
//
//    // TODO: Endpoint to get orders with specific user
//
//    @DeleteMapping("/{orderId}")
//    public BaseResponse<Void> deleteOrder(@PathVariable("orderId") Long orderId) {
//        // delete order method
//        service.deleteOrder(orderId);
//
//        // response to user
//        var response = new BaseResponse<Void>();
//        response.setStatus(HttpStatus.OK.value());
//        response.setMessage("Deleted order successfully");
//        response.setMetadata(null);
//        return response;
//    }
}
