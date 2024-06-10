
import React, { useContext, useState } from "react";
import { Media, Container, Form, Row, Col } from "reactstrap";
import CartContext from "../../../helpers/cart";
import paypal from "/public/assets/images/paypal.png";
// import { PayPalButton } from "react-paypal-button-v2";
import { PayPalScriptProvider, BraintreePayPalButtons, PayPalButtons } from "@paypal/react-paypal-js";
import { useForm } from "react-hook-form";
import { useRouter } from "next/navigation";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";

const CheckoutPage = () => {
  const cartContext = useContext(CartContext);
  const cartItems = cartContext.state;
  const cartTotal = cartContext.cartTotal;
  const curContext = useContext(CurrencyContext);
  const clearCart = cartContext.clearCart;
  const symbol = curContext.state.symbol;
  const [obj, setObj] = useState({});
  const [payment, setPayment] = useState("cod");
  
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm(); // initialise the hook
  const router = useRouter();

  const checkhandle = (value) => {
    setPayment(value);
  };

  const onSubmit = (data) => {
    if (data !== "") {
      alert("Chức mừng bạn đặt hàng thành công!");
      // router.push({
      //   pathname: "/page/order-success",
      //   state: { items: cartItems, orderTotal: cartTotal, symbol: symbol },
      // });
      clearCart();
      router.push("/");
      
    } else {
      errors.showMessages();
    }
  };

  const setStateFromInput = (event) => {
    obj[event.target.name] = event.target.value;
    setObj(obj);
  };

  console.log("cartItems", cartItems);
  return (
    <section className="section-b-space">
      <Container>
        <div className="checkout-page">
          <div className="checkout-form">
            <Form onSubmit={handleSubmit(onSubmit)}>
              <Row>
                <Col lg="6" sm="12" xs="12">
                  <div className="checkout-title">
                    <h3>Chi tiết thanh toán</h3>
                  </div>
                  <div className="row check-out">
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Họ Và Tên</div>
                      <input type="text" className={`${errors.fullname ? "error_border" : ""}`} name="first_name" {...register("fullname", { required: true })} />
                      <span className="error-message">{errors.fullname && "First name is required"}</span>
                    </div>
                    {/* <div className="form-group col-md-6 col-sm-6 col-xs-12">
                      <div className="field-label">Last Name</div>
                      <input type="text" className={`${errors.last_name ? "error_border" : ""}`} name="last_name" {...register("last_name", { required: true })} />
                      <span className="error-message">{errors.last_name && "Last name is required"}</span>
                    </div> */}
                    <div className="form-group col-md-6 col-sm-6 col-xs-12">
                      <div className="field-label">Điện thoại</div>
                      <input type="text" name="phone" className={`${errors.phone ? "error_border" : ""}`} {...register("phone", { pattern: /\d+/ })} />
                      <span className="error-message">{errors.phone && "Please enter number for phone."}</span>
                    </div>
                    <div className="form-group col-md-6 col-sm-6 col-xs-12">
                      <div className="field-label">Địa chỉ Email</div>
                      <input
                        //className="form-control"
                        className={`${errors.email ? "error_border" : ""}`}
                        type="text"
                        name="email"
                        {...register("email", {
                          required: true,
                          pattern: /^\S+@\S+$/i,
                        })}
                      />
                      <span className="error-message">{errors.email && "Please enter proper email address ."}</span>
                    </div>
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Thành phố</div>
                      <select name="country" {...register("country", { required: true })}>
                        <option>Thành phố Hồ Chí Minh</option>
                        <option>Thành phố Hà Nội</option>
                        <option>Bình Dương</option>
                        <option>Hải Phòng</option>
                        <option>Cần Thơ</option>
                        <option>Đà Nẵng</option>
                      </select>
                    </div>
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Địa chỉ</div>
                      <input
                        //className="form-control"
                        className={`${errors.address ? "error_border" : ""}`}
                        type="text"
                        name="address"
                        {...register("address", { required: true, min: 20, max: 120 })}
                        placeholder="Street address"
                      />
                      <span className="error-message">{errors.address && "Please right your address ."}</span>
                    </div>
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Mã ưu đãi</div>
                      <input
                        //className="form-control"
                        type="text"
                        className={`${errors.city ? "error_border" : ""}`}
                        name="city"
                        // ss
                        onChange={setStateFromInput}
                      />
                      <span className="error-message">{errors.city && "select one city"}</span>
                    </div>
                   
                    {/* <div className="form-group col-md-12 col-sm-6 col-xs-12">
                      <div className="field-label">Mã ưu đãi</div>
                      <input
                        //className="form-control"
                        type="text"
                        name="pincode"
                        className={`${errors.pincode ? "error_border" : ""}`}
                        {...register("pincode", { pattern: /\d+/ })}
                      />
                      <span className="error-message">{errors.pincode && "Required integer"}</span>
                    </div> */}
                    {/* <div className="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                      <input type="checkbox" name="create_account" id="account-option" />
                      &ensp; <label htmlFor="account-option">Create An Account?</label>
                    </div> */}
                  </div>
                </Col>
                <Col lg="6" sm="12" xs="12">
                  {cartItems && cartItems.length > 0 > 0 ? (
                    <div className="checkout-details">
                      <div className="order-box">
                        <div className="title-box">
                          <div>
                            Sản phẩm <span>Giá trị</span>
                          </div>
                        </div>
                        <ul className="qty">
                          {cartItems.map((item, index) => (
                            <li key={index}>
                              {item.title} × {item.qty}{" "}
                              <span>
                                {symbol}
                                {item.total}
                              </span>
                            </li>
                          ))}
                        </ul>
                        <ul className="sub-total">
                          <li>
                            Tổng giá trị{" "}
                            <span className="count">
                              {symbol}
                              {cartTotal}
                            </span>
                          </li>
                          <li>
                            Phí ship
                            <div className="shipping">
                              <div className="shopping-option">
                                <input type="checkbox" name="free-shipping" id="free-shipping" />
                                <label htmlFor="free-shipping">Miễn phí giao hàng</label>
                              </div>
                              {/* <div className="shopping-option">
                                <input type="checkbox" name="local-pickup" id="local-pickup" />
                                <label htmlFor="local-pickup">Chọn địa chỉ giao hàng</label>
                              </div> */}
                            </div>
                          </li>
                        </ul>
                        <ul className="total">
                          <li>
                           Tổng đơn hàng{" "}
                            <span className="count">
                              {symbol}
                              {cartTotal}
                            </span>
                          </li>
                        </ul>
                      </div>
                      <div className="payment-box">
                        <div className="upper-box">
                          <div className="payment-options">
                            <ul>
                              <li>
                                <div className="radio-option stripe">
                                  <input type="radio" name="payment-group" id="payment-2" defaultChecked={true} onClick={() => checkhandle("cod")} />
                                  <label htmlFor="payment-2">COD</label>
                                </div>
                              </li>
                              <li>
                                <div className="radio-option paypal">
                                  <input type="radio" name="payment-group" id="payment-1" onClick={() => checkhandle("paypal")} />
                                  <label htmlFor="payment-1">
                                    PayPal
                                    <span className="image">
                                      <Media src={paypal.src} alt="" />
                                    </span>
                                  </label>
                                </div>
                              </li>
                            </ul>
                          </div>
                        </div>
                        {cartTotal !== 0 ? (
                          <div className="text-end">
                            {payment === "cod" ? (
                              <button type="submit" className="btn-solid btn">
                                Đặt hàng
                              </button>
                            ) : (
                              <PayPalScriptProvider options={{ clientId: "test" }}>
                                <PayPalButtons
                                  createOrder={(data, actions) => {
                                    return actions.order.create({
                                      purchase_units: [
                                        {
                                          amount: {
                                            value: "1.99",
                                          },
                                        },
                                      ],
                                    });
                                  }}
                                  onApprove={(data, actions) => {
                                    return actions.order.capture().then((details) => {
                                      const name = details.payer.name.given_name;
                                      alert(`Transaction completed by ${name}`);
                                    });
                                  }}
                                />
                              </PayPalScriptProvider>
                            )}
                          </div>
                        ) : (
                          ""
                        )}
                      </div>
                    </div>
                  ) : (
                    ""
                  )}
                </Col>
              </Row>
            </Form>
          </div>
        </div>
      </Container>
    </section>
  );
};

export default CheckoutPage;
