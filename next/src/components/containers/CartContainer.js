import React, { useContext, Fragment } from "react";
import Link from "next/link";
import CartHeader from "../headers/common/cart-header";
import CartContext from "../../helpers/cart";
import { Media } from "reactstrap";
import convertCurrencyFormat from "@/utils/currencyFormat";

const CartContainer = ({ icon }) => {
  const context = useContext(CartContext);
  const cartList = context.state;
  const total = context.cartTotal;

  return (
    <Fragment>
      <li className="onhover-div mobile-cart">
        <div className="cart-qty-cls">{cartList.length}</div>
        <Link href={`/account/cart`}>
          <div href={null}>
            <Media src={icon} className="img-fluid" alt="" />
            <i className="fa fa-shopping-cart"></i>
          </div>
        </Link>
        <ul className="show-div shopping-cart">
          {cartList.map((item, index) => (
            <CartHeader key={index} item={item} total={total} />
          ))}
          {cartList.length > 0 ? (
            <div>
              <li>
                <div className="total">
                  <h5>
                    tổng :{" "}
                    <span>
                      {convertCurrencyFormat(total)}
                    </span>
                  </h5>
                </div>
              </li>
              <li>
                <div className="buttons view-cart">
                  <Link href={`/account/cart`}>
                    Xem giỏ hàng
                  </Link>
                  <Link href={`/account/checkout`} className="checkout">
                    Thanh toán
                  </Link>
                </div>
              </li>
            </div>
          ) : (
            <li>
              <h5>Giỏ hàng của bạn đang trống.</h5>
            </li>
          )}
        </ul>
      </li>
    </Fragment>
  );
};

export default CartContainer;
