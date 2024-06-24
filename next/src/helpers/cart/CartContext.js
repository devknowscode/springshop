import React, { useState, useEffect } from "react";
import Context from "./index";
import { toast } from "react-toastify";
import { useRouter } from "next/navigation";
import cartApiRequest from "@/utils/cartApiRequest";

const getLocalCartItems = () => {
  try {
    const list = localStorage.getItem("cartList");
    if (list === null) {
      const products_in_cart = cartApiRequest.getCart(token);
      if (!products_in_cart) {
        return [];
      }
      return products_in_cart;
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
  const token = localStorage.getItem("userToken");
  const router = useRouter();

  useEffect(() => {
    const initialTotal = 0;
    const total = cartItems.reduce(
      (total, currentItem) => total + currentItem.total,
      initialTotal
    );
    setCartTotal(total);

    localStorage.setItem("cartList", JSON.stringify(cartItems));
  }, [cartItems]);

  // Add Product To Cart
  const addToCart = async (item, variant, quantity) => {
    if (!localStorage.getItem("userToken")) {
      router.push("/account/login");
      return;
    }

    if (!variant) {
      toast.error("Vui lòng chọn loại sản phẩm");
      return;
    }

    const body = {
      product_id: item.id,
      product_sku: variant.sku,
      product_qty: quantity,
    };
    const products_in_cart = await cartApiRequest.addToCart(token, body);
    if (products_in_cart) {
      setCartItems(products_in_cart);
    } else {
      toast.error("Thêm sản phẩm thất bại");
    }
  };

  const removeFromCart = async (item) => {
    console.log(item)
    const cartId = localStorage.getItem("cartId");
    const body = {
      product_id: item.product_id,
      product_sku: item.product_sku,
    };
    const products_in_cart = await cartApiRequest.removeProductInCart(token, cartId, body);
    if (products_in_cart) {
      toast.error("Bỏ sản phẩm thành công");
      setCartItems(products_in_cart);
      return;
    }
    toast.error("Bỏ sản phẩm thất bại");
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
  const updateQty = async (item, quantity) => {
    if (quantity >= 1) {
      console.log({item, quantity})
      const cartId = localStorage.getItem("cartId");
      
      const body = {
        product_id: item.product_id,
        product_sku: item.product_sku,
        product_qty: quantity,
      };
      const products_in_cart = await cartApiRequest.updateProductQtyInCart(token, cartId, body)
      if (products_in_cart) {
        toast.info("Cập nhật giỏ hàng thành công!");
        setCartItems(products_in_cart)
        return;
      }
      toast.error("Cập nhật giỏ hàng không thành công!");
    }
  };

  // Clear Cart
  const clearCart = () => {
    setCartItems([]);
    localStorage.removeItem("cartList");
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
