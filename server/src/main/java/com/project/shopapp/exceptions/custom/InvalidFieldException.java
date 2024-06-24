package com.project.shopapp.exceptions.custom;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

public class InvalidFieldException extends Exception {
    public InvalidFieldException(String message) {
        super(message);
    }
}
