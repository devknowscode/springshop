package com.project.shopapp.services;


import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.responses.AuthenticationResponse;

public interface UserService {
    AuthenticationResponse createUser(UserDto user) throws Exception;
    AuthenticationResponse login(String username, String password, Long roleId) throws Exception;
}
