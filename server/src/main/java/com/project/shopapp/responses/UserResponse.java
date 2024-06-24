package com.project.shopapp.responses;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserResponse {
    private String username;

    private String email;

    @JsonProperty("role_id")
    private Long roleId;
}
