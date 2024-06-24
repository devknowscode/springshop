package com.project.shopapp.services.impl;

import com.project.shopapp.models.Role;
import com.project.shopapp.repositories.RoleRepository;
import com.project.shopapp.services.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {

    private final RoleRepository repository;

    @Override
    public List<Role> getAllRoles() {
        return repository.findAll();
    }
}
