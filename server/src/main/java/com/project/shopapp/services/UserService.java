package com.project.shopapp.services;

import com.project.shopapp.dtos.UserDetailDto;
import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.responses.UserDetailResponse;
import com.project.shopapp.responses.UserResponse;

public interface UserService {
    UserDetailResponse getUserDetail(String token) throws Exception;

    UserDetailResponse updateUserDetail(
            String token,
            UserDetailDto userDetailDto
    ) throws Exception;
}
