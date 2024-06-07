package com.project.shopapp.controllers;

import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.dtos.UserLoginDto;
import com.project.shopapp.responses.AuthenticationResponse;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.services.UserService;
import com.project.shopapp.utils.BindingResultError;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/api/auth")
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @PostMapping("/signup")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<AuthenticationResponse> createUser(
            @RequestBody @Valid UserDto user,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<AuthenticationResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("User created successfully");
        response.setMetadata(service.createUser(user));
        return response;
    }

    @PostMapping("/login")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<AuthenticationResponse> login(
            @RequestBody @Valid UserLoginDto userLoginDto,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<AuthenticationResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("User login successfully");
        response.setMetadata(service.login(
                userLoginDto.getEmail(),
                userLoginDto.getPassword(),
                userLoginDto.getRoleId() == null ? 1 : userLoginDto.getRoleId())
        );
        return response;
    }
}
