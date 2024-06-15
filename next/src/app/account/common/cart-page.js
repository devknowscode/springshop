import React, { useState, useContext } from "react";
import Link from "next/link";
import CartContext from "../../../helpers/cart";
import { Container, Row, Col, Media } from "reactstrap";
import cart from "../../../../public/assets/images/icon-empty-cart.png";
import convertCurrencyFormat from "@/utils/currencyFormat";

const CartPage = () => {
  const context = useContext(CartContext);
  const cartItems = context.state;
  const total = context.cartTotal;
  const removeFromCart = context.removeFromCart;
  const updateQty = context.updateQty;

  const handleQtyUpdate = (item, quantity) => {
    if (quantity >= 1) {
      if (item.stock >= quantity) {
        updateQty(item, quantity);
      } else {
        alert("Số lượng sản phẩm chọn đã đạt mức tối đa")
      }
    } else {
      if (confirm("Bạn có muốn xóa sản phẩm này không?") == true) {
        removeFromCart(item);
      }
    }
  };

  return (
    <div>
      {cartItems && cartItems.length > 0 ? (
        <section className="cart-section section-b-space">
          <Container>
            <Row>
              <Col sm="12">
                <table className="table cart-table table-responsive-xs">
                  <thead>
                    <tr className="table-head">
                      <th scope="col">image</th>
                      <th scope="col">product name</th>
                      <th scope="col">price</th>
                      <th scope="col">quantity</th>
                      <th scope="col">action</th>
                      <th scope="col">total</th>
                    </tr>
                  </thead>
                  {cartItems.map((item, index) => {
                    return (
                      <tbody key={index}>
                        <tr>
                          <td>
                            <Link href={`/product-details/` + item.slug}>
                              <Media
                                src={
                                  item.images
                                    ? process.env.IMAGE_SERVER_URL +
                                      item.images[0].src
                                    : process.env.IMAGE_SERVER_URL +
                                      item.images[0].src
                                }
                                alt=""
                              />
                            </Link>
                          </td>
                          <td>
                            <Link href={`/product-details/` + item.slug}>
                              {item.title}
                            </Link>
                            <div className="mt-20">
                              <span>
                                Phân loại hàng: {item.product_variant_name}
                              </span>
                            </div>
                            <div className="mobile-cart-content row">
                              <div className="col-xs-3">
                                <div className="qty-box">
                                  <div className="input-group">
                                    <input
                                      type="number"
                                      name="quantity"
                                      onChange={(e) =>
                                        handleQtyUpdate(item, e.target.value)
                                      }
                                      className="form-control input-number"
                                      value={item.qty}
                                    />
                                  </div>
                                </div>
                                {item.qty >= item.stock ? "out of Stock" : ""}
                              </div>
                              <div className="col-xs-3">
                                <h2 className="td-color">
                                  {convertCurrencyFormat(
                                    item.price -
                                      (item.price * item.discount) / 100
                                  )}
                                </h2>
                              </div>
                              <div className="col-xs-3">
                                <h2 className="td-color">
                                  <a href="#" className="icon">
                                    <i
                                      className="fa fa-times"
                                      onClick={() => removeFromCart(item)}
                                    ></i>
                                  </a>
                                </h2>
                              </div>
                            </div>
                          </td>
                          <td>
                            <h2>
                              {convertCurrencyFormat(
                                item.price - (item.price * item.discount) / 100
                              )}
                            </h2>
                          </td>
                          <td>
                            <div className="qty-box">
                              <div className="input-group">
                                <input
                                  type="number"
                                  name="quantity"
                                  onChange={(e) =>
                                    handleQtyUpdate(item, e.target.value)
                                  }
                                  className="form-control input-number"
                                  value={
                                    item.qty > item.stock
                                      ? item.stock
                                      : item.qty
                                  }
                                />
                              </div>
                            </div>
                          </td>
                          <td>
                            <i
                              className="fa fa-times"
                              onClick={() => removeFromCart(item)}
                            ></i>
                          </td>
                          <td>
                            <h2 className="td-color">
                              {convertCurrencyFormat(item.total)}
                            </h2>
                          </td>
                        </tr>
                      </tbody>
                    );
                  })}
                </table>
                <table className="table cart-table table-responsive-md">
                  <tfoot>
                    <tr>
                      <td>total price :</td>
                      <td>
                        <h2>{convertCurrencyFormat(total)}</h2>
                      </td>
                    </tr>
                  </tfoot>
                </table>
              </Col>
            </Row>
            <Row className="cart-buttons">
              <Col xs="6">
                <Link href={`/shop/left_sidebar`} className="btn btn-solid">
                  Tiếp tục mua sắm
                </Link>
              </Col>
              <Col xs="6">
                <Link href={`/account/checkout`} className="btn btn-solid">
                  Thanh toán
                </Link>
              </Col>
            </Row>
          </Container>
        </section>
      ) : (
        <section className="cart-section section-b-space">
          <Container>
            <Row>
              <Col sm="12">
                <div>
                  <div className="col-sm-12 empty-cart-cls text-center">
                    <Media
                      src={cart}
                      className="img-fluid mb-4 mx-auto"
                      alt=""
                    />
                    <h3>
                      <strong>Giỏ hàng của bạn đang trống</strong>
                    </h3>
                    <Link href="/">
                      <button className="cto-in-cart">Mua ngay</button>
                    </Link>
                  </div>
                </div>
              </Col>
            </Row>
          </Container>
        </section>
      )}
    </div>
  );
};

export default CartPage;
