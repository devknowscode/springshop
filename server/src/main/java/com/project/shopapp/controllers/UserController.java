package com.project.shopapp.controllers;

import com.project.shopapp.dtos.UserDetailDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.UserDetailResponse;
import com.project.shopapp.services.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("/v1/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<UserDetailResponse> getUserDetail(@RequestHeader HttpHeaders headers)
            throws Exception {

        final String token = getTokenFromHeaders(headers);
        // Response to user
        var response = new BaseResponse<UserDetailResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("Get user info successfully");
        response.setMetadata(service.getUserDetail(token));
        return response;
    }

    @PutMapping
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<UserDetailResponse> updateUserDetail(
            @RequestHeader HttpHeaders headers,
            @RequestBody UserDetailDto userDetailDto
    ) throws Exception {
        final String token = getTokenFromHeaders(headers);
        var response = new BaseResponse<UserDetailResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("User updated successfully!");
        response.setMetadata(service.updateUserDetail(token, userDetailDto));
        return response;
    }

    private static String getTokenFromHeaders(HttpHeaders headers) throws BadRequestException {
        final String authHeader = Objects.requireNonNull(headers.get("authorization")).get(0);
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            throw new BadRequestException("Permission denied!");
        }
        final String token = authHeader.substring("Bearer ".length());
        return token;
    }
}
