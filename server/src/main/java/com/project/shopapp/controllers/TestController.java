package com.project.shopapp.controllers;

import com.project.shopapp.auth.JwtService;
import com.project.shopapp.utils.ImageUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;

@RestController
@RequiredArgsConstructor
public class TestController {

    private final JwtService jwtService;

    @GetMapping("test")
    public String test() {
        return "This is test from GET method";
    }

    @GetMapping("/secretkey")
    public String getSecretKey() {
        return jwtService.generateSecretKey();
    }

    @PostMapping("test")
    public String postTesting() {
        return "This is test from POST method";
    }
}
