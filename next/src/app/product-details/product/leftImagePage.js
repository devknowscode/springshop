import React, { useContext, useState, useRef, useEffect } from "react";
import { Container, Row, Col, Media } from "reactstrap";
import DetailsWithPrice from "../common/detail-price";
import Slider from "react-slick";
import CartContext from "../../../helpers/cart";
import ImageZoom from "../common/image-zoom";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";
import axios from "axios";

const LeftImagePage = ({ slug }) => {
  const context = useContext(CartContext);
  const addToCart = context.addToCart;
  const curContext = useContext(CurrencyContext);
  const symbol = curContext.state.symbol;
  const [state, setState] = useState({ nav1: null, nav2: null });
  const slider1 = useRef();
  const slider2 = useRef();
  const [data, setData] = useState({});

  useEffect(() => {
    axios
    .get(`http://localhost:8088/v1/api/products/${slug}`)
    .then(({ data }) => {
        setData(data.metadata);
      })
      .catch((e) => {
        console.log(e);
      });
  }, []);

  var loading = false;
  var products = {
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: false,
    arrows: true,
    fade: true,
    infinite: false,
  };
  var productsnav = {
    slidesToShow: 3,
    swipeToSlide: true,
    arrows: false,
    dots: false,
    vertical: true,
    focusOnSelect: true,
    infinite: false,
  };

  useEffect(() => {
    setState({
      nav1: slider1.current,
      nav2: slider2.current,
    });
  }, [data]);

  const { nav1, nav2 } = state;

  return (
    <section>
      <div className="collection-wrapper">
        <Container>
          {!data || loading ? (
            "loading"
          ) : (
            <Row className="leftImage">
              <Col lg="1" sm="2" xs="12" className="order-down">
                <Row>
                  <Slider className="slider-nav" {...productsnav} asNavFor={nav1} ref={(slider) => (slider2.current = slider)}>
                    {data.variants
                      ? data.images.map((vari, index) => (
                          <div key={index}>
                            <Media src={`${process.env.IMAGE_SERVER_URL + vari.src}`} key={index} alt={vari.alt} className="img-fluid" />
                          </div>
                        ))
                      : ""}
                  </Slider>
                </Row>
              </Col>
              <Col lg="5" sm="10" xs="12" className="order-up">
                <Slider {...products} asNavFor={nav2} ref={(slider) => (slider1.current = slider)} className="product-right-slick">
                  {data.variants
                    ? data.images.map((vari, index) => (
                        <div key={index}>
                          <ImageZoom image={vari} />
                        </div>
                      ))
                    : data.images?.map((vari, index) => (
                        <div key={index}>
                          <ImageZoom image={vari} />
                        </div>
                      ))}
                </Slider>
              </Col>
              <Col lg="6" className="rtl-text">
                <DetailsWithPrice symbol={symbol} item={data} navOne={state.nav1} addToCartClicked={addToCart} />
              </Col>
            </Row>
          )}
        </Container>
      </div>
    </section>
  );
};

export default LeftImagePage;
