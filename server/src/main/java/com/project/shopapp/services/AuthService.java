package com.project.shopapp.services;


import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.responses.AuthenticationResponse;

public interface AuthService {
    AuthenticationResponse register(UserDto user) throws Exception;
    AuthenticationResponse authenticate(String username, String password, Long roleId) throws Exception;
}
