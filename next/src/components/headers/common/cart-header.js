import React, { Fragment, useContext } from "react";
import Link from "next/link";
import CartContext from "../../../helpers/cart";
import { Media } from "reactstrap";
import convertCurrencyFormat from "@/utils/currencyFormat";

const CartHeader = ({ item }) => {
  const context = useContext(CartContext);
  return (
    <Fragment>
      <li>
        <div className="media">
          <Link href={"/product-details/" + item.product_slug}>
            <Media alt="" className="me-3" src={`${process.env.IMAGE_SERVER_URL + item.product_image}`} />
          </Link>
          <div className="media-body">
            <Link href={"/product-details/" + item.product_slug}>
              <h6>{item.product_name}</h6>
            </Link>

            <h4>
              <span>
                {item.product_qty} x {''}
                {convertCurrencyFormat(item.product_price - (item.product_price * item.product_discount) / 100)}
              </span>
            </h4>
          </div>
        </div>
        <div className="close-circle">
          <i
            className="fa fa-times"
            aria-hidden="true"
            onClick={() => context.removeFromCart(item)}></i>
        </div>
      </li>
    </Fragment>
  );
};

export default CartHeader;
