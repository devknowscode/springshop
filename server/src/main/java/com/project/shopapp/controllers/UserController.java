package com.project.shopapp.controllers;

import com.project.shopapp.dtos.UserDetailDto;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.responses.UserDetailResponse;
import com.project.shopapp.services.UserService;
import com.project.shopapp.utils.AuthUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @GetMapping
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<UserDetailResponse> getUserDetail(@RequestHeader HttpHeaders headers)
            throws Exception {

        final String token = AuthUtils.getTokenInHeaders(headers);
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
        final String token = AuthUtils.getTokenInHeaders(headers);
        var response = new BaseResponse<UserDetailResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("User updated successfully!");
        response.setMetadata(service.updateUserDetail(token, userDetailDto));
        return response;
    }
}
