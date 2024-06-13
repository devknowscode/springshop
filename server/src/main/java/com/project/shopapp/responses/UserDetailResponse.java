package com.project.shopapp.responses;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class UserDetailResponse {
     private String username;

    private String email;

    private String fullname;

    private String address;

    private String phone;
}
