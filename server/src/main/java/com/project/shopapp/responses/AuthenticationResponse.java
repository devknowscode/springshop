package com.project.shopapp.responses;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthenticationResponse {
    private UserResponse user;
    private String token;
}
