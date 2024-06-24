package com.project.shopapp.services.impl;

import com.project.shopapp.auth.JwtService;
import com.project.shopapp.dtos.UserDetailDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.User;
import com.project.shopapp.repositories.UserRepository;
import com.project.shopapp.responses.UserDetailResponse;
import com.project.shopapp.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final JwtService jwtService;
    private final UserRepository repository;

    @Override
    public UserDetailResponse getUserDetail(String token)
            throws Exception {
        String email = jwtService.extractUsername(token);
        User user = repository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException("Email or password went wrong"));

        return UserDetailResponse.builder()
                .username(user.getUsername() == null ? "" : user.getUsername())
                .email(user.getEmail() == null ? "" : user.getEmail())
                .fullname(user.getFullname() == null ? "" : user.getFullname())
                .address(user.getAddress() == null ? "" : user.getAddress())
                .phone(user.getPhone() == null ? "" : user.getPhone())
                .build();
    }

    @Override
    public UserDetailResponse updateUserDetail(String token, UserDetailDto userDetailDto) throws Exception {
        String email = jwtService.extractUsername(token);
        User user = repository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException("Email or password went wrong"));

        // Update user detail
        user.setUsername(userDetailDto.getUsername());
        user.setAddress(userDetailDto.getAddress());
        user.setPhone(userDetailDto.getPhone());
        user.setEmail(userDetailDto.getEmail());
        user.setFullname(userDetailDto.getFullname());
        repository.save(user);

        return UserDetailResponse.builder()
                .username(user.getUsername() == null ? "" : user.getUsername())
                .email(user.getEmail() == null ? "" : user.getEmail())
                .fullname(user.getFullname() == null ? "" : user.getFullname())
                .address(user.getAddress() == null ? "" : user.getAddress())
                .phone(user.getPhone() == null ? "" : user.getPhone())
                .build();
    }
}
