package com.project.shopapp.controllers;

import com.project.shopapp.models.Role;
import com.project.shopapp.services.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/v1/api/roles")
@RequiredArgsConstructor
public class RoleController {

    private final RoleService service;

    @GetMapping("")
    @ResponseStatus(HttpStatus.OK)
    public List<Role> getAllRoles() {
        return service.getAllRoles();
    }
}
