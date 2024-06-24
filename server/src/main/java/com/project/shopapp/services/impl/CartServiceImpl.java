package com.project.shopapp.services.impl;

import com.project.shopapp.auth.JwtService;
import com.project.shopapp.dtos.CartDto;
import com.project.shopapp.dtos.CartProductDto;
import com.project.shopapp.dtos.CartRemoveDto;
import com.project.shopapp.exceptions.custom.DataNotFoundException;
import com.project.shopapp.models.*;
import com.project.shopapp.repositories.*;
import com.project.shopapp.responses.CartResponse;
import com.project.shopapp.services.CartService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

    private final CartRepository repository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    private final CartProductRepostiory cartProductRepostiory;
    private final ProductVariantRepository productVariantRepository;
    private final JwtService jwtService;

    @Override
    @Transactional
    public CartResponse addToCart(String token, CartDto cartDto) throws Exception {
        String email = jwtService.extractUsername(token);
        // check user existed
        User existingUser = userRepository.findByEmail(email)
                .orElseThrow(() ->
                        new DataNotFoundException("Email `" + email + "` is not existed!")
                );

        // check product existed
        Product product = productRepository.findById(cartDto.getProductId())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with ID " + cartDto.getProductId())
                );

        // check product variant existed with sku
        ProductVariant productVariant = productVariantRepository.findByProductAndSku(product, cartDto.getProductSku())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with sku " + cartDto.getProductSku())
                );

        // TODO: check product_quantity in product vs product_qty requested

        // check cart of user created
        Cart existingCart = repository.findCartByUserAndCartState(existingUser, "active");

        // situation 1: cart is not existed
        if (existingCart == null || !existingCart.getCartState().equals("active")) {
            return createCart(existingUser, product, productVariant, cartDto);
        }

        // save product added to cart
        Optional<CartProduct> existingCartProductOptional =
                cartProductRepostiory.findByCartAndProductAndProductVariant(existingCart, product, productVariant);

        // situation 2: cart existed, product doesn't exist in cart
        if (existingCartProductOptional.isEmpty()) {
            CartProduct cartProduct = CartProduct.builder()
                    .cart(existingCart)
                    .product(product)
                    .productVariant(productVariant)
                    .productQty(cartDto.getProductQty())
                    .build();
            // save new product in cart
            cartProductRepostiory.save(cartProduct);
        } else {
            // situation 3: cart existed, product exists in cart
            CartProduct existingCartProduct = existingCartProductOptional.get();
            int currentQty = existingCartProduct.getProductQty();
            existingCartProduct.setProductQty(currentQty + cartDto.getProductQty());
            // update qty product in cart product
            cartProductRepostiory.save(existingCartProduct);
        }

        List<CartProduct> existingCartProducts = cartProductRepostiory.findCartProductByCart(existingCart);
        return new CartResponse(
                existingCart.getId(),
                existingCart.getCartState(),
                existingCartProducts
                        .stream()
                        .map((item) -> CartProductDto.builder()
                                .productId(item.getProduct().getId())
                                .productSku(item.getProductVariant().getSku())
                                .productName(item.getProduct().getName())
                                .productImage(item.getProduct().getProductImages().get(0).getSrc())
                                .productSlug(item.getProduct().getSlug())
                                .productVariantName(item.getProductVariant().getProductVariantName())
                                .productQty(item.getProductQty())
                                .productStock(item.getProductVariant().getStock())
                                .productPrice(item.getProductVariant().getPrice())
                                .productDiscount(item.getProduct().getDiscount())
                                .total(item.getProductQty() * item.getProductVariant().getPrice())
                                .build())
                        .collect(Collectors.toList()));
    }

    @Override
    public CartResponse getCartActiveStatus(String token) throws DataNotFoundException {
        String email = jwtService.extractUsername(token);

        // check user
        User existingUser = userRepository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException("User not found"));

        Cart activeCart = repository.findCartByUserAndCartState(existingUser, "active");

        return new CartResponse(
                activeCart.getId(),
                activeCart.getCartState(),
                activeCart.getCartProducts()
                        .stream()
                        .map((item) -> CartProductDto.builder()
                                .productId(item.getProduct().getId())
                                .productSku(item.getProductVariant().getSku())
                                .productName(item.getProduct().getName())
                                .productImage(item.getProduct().getProductImages().get(0).getSrc())
                                .productSlug(item.getProduct().getSlug())
                                .productVariantName(item.getProductVariant().getProductVariantName())
                                .productQty(item.getProductQty())
                                .productStock(item.getProductVariant().getStock())
                                .productPrice(item.getProductVariant().getPrice())
                                .productDiscount(item.getProduct().getDiscount())
                                .total(item.getProductQty() * item.getProductVariant().getPrice())
                                .build()).collect(Collectors.toList())
        );
    }

    @Override
    public CartResponse updateProductInCart(
            String token,
            Long cartId,
            CartDto cartDto
    ) throws Exception {
        String email = jwtService.extractUsername(token);
        // check user existed
        User existingUser = userRepository.findByEmail(email)
                .orElseThrow(() ->
                        new DataNotFoundException("Email `" + email + "` is not existed!")
                );

        Cart existingCart = repository.findCartByIdAndUser(cartId, existingUser)
                .orElseThrow(() ->
                        new DataNotFoundException("Not found cart with ID: `" + cartId + "`")
                );

        // check product existed
        Product product = productRepository.findById(cartDto.getProductId())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with ID " + cartDto.getProductId())
                );

        // check product variant existed with sku
        ProductVariant productVariant = productVariantRepository.findByProductAndSku(product, cartDto.getProductSku())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with sku " + cartDto.getProductSku())
                );

        CartProduct existingCartProduct = cartProductRepostiory.findByCartAndProductAndProductVariant(existingCart, product, productVariant)
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product `" + product.getName() + ": " + productVariant.getProductVariantName() + "`")
                );

        existingCartProduct.setProductQty(cartDto.getProductQty());
        cartProductRepostiory.save(existingCartProduct);

        return new CartResponse(
                existingCart.getId(),
                existingCart.getCartState(),
                existingCart.getCartProducts()
                        .stream()
                        .map((item) -> CartProductDto.builder()
                                .productId(item.getProduct().getId())
                                .productSku(item.getProductVariant().getSku())
                                .productName(item.getProduct().getName())
                                .productImage(item.getProduct().getProductImages().get(0).getSrc())
                                .productSlug(item.getProduct().getSlug())
                                .productVariantName(item.getProductVariant().getProductVariantName())
                                .productQty(item.getProductQty())
                                .productStock(item.getProductVariant().getStock())
                                .productPrice(item.getProductVariant().getPrice())
                                .productDiscount(item.getProduct().getDiscount())
                                .total(item.getProductQty() * item.getProductVariant().getPrice())
                                .build()).collect(Collectors.toList())
        );
    }

    @Override
    @Transactional
    public CartResponse removeProductInCart(String token, Long cartId, CartRemoveDto cartRemoveDto) throws Exception {
        String email = jwtService.extractUsername(token);

        // check user existed
        User existingUser = userRepository.findByEmail(email)
                .orElseThrow(() ->
                        new DataNotFoundException("Email `" + email + "` is not existed!")
                );

        Cart existingCart = repository.findCartByIdAndUser(cartId, existingUser)
                .orElseThrow(() ->
                        new DataNotFoundException("Not found cart with ID: `" + cartId + "`")
                );

        // check product existed
        Product product = productRepository.findById(cartRemoveDto.getProductId())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with ID " + cartRemoveDto.getProductId())
                );

        // check product variant existed with sku
        ProductVariant productVariant = productVariantRepository.findByProductAndSku(product, cartRemoveDto.getProductSku())
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product with sku " + cartRemoveDto.getProductSku())
                );

        CartProduct existingCartProduct = cartProductRepostiory.findByCartAndProductAndProductVariant(existingCart, product, productVariant)
                .orElseThrow(() ->
                        new DataNotFoundException("Cannot find product `" + product.getName() + ": " + productVariant.getProductVariantName() + "`")
                );

        // Remove product
        cartProductRepostiory.deleteByCartAndProductAndProductVariant(existingCart, product, productVariant);
        return new CartResponse(
                existingCart.getId(),
                existingCart.getCartState(),
                existingCart.getCartProducts()
                        .stream()
                        .filter((item) -> !Objects.equals(item.getId(), existingCartProduct.getId()))
                        .map((item) -> CartProductDto.builder()
                                .productId(item.getProduct().getId())
                                .productSku(item.getProductVariant().getSku())
                                .productName(item.getProduct().getName())
                                .productImage(item.getProduct().getProductImages().get(0).getSrc())
                                .productSlug(item.getProduct().getSlug())
                                .productVariantName(item.getProductVariant().getProductVariantName())
                                .productQty(item.getProductQty())
                                .productStock(item.getProductVariant().getStock())
                                .productPrice(item.getProductVariant().getPrice())
                                .productDiscount(item.getProduct().getDiscount())
                                .total(item.getProductQty() * item.getProductVariant().getPrice())
                                .build()).collect(Collectors.toList()));
    }

    private CartResponse createCart(User existingUser, Product product, ProductVariant productVariant, CartDto cartDto) {
        Cart newCart = Cart.builder()
                .cartState("active")
                .user(existingUser)
                .build();
        // create new cart
        Cart cart = repository.save(newCart);

        // save product added to cart
        CartProduct cartProduct = CartProduct.builder()
                .cart(cart)
                .product(product)
                .productVariant(productVariant)
                .productQty(cartDto.getProductQty())
                .build();
        cartProductRepostiory.save(cartProduct);

        return new CartResponse(
                cart.getId(),
                cart.getCartState(),
                List.of(
                        CartProductDto.builder()
                                .productId(cartProduct.getProduct().getId())
                                .productSku(cartProduct.getProductVariant().getSku())
                                .productName(cartProduct.getProduct().getName())
                                .productImage(cartProduct.getProduct().getProductImages().get(0).getSrc())
                                .productSlug(cartProduct.getProduct().getSlug())
                                .productVariantName(cartProduct.getProductVariant().getProductVariantName())
                                .productQty(cartProduct.getProductQty())
                                .productStock(cartProduct.getProductVariant().getStock())
                                .productPrice(cartProduct.getProductVariant().getPrice())
                                .productDiscount(cartProduct.getProduct().getDiscount())
                                .total(cartProduct.getProductQty() * cartProduct.getProductVariant().getPrice())
                                .build()
                ));
    }
}
