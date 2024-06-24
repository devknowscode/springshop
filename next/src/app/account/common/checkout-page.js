import { useContext, useState } from "react";
import { Media, Container, Form, Row, Col } from "reactstrap";
import CartContext from "../../../helpers/cart";
import paypal from "/public/assets/images/paypal.png";
// import { PayPalButton } from "react-paypal-button-v2";
import {
  PayPalScriptProvider, PayPalButtons
} from "@paypal/react-paypal-js";
import { useForm } from "react-hook-form";
import { useRouter } from "next/navigation";
import convertCurrencyFormat from "@/utils/currencyFormat";
import orderApiRequest from "@/utils/orderApiRequest";

const CheckoutPage = () => {
  const cartContext = useContext(CartContext);
  const cartItems = cartContext.state;
  const cartTotal = cartContext.cartTotal;
  const clearCart = cartContext.clearCart;
  const [obj, setObj] = useState({});
  const [payment, setPayment] = useState("cod");
  const token = localStorage.getItem("userToken");

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm(); // initialise the hook
  const router = useRouter();

  const checkhandle = (value) => {
    setPayment(value);
  };

  const onSubmit = async (data) => {
    if (data !== "") {
      clearCart();
      const body = {
        ...data,
        ...obj,
        order_items: cartItems.map(({product_id, product_sku, product_qty, total}) => (
          {
            product_id,
            product_sku,
            product_qty,
            product_total: total
          }
        )),
        payment_method: payment,
      };

      const response = await orderApiRequest.createOrder(token, body);
      if (!response) {
        return;
      }
      router.push("/order-success");
    } else {
      errors.showMessages();
    }
  };

  const setStateFromInput = (event) => {
    obj[event.target.name] = event.target.value;
    setObj(obj);
  };

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
                      <input
                        type="text"
                        className={`${
                          errors.customerName ? "error_border" : ""
                        }`}
                        name="customer_name"
                        {...register("customer_name", { required: true })}
                      />
                      <span className="error-message">
                        {errors.customerName &&
                          "Vui lòng nhập tên người mua hàng"}
                      </span>
                    </div>
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Điện thoại</div>
                      <input
                        type="text"
                        name="phone"
                        className={`${errors.phone ? "error_border" : ""}`}
                        {...register("phone", {
                          required: true,
                          pattern: /\d+/,
                        })}
                      />
                      <span className="error-message">
                        {errors.phone && "Vui lòng nhập số điện thoại"}
                      </span>
                    </div>
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Địa chỉ</div>
                      <input
                        //className="form-control"
                        className={`${errors.address ? "error_border" : ""}`}
                        type="text"
                        name="address"
                        {...register("address", {
                          required: true,
                          min: 20,
                          max: 120,
                        })}
                      />
                      <span className="error-message">
                        {errors.address && "Vui lòng nhập đúng địa chỉ"}
                      </span>
                    </div>
                    {/* <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Mã ưu đãi</div>
                      <input
                        type="text"
                        className={`${errors.city ? "error_border" : ""}`}
                        name="city"
                        onChange={setStateFromInput}
                      />
                      <span className="error-message">{errors.city && "select one city"}</span>
                    </div> */}
                    <div className="form-group col-md-12 col-sm-12 col-xs-12">
                      <div className="field-label">Ghi chú</div>
                      <textarea
                        type="text"
                        className="note-area"
                        name="note"
                        rows="4"
                        cols="50"
                        onChange={setStateFromInput}
                      />
                    </div>
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
                              {item.product_name} × {item.product_qty}{" "}
                              <span>{convertCurrencyFormat(item.total)}</span>
                            </li>
                          ))}
                        </ul>
                        <ul className="sub-total">
                          <li>
                            Tổng giá trị{" "}
                            <span className="count">
                              {convertCurrencyFormat(cartTotal)}
                            </span>
                          </li>
                          <li>
                            Phí ship
                            <div className="shipping">
                              <div className="shopping-option">
                                <input
                                  type="checkbox"
                                  name="free-shipping"
                                  id="free-shipping"
                                />
                                <label htmlFor="free-shipping">
                                  Miễn phí giao hàng
                                </label>
                              </div>
                            </div>
                          </li>
                        </ul>
                        <ul className="total">
                          <li>
                            Tổng đơn hàng{" "}
                            <span className="count">
                              {convertCurrencyFormat(cartTotal)}
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
                                  <input
                                    type="radio"
                                    name="payment-group"
                                    id="payment-2"
                                    defaultChecked={true}
                                    onClick={() => checkhandle("cod")}
                                  />
                                  <label htmlFor="payment-2">COD</label>
                                </div>
                              </li>
                              <li>
                                <div className="radio-option paypal">
                                  <input
                                    type="radio"
                                    name="payment-group"
                                    id="payment-1"
                                    onClick={() => checkhandle("paypal")}
                                  />
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
                              <PayPalScriptProvider
                                options={{ clientId: "test" }}
                              >
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
                                    return actions.order
                                      .capture()
                                      .then((details) => {
                                        const name =
                                          details.payer.name.given_name;
                                        alert(
                                          `Transaction completed by ${name}`
                                        );
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
