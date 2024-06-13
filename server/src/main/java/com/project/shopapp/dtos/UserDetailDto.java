package com.project.shopapp.dtos;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class UserDetailDto  {
    private String username;

    private String email;

    private String fullname;

    private String address;

    private String phone;
}

