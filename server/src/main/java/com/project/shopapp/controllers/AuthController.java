package com.project.shopapp.controllers;

import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.dtos.UserLoginDto;
import com.project.shopapp.responses.AuthenticationResponse;
import com.project.shopapp.responses.BaseResponse;
import com.project.shopapp.services.AuthService;
import com.project.shopapp.utils.BindingResultError;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService service;

    @PostMapping("/signup")
    @ResponseStatus(HttpStatus.CREATED)
    public BaseResponse<AuthenticationResponse> register(
            @RequestBody @Valid UserDto user,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<AuthenticationResponse>();
        response.setStatus(HttpStatus.CREATED.value());
        response.setMessage("User created successfully");
        response.setMetadata(service.register(user));
        return response;
    }

    @PostMapping("/login")
    @ResponseStatus(HttpStatus.OK)
    public BaseResponse<AuthenticationResponse> authenticate(
            @RequestBody @Valid UserLoginDto userLoginDto,
            BindingResult bindingResult
    ) throws Exception {
        // Check valid field before handling
        BindingResultError.handle(bindingResult);

        // Response to user
        var response = new BaseResponse<AuthenticationResponse>();
        response.setStatus(HttpStatus.OK.value());
        response.setMessage("User login successfully");
        response.setMetadata(service.authenticate(
                userLoginDto.getEmail(),
                userLoginDto.getPassword(),
                userLoginDto.getRoleId() == null ? 1 : userLoginDto.getRoleId())
        );
        return response;
    }
}
