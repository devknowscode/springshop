package com.project.shopapp.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
//    @NotBlank(message = "Username is required")
//    private String username;

    @NotBlank(message = "Email is required")
    private String email;

    @NotEmpty(message = "Password is required")
    private String password;

    @JsonProperty("retype_password")
    @NotEmpty(message = "Retype password is required")
    private String retypePassword;

    private String fullname;

//    private String address;
//    private String phone;
//    private Date dob;

    @JsonProperty("is_verify")
    private boolean isVerify;

    @JsonProperty("is_active")
    private boolean isActive;

    @NotNull(message = "Role ID is required")
    @JsonProperty("role_id")
    private Long roleId;
}
