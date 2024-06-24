package com.project.shopapp.utils;

import com.project.shopapp.exceptions.custom.InvalidFieldException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.List;

public class BindingResultError {
    static public void handle(BindingResult bindingResult) throws InvalidFieldException {
        if (bindingResult.hasErrors()) {
            List<String> errorMessages = bindingResult.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .toList();

            throw new InvalidFieldException(errorMessages.toString());
        }
    }
}
