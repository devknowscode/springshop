import axios from "axios";
import { toast } from "react-toastify";

const cartApiRequest = {
  addToCart: async (token, body) => {
    try {
      const { data } = await axios.post(
        "http://localhost:8088/v1/api/carts",
        body,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      toast.success("Thêm giỏ hàng thành công");
      localStorage.setItem("cartId", data.metadata.id);
      return data.metadata.products_in_cart;
    } catch (err) {
      console.log(err);
      return null;
    }
  },
  getCart: async (token) => {
    try {
      const { data } = await axios.get("http://localhost:8088/v1/api/carts", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });
      if (data.status !== 200) {
        console.log(data);
        return;
      }
      localStorage.setItem("cartId", data.metadata.id);
      return data.metadata;
    } catch (err) {
      console.log(err);
      return null;
    }
  },
  updateProductQtyInCart: async (token, cartId, body) => {
    try {
      const { data } = await axios.put(
        `http://localhost:8088/v1/api/carts/${cartId}`,
        body,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );
      localStorage.setItem("cartId", data.metadata.id);
      return data.metadata.products_in_cart;
    } catch (err) {
      console.log(err);
    }
  },
  removeProductInCart: async (token, cartId, body) => {
    try {
      const { data } = await axios.delete(
        `http://localhost:8088/v1/api/carts/${cartId}`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
          data: body
        },
      );
      localStorage.setItem("cartId", data.metadata.id);
      return data.metadata.products_in_cart;
    } catch (err) {
      console.log(err);
    }
  },
};

export default cartApiRequest;
