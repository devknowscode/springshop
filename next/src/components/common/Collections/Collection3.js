import React, { useContext, useEffect, useState } from "react";
import Slider from "react-slick";
import ProductItems from "../product-box/ProductBox1";
import { Row, Col, Container, Media } from "reactstrap";
import CartContext from "../../../helpers/cart";
import { WishlistContext } from "../../../helpers/wishlist/WishlistContext";
import PostLoader from "../PostLoader";
import axios from "axios";

const TopCollection = ({ type, title, subtitle, designClass, noSlider, cartClass, productSlider, titleClass, noTitle, innerClass, inner, backImage }) => {
  const context = useContext(CartContext);
  const contextWishlist = useContext(WishlistContext);
  const quantity = context.quantity;
  const [delayProduct, setDelayProduct] = useState(true);
  const [loading, setLoading] = useState(false) 
  const [data, setData] = useState({});
  useEffect(() => {
    setLoading(true)
    axios
    .get(`http://localhost:8088/v1/api/products?page=3&limit=8`)
    .then(({ data }) => {
      setLoading(false)
        setData(data.metadata);
      })
      .catch((e) => {
        console.log(e);
      });
  }, []);

  useEffect(() => {
    if (data === undefined) {
      noSlider === false;
    } else {
      noSlider === true;
    }
    setTimeout(() => {
      setDelayProduct(false);
    }, 1);
  }, [delayProduct]);

  return (
    <>
      <section className={designClass}>
        {noSlider ? (
          <Container>
            <Row>
              <Col>
                {noTitle === "null" ? (
                  ""
                ) : (
                  <div className={innerClass}>
                    {subtitle ? <h4>{subtitle}</h4> : ""}
                    <h2 className={inner}>{title}</h2>
                    {titleClass ? (
                      <hr role="tournament6" />
                    ) : (
                      <div className="line">
                        <span></span>
                      </div>
                    )}
                  </div>
                )}

                {delayProduct ? (
                  <div className="row mx-0 margin-default">
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                  </div>
                ) : (
                  <Slider {...productSlider} className="product-m no-arrow">
                    {data &&
                      data.products?.map((product, i) => (
                        <div key={i}>
                          <ProductItems product={product} title={title} addWishlist={() => contextWishlist.addToWish(product)} addCart={() => context.addToCart(product, quantity)} cartClass={cartClass} backImage={backImage} />
                        </div>
                      ))}
                  </Slider>
                )}
              </Col>
            </Row>
          </Container>
        ) : (
          <>
            {title ? (
              <div className="title1 title-gradient  section-t-space">
                <h4>{subtitle}</h4>
                <h2 className="title-inner1">{title}</h2>
                <hr role="tournament6" />
              </div>
            ) : (
              ""
            )}
            <Container>
              <Row className="margin-default">
                {!data || !data.products || !data.products.length === 0 || loading ? (
                  <div className="row margin-default">
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                    <div className="col-xl-3 col-lg-4 col-6">
                      <PostLoader />
                    </div>
                  </div>
                ) : (
                  data &&
                  data.products.slice(0, 8).map((product, index) => (
                    <Col xl="3" sm="6" key={index}>
                      <div>
                        <ProductItems product={product} backImage={backImage} addWishlist={() => contextWishlist.addToWish(product)} title={title} cartClass={cartClass} addCart={() => context.addToCart(product, quantity)} key={index} />
                      </div>
                    </Col>
                  ))
                )}
              </Row>
            </Container>
          </>
        )}
      </section>
    </>
  );
};

export default TopCollection;
