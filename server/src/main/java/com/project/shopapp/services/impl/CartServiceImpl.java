package com.project.shopapp.services.impl;

import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.Cart;
import com.project.shopapp.models.CartProduct;
import com.project.shopapp.models.Product;
import com.project.shopapp.models.User;
import com.project.shopapp.repositories.CartProductRepostiory;
import com.project.shopapp.repositories.CartRepository;
import com.project.shopapp.repositories.ProductRepository;
import com.project.shopapp.repositories.UserRepository;
import com.project.shopapp.responses.CartResponse;
import com.project.shopapp.services.CartSerice;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartSerice {

    private final CartRepository repository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final CartProductRepostiory cartProductRepostiory;

    @Override
    @Transactional
    public CartResponse addToCart(CartDto cartDto) throws Exception {
        // check user existed
        User existingUser = userRepository.findById(cartDto.getUserId())
                .orElseThrow(() ->
                        new DataNotFoundException("User ID " + cartDto.getUserId() + " is not existed!")
                );

        // check product existed
        Product product = productRepository.findById(cartDto.getProductId())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with ID " + cartDto.getProductId())
                );

        // TODO: check product_quantity in product vs product_qty requested

        // check cart of user created
        Cart existingCart = repository.findCartByUserId(cartDto.getUserId());

        if (existingCart == null || !existingCart.getCartState().equals("active")) {
            Cart newCart = Cart.builder()
                    .cartState("active")
                    .user(existingUser)
                    .build();
            // create new cart
            Cart cart = repository.save(newCart);

            // save product added to cart
            CartProduct cartProduct = CartProduct.builder()
                    .cartId(cart.getId())
                    .productId(product.getId())
                    .productQty(cartDto.getProductQty())
                    .build();
            cartProductRepostiory.save(cartProduct);

            return new CartResponse(cart.getId(), cart.getCartState(), List.of(cartProduct));
        }

        // save product added to cart
        Optional<CartProduct> existingCartProductOptional =
            cartProductRepostiory.findCartProductByCartIdAndProductId(existingCart.getId(), product.getId());

        // check product which user added to cart before
        if (existingCartProductOptional.isPresent()) {
            CartProduct existingCartProduct = existingCartProductOptional.get();
            int currentQty = existingCartProduct.getProductQty();
            existingCartProduct.setProductQty(currentQty + cartDto.getProductQty());
            // update qty product in cart product
            cartProductRepostiory.save(existingCartProduct);
        } else {
            CartProduct cartProduct = CartProduct.builder()
                    .cartId(existingCart.getId())
                    .productId(product.getId())
                    .productQty(cartDto.getProductQty())
                    .build();
            // save new product in cart
            cartProductRepostiory.save(cartProduct);
        }

        List<CartProduct> existingCartProducts = cartProductRepostiory.findById_CartId(existingCart.getId());
        return new CartResponse(existingCart.getId(), existingCart.getCartState(), existingCartProducts);
    }
}
