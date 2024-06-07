package com.project.shopapp.exceptions.custom;


import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

public class DataAlreadyExistsException extends Exception {
    public DataAlreadyExistsException(String message) {
        super(message);
    }
}
