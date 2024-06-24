package com.project.shopapp.utils;

import org.apache.coyote.BadRequestException;
import org.springframework.http.HttpHeaders;

import java.util.Objects;


public final class AuthUtils {

    public static String getTokenInHeaders(HttpHeaders headers) throws BadRequestException {
        final String authHeader = Objects.requireNonNull(headers.get("authorization")).get(0);
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            throw new BadRequestException("Permission denied!");
        }
        final String token = authHeader.substring("Bearer ".length());
        return token;
    }
}
