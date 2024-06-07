import React, { useContext, useState, useRef, useEffect } from "react";
import { Container, Row, Col, Media } from "reactstrap";
import DetailsWithPrice from "../common/detail-price";
import Slider from "react-slick";
import CartContext from "../../../helpers/cart";
import ImageZoom from "../common/image-zoom";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";

const LeftImagePage = ({ pathId }) => {
  const context = useContext(CartContext);
  const addToCart = context.addToCart;
  const curContext = useContext(CurrencyContext);
  const symbol = curContext.state.symbol;
  const [state, setState] = useState({ nav1: null, nav2: null });
  const slider1 = useRef();
  const slider2 = useRef();
  const data = {
    "product": {
      "id": 1,
      "title": "trim dress",
      "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
      "type": "fashion",
      "brand": "nike",
      "category": "Women",
      "price": "145",
      "new": "true",
      "sale": "true",
      "discount": "40",
      "stock": 5,
      "variants": [
        {
          "id": "1.1",
          "color": "yellow",
          "image_id": 111,
          "variant_id": "101",
          "size": "s"
        },
        {
          "id": "1.2",
          "color": "white",
          "image_id": 112,
          "variant_id": "102",
          "size": "s"
        },
        {
          "id": "1.3",
          "color": "pink",
          "image_id": 113,
          "variant_id": "103",
          "size": "s"
        },
        {
          "id": "1.4",
          "color": "yellow",
          "image_id": 111,
          "variant_id": "104",
          "size": "m"
        },
        {
          "id": "1.5",
          "color": "white",
          "image_id": 112,
          "variant_id": "105",
          "size": "m"
        },
        {
          "id": "1.6",
          "color": "pink",
          "image_id": 113,
          "variant_id": "106",
          "size": "m"
        },
        {
          "id": "1.7",
          "color": "yellow",
          "image_id": 111,
          "variant_id": "107",
          "size": "l"
        }
      ],
      "images": [
        {
          "image_id": 111,
          "src": "/assets/images/pro3/39.jpg"
        },
        {
          "image_id": 112,
          "src": "/assets/images/pro3/6.jpg"
        },
        {
          "image_id": 113,
          "src": "/assets/images/pro3/25.jpg"
        }
      ]
    }
  }
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

  // useEffect(() => {
  //   setState({
  //     nav1: slider1.current,
  //     nav2: slider2.current,
  //   });
  // }, [data]);

  const changeColorVar = (img_id) => {
    slider2.current.slickGoTo(img_id);
  };

  const { nav1, nav2 } = state;

  return (
    <section>
      <div className="collection-wrapper">
        <Container>
          {!data || !data.product || data.product.length === 0 || loading ? (
            "loading"
          ) : (
            <Row className="leftImage">
              <Col lg="1" sm="2" xs="12" className="order-down">
                <Row>
                  <Slider className="slider-nav" {...productsnav} asNavFor={nav1} ref={(slider) => (slider2.current = slider)}>
                    {data.product.variants
                      ? data.product.images.map((vari, index) => (
                          <div key={index}>
                            <Media src={`${vari.src}`} key={index} alt={vari.alt} className="img-fluid" />
                          </div>
                        ))
                      : ""}
                  </Slider>
                </Row>
              </Col>
              <Col lg="5" sm="10" xs="12" className="order-up">
                <Slider {...products} asNavFor={nav2} ref={(slider) => (slider1.current = slider)} className="product-right-slick">
                  {data.product.variants
                    ? data.product.images.map((vari, index) => (
                        <div key={index}>
                          <ImageZoom image={vari} />
                        </div>
                      ))
                    : data.product.images.map((vari, index) => (
                        <div key={index}>
                          <h1>dhdhd</h1>
                          <ImageZoom image={vari} />
                        </div>
                      ))}
                </Slider>
              </Col>
              <Col lg="6" className="rtl-text">
                <DetailsWithPrice symbol={symbol} item={data.product} changeColorVar={changeColorVar} navOne={state.nav1} addToCartClicked={addToCart} />
              </Col>
            </Row>
          )}
        </Container>
      </div>
    </section>
  );
};

export default LeftImagePage;
