import React, { useState, useEffect } from "react";
import Context from "./index";
import { toast } from "react-toastify";
import { useRouter } from "next/navigation";

const getLocalCartItems = () => {
  try {
    const list = localStorage.getItem("cartList");
    if (list === null) {
      return [];
    } else {
      return JSON.parse(list);
    }
  } catch (err) {
    return [];
  }
};

const CartProvider = (props) => {
  const [cartItems, setCartItems] = useState(getLocalCartItems());
  const [cartTotal, setCartTotal] = useState(0);
  const [quantity, setQuantity] = useState(1);
  const [stock, setStock] = useState("In Stock");

  useEffect(() => {
    const initialTotal = 0;
    const total = cartItems.reduce(
      (total, currentItem) => total + currentItem.total,
      initialTotal
    );
    setCartTotal(total);

    localStorage.setItem("cartList", JSON.stringify(cartItems));
  }, [cartItems]);

  const router = useRouter()

  // Add Product To Cart
  const addToCart = (item, variant, quantity) => {
    if (!localStorage.getItem("userToken")) {
      router.push("/account/login")
      return;
    }
    toast.success("Product Added Successfully !");
    const index = cartItems.findIndex(
      (itm) => itm.id === item.id && itm.variants.sku === item.variants.sku
    );

    if (index !== -1) {
      cartItems[index] = {
        ...item,
        qty: quantity,
        total: (item.price - (item.price * item.discount) / 100) * quantity,
      };
      setCartItems([...cartItems]);
    } else {
      const product = {
        ...item,
        qty: quantity,
        total: item.price - (item.price * item.discount) / 100,
      };
      setCartItems([...cartItems, product]);
    }
  };

  const removeFromCart = (item) => {
    toast.error("Product Removed Successfully !");
    setCartItems(cartItems.filter((e) => e.id !== item.id));
  };

  const minusQty = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
      setStock("InStock");
    }
  };

  const plusQty = (item) => {
    if (quantity < item.stock) {
      setQuantity(quantity + 1);
    } else {
      setStock("Out of Stock !");
    }
  };

  // Update Product Quantity
  const updateQty = (item, quantity) => {
    if (quantity >= 1) {
      const index = cartItems.findIndex((itm) => itm.id === item.id);
      if (index !== -1) {
        cartItems[index] = {
          ...item,
          qty: quantity,
          total: item.price * quantity,
        };
        setCartItems([...cartItems]);
        toast.info("Product Quantity Updated !");
      } else {
        const product = {
          ...item,
          qty: quantity,
          total: (item.price - (item.price * item.discount) / 100) * quantity,
        };
        setCartItems([...cartItems, product]);
        toast.success("Product Added Updated !");
      }
    } else {
      toast.error("Enter Valid Quantity !");
    }
  };

  // Clear Cart
  const clearCart = () => {
    setCartItems([]);
    localStorage.removeItem("cartList");
    //toast.error("Cart Cleared Successfully !");
  };

  return (
    <Context.Provider
      value={{
        ...props,
        state: cartItems,
        cartTotal,
        setQuantity,
        quantity,
        stock,
        addToCart: addToCart,
        removeFromCart: removeFromCart,
        plusQty: plusQty,
        minusQty: minusQty,
        updateQty: updateQty,
        clearCart: clearCart,
      }}
    >
      {props.children}
    </Context.Provider>
  );
};

export default CartProvider;
