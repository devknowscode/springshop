package com.project.shopapp.services.impl;

import com.project.shopapp.auth.JwtService;
import com.project.shopapp.dtos.UserDto;
import com.project.shopapp.enums.TokenType;
import com.project.shopapp.exceptions.custom.DataAlreadyExistsException;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.Role;
import com.project.shopapp.models.Token;
import com.project.shopapp.models.User;
import com.project.shopapp.repositories.RoleRepository;
import com.project.shopapp.repositories.TokenRepository;
import com.project.shopapp.repositories.UserRepository;
import com.project.shopapp.responses.AuthenticationResponse;
import com.project.shopapp.responses.UserResponse;
import com.project.shopapp.services.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.coyote.BadRequestException;
import org.modelmapper.ModelMapper;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository repository;
    private final TokenRepository tokenRepository;
    private final PasswordEncoder passwordEncoder;
    private final ModelMapper modelMapper;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final RoleRepository roleRepository;


    @Override
    public AuthenticationResponse createUser(UserDto userDto) throws Exception {
        // Check username and email is exist
        boolean existUser = repository.existsUserByEmail(userDto.getEmail());
        if (existUser) {
            throw new DataAlreadyExistsException("Email has already existed!");
        }

        // Check password and retype password are match
        if (!userDto.getPassword().equals(userDto.getRetypePassword())) {
            throw new BadRequestException("Password is not matched!");
        }

        // Hash password
        userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));

        // Save user
        User user = new User();
        user.setEmail(userDto.getEmail());
        user.setPassword(userDto.getPassword());
        user.setFullname(userDto.getFullname());
        Role role = roleRepository.findById(userDto.getRoleId()).orElse(null);
        if (role == null) {
            throw new DataNotFoundException("Role id is not found");
        }
        user.setRole(role);
        User newUser = repository.save(user);

        // Generate token
        var jwtToken = jwtService.generateToken(newUser);

        // Save token to db
        var token = saveUserToken(newUser, jwtToken);

        // TODO: Save list token user used
        //         if user use old token which used before, we'll delete valid token and take user login again

        // Return auth response
        var response = new AuthenticationResponse();
        response.setUser(modelMapper.map(newUser, UserResponse.class));
        response.setToken(token.getToken());
        return response;
    }

    @Override
    public AuthenticationResponse login(String email, String password, Long roleId) throws Exception {
        // Find user in db
        Optional<User> optionalExistingUser = repository.findByEmail(email);
        if (optionalExistingUser.isEmpty()) {
            throw new DataNotFoundException("Email or password went wrong");
        }

        // Get user from optional
        User existingUser = optionalExistingUser.get();

        // Check password user request and password in db
        if (!passwordEncoder.matches(password, existingUser.getPassword())) {
            throw new BadCredentialsException("Email or password went wrong");
        }

        // Check user is active
        if (!existingUser.isActive()) {
            throw new DataNotFoundException("This user is locked!");
        }

        // Generate token
        var jwtToken = jwtService.generateToken(existingUser);

        // Save user token
        revokeAllUserTokens(existingUser);
        var token = saveUserToken(existingUser, jwtToken);

        // Authenticate user
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(
                        email,
                        password,
                        existingUser.getAuthorities()
                );

        // Authenticate with Spring Security
        authenticationManager.authenticate(authenticationToken);

        // Return auth response
        var response = new AuthenticationResponse();
        response.setUser(modelMapper.map(existingUser, UserResponse.class));
        response.setToken(token.getToken());
        return response;
    }

//    public void logout(String token) {
//
//    }

    private Token saveUserToken(User user, String jwtToken) {
        var token = Token.builder()
                .user(user)
                .token(jwtToken)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();
        tokenRepository.save(token);
        return token;
    }

    private void revokeAllUserTokens(User user) {
        var validUserTokens = tokenRepository.findAllValidTokensByUser(user.getId());
        if (validUserTokens.isEmpty()) {
            return;
        }
        validUserTokens.forEach(t -> {
            t.setExpired(true);
            t.setRevoked(true);
        });
        tokenRepository.saveAll(validUserTokens);
    }
}
