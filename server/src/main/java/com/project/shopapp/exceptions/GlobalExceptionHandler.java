package com.project.shopapp.exceptions;

import com.project.shopapp.exceptions.custom.DataAlreadyExistsException;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.exceptions.custom.InvalidFieldException;
import com.project.shopapp.responses.ErrorResponse;
import io.jsonwebtoken.ExpiredJwtException;
import org.apache.coyote.BadRequestException;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.resource.NoResourceFoundException;

import java.sql.Timestamp;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(DataAlreadyExistsException.class)
    @ResponseStatus(HttpStatus.CONFLICT)
    public ErrorResponse handleDataAlreadyExistsException(DataAlreadyExistsException e) {
        return new ErrorResponse(
                new Timestamp(System.currentTimeMillis()),
                HttpStatus.CONFLICT.value(),
                HttpStatus.CONFLICT.name(),
                e.getMessage()
        );
    }

    @ExceptionHandler({
            BadRequestException.class,
            DataNotFoundException.class,
            InvalidFieldException.class,
            BadCredentialsException.class,
            ExpiredJwtException.class
    })
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ErrorResponse handleBadRequestException(Exception e) {
        return new ErrorResponse(
                new Timestamp(System.currentTimeMillis()),
                HttpStatus.BAD_REQUEST.value(),
                HttpStatus.BAD_REQUEST.name(),
                e.getMessage()
        );
    }

    @ExceptionHandler(NoResourceFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ErrorResponse handleNotFoundException() {
        return new ErrorResponse(
                new Timestamp(System.currentTimeMillis()),
                HttpStatus.NOT_FOUND.value(),
                HttpStatus.NOT_FOUND.name(),
                "Page not found!"
        );
    }

    @ExceptionHandler(Exception.class)
    public ErrorResponse handleUnwantedException(Exception e) {
        System.out.println(e.getMessage());
        return new ErrorResponse(
                new Timestamp(System.currentTimeMillis()),
                HttpStatus.INTERNAL_SERVER_ERROR.value(),
                HttpStatus.INTERNAL_SERVER_ERROR.name(),
                "Internal Server Error."
        );
    }
}
