package com.project.shopapp.repositories;

import com.project.shopapp.models.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Long> {

    @Query("""
    SELECT t FROM Token t
    INNER JOIN User u
    ON t.user.id = u.id
    WHERE u.id = :userId AND t.expired = false OR t.revoked = false
    """)
    List<Token> findAllValidTokensByUser(Long userId);

    Optional<Token> findByToken(String token);
}
