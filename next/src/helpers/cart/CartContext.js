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
  const [stock, setStock] = useState("");

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

    if (!variant) {
      toast.error("Vui lòng chọn loại sản phẩm")
      return
    }

    toast.success("Thêm giỏ hàng thành công");
    const index = cartItems.findIndex(
      (itm) => itm.id === item.id && itm.sku === variant.sku
    );

    if (index !== -1) {
      cartItems[index] = {
        ...item,
        ...variant,
        qty: quantity,
        total: (item.price - (item.price * item.discount) / 100) * quantity,
      };
      setCartItems([...cartItems]);
    } else {
      const product = {
        ...item,
        ...variant,
        qty: quantity,
        total: (variant.price - (variant.price * item.discount) / 100) * quantity,
      };
      setCartItems([...cartItems, product]);
    }
  };

  const removeFromCart = (item) => {
    toast.error("Bỏ sản phẩm thành công");
    setCartItems(cartItems.filter((itm) => itm.sku !== item.sku));
  };

  const minusQty = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
      setStock("");
    }
  };

  const plusQty = (item) => {
    if (quantity < item.stock) {
      setQuantity(quantity + 1);
    } else {
      setStock("Số lượng sản phẩm chọn đã đạt mức tối đa");
    }
  };

  // Update Product Quantity
  const updateQty = (item, quantity) => {
    if (quantity >= 1) {
      const index = cartItems.findIndex((itm) => itm.id === item.id && itm.sku === item.sku);
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
