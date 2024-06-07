package com.project.shopapp.responses;

import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Getter
@Setter
public class BaseResponse<T> {
    private int status;
    private String message;
    private T metadata;
}
