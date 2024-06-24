package com.project.shopapp.repositories;

import com.project.shopapp.models.Cart;
import com.project.shopapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

    Optional<Cart> findCartByIdAndUser(Long cartId, User user);

    Cart findCartByUserAndCartState(User user, String state);
}
