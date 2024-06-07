package com.project.shopapp.responses;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
public class ErrorResponse {
    private Timestamp timestamp;
    private int status;
    private String error;
    private String message;
}
