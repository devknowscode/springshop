package com.project.shopapp.controllers;

import com.project.shopapp.auth.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/api/test")
@RequiredArgsConstructor
public class TestController {

    private final JwtService jwtService;

    @GetMapping
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
