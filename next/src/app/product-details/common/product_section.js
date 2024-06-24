import React, { useContext, useState } from "react";
import { Container, Row, Col, Media, Modal, ModalBody } from "reactstrap";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";
import CartContext from "../../../helpers/cart";
import { WishlistContext } from "../../../helpers/wishlist/WishlistContext";
import { useRouter } from "next/navigation";

const ProductSection = () => {
  const router = useRouter();
  const curContext = useContext(CurrencyContext);
  const wishlistContext = useContext(WishlistContext);
  const symbol = curContext.state.symbol;
  const currency = curContext.state;
  const cartCtx = useContext(CartContext);
  const addToCart = cartCtx.addToCart;
  const quantity = cartCtx.quantity;
  const plusQty = cartCtx.plusQty;
  const minusQty = cartCtx.minusQty;
  const setQuantity = cartCtx.setQuantity;
  const [selectedProduct, setSelectedProduct] = useState();
  const [modal, setModal] = useState(false);
  const toggle = () => setModal(!modal);
  const uniqueTags = [];

  const changeQty = (e) => {
    setQuantity(parseInt(e.target.value));
  };

  const clickProductDetail = (product) => {
    const titleProps = product.title.split(" ").join("");
    router.push(`/product-details/${product.id}` + "-" + `${titleProps}`, undefined, { shallow: true });
  };

  const getSelectedProduct = (item) => {
    setSelectedProduct(item);
    toggle();
  };

  const data = {
    "products": {
      "items": [
        {
          "id": 1,
          "title": "trim dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "nike",
          "category": "Women",
          "price": "145",
          "new": "true",
          "stock": 5,
          "sale": "true",
          "discount": "40",
          "variants": [
            {
              "id": "1.1",
              "sku": "sku1",
              "size": "s",
              "color": "yellow",
              "image_id": 111
            },
            {
              "id": "1.2",
              "sku": "sku2",
              "size": "s",
              "color": "white",
              "image_id": 112
            },
            {
              "id": "1.3",
              "sku": "sku3",
              "size": "s",
              "color": "pink",
              "image_id": 113
            },
            {
              "id": "1.4",
              "sku": "sku4",
              "size": "m",
              "color": "yellow",
              "image_id": 111
            },
            {
              "id": "1.5",
              "sku": "sku5",
              "size": "m",
              "color": "white",
              "image_id": 112
            },
            {
              "id": "1.6",
              "sku": "sku5",
              "size": "m",
              "color": "pink",
              "image_id": 113
            },
            {
              "id": "1.7",
              "sku": "sku1",
              "size": "l",
              "color": "yellow",
              "image_id": 111
            }
          ],
          "images": [
            {
              "image_id": 111,
              "id": "1.1",
              "alt": "yellow",
              "src": "/assets/images/pro3/39.jpg"
            },
            {
              "image_id": 112,
              "id": "1.2",
              "alt": "white",
              "src": "/assets/images/pro3/6.jpg"
            },
            {
              "image_id": 113,
              "id": "1.3",
              "alt": "pink",
              "src": "/assets/images/pro3/25.jpg"
            }
          ]
        },
        {
          "id": 2,
          "title": "belted dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "zara",
          "category": "Women",
          "price": "185",
          "new": "false",
          "stock": 2,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "2.1",
              "sku": "sku1",
              "size": "s",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.2",
              "sku": "sku2",
              "size": "s",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.3",
              "sku": "sku3",
              "size": "s",
              "color": "red",
              "image_id": 213
            },
            {
              "id": "2.4",
              "sku": "sku4",
              "size": "m",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.5",
              "sku": "sku4",
              "size": "m",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.6",
              "sku": "sku4",
              "size": "m",
              "color": "red",
              "image_id": 213
            },
            {
              "id": "2.7",
              "sku": "sku4",
              "size": "l",
              "color": "olive",
              "image_id": 211
            },
            {
              "id": "2.8",
              "sku": "sku4",
              "size": "l",
              "color": "navy",
              "image_id": 212
            },
            {
              "id": "2.9",
              "sku": "sku4",
              "size": "l",
              "color": "red",
              "image_id": 213
            }
          ],
          "images": [
            {
              "image_id": 211,
              "id": "2.1",
              "alt": "olive",
              "src": "/assets/images/pro3/3.jpg"
            },
            {
              "image_id": 212,
              "id": "2.2",
              "alt": "navy",
              "src": "/assets/images/pro3/4.jpg"
            },
            {
              "image_id": 213,
              "id": "2.3",
              "alt": "pink",
              "src": "/assets/images/pro3/5.jpg"
            },
            {
              "image_id": 214,
              "id": "2.4",
              "alt": "pink",
              "src": "/assets/images/pro3/15.jpg"
            }
          ]
        },
        {
          "id": 3,
          "title": "fitted dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "denim",
          "category": "Women",
          "price": "174",
          "new": "false",
          "stock": 0,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "3.1",
              "sku": "sku3",
              "size": "l",
              "color": "white",
              "image_id": 311
            },
            {
              "id": "3.2",
              "sku": "skul3",
              "size": "m",
              "color": "white",
              "image_id": 311
            },
            {
              "id": "3.3",
              "sku": "sku3l",
              "size": "l",
              "color": "black",
              "image_id": 312
            },
            {
              "id": "3.4",
              "sku": "sku4m",
              "size": "m",
              "color": "black",
              "image_id": 312
            }
          ],
          "images": [
            {
              "image_id": 311,
              "id": "3.1",
              "alt": "white",
              "src": "/assets/images/pro3/1.jpg"
            },
            {
              "image_id": 312,
              "id": "3.2",
              "alt": "white",
              "src": "/assets/images/pro3/2.jpg"
            }
          ]
        },
        {
          "id": 4,
          "title": "belted top",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "madame",
          "category": "Women",
          "price": "98",
          "new": "true",
          "stock": 10,
          "sale": "false",
          "discount": "50",
          "variants": [
            {
              "id": "4.1",
              "sku": "sku4",
              "size": "s",
              "color": "white",
              "image_id": 411
            },
            {
              "id": "4.2",
              "sku": "skul4",
              "size": "l",
              "color": "white",
              "image_id": 411
            },
            {
              "id": "4.3",
              "sku": "sku4s",
              "size": "s",
              "color": "skyblue",
              "image_id": 412
            },
            {
              "id": "4.4",
              "sku": "sku4l",
              "size": "l",
              "color": "skyblue",
              "image_id": 412
            }
          ],
          "images": [
            {
              "image_id": 411,
              "id": "4.1",
              "alt": "white",
              "src": "/assets/images/pro3/8.jpg"
            },
            {
              "image_id": 412,
              "id": "4.2",
              "alt": "skyblue",
              "src": "/assets/images/pro3/7.jpg"
            }
          ]
        },
        {
          "id": 5,
          "title": "waist dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "biba",
          "category": "Women",
          "price": "230",
          "new": "true",
          "stock": 4,
          "sale": "true",
          "discount": "20",
          "variants": [
            {
              "id": "5.1",
              "sku": "sku5",
              "size": "m",
              "color": "green",
              "image_id": 511
            },
            {
              "id": "5.2",
              "sku": "skul5",
              "size": "l",
              "color": "green",
              "image_id": 511
            },
            {
              "id": "5.3",
              "sku": "sku5s",
              "size": "m",
              "color": "black",
              "image_id": 512
            },
            {
              "id": "5.4",
              "sku": "sku5l",
              "size": "l",
              "color": "black",
              "image_id": 512
            }
          ],
          "images": [
            {
              "image_id": 511,
              "id": "5.1",
              "alt": "green",
              "src": "/assets/images/pro3/9.jpg"
            },
            {
              "image_id": 512,
              "id": "5.2",
              "alt": "black",
              "src": "/assets/images/pro3/10.jpg"
            }
          ]
        },
        {
          "id": 6,
          "title": "crop top",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "max",
          "category": "Women",
          "price": "121",
          "new": "true",
          "stock": 30,
          "sale": "false",
          "discount": "40",
          "variants": [
            {
              "id": "6.1",
              "sku": "sku6",
              "size": "s",
              "color": "olive",
              "image_id": 611
            },
            {
              "id": "6.2",
              "sku": "skul6",
              "size": "s",
              "color": "gray",
              "image_id": 612
            },
            {
              "id": "6.3",
              "sku": "sku6s",
              "size": "s",
              "color": "red",
              "image_id": 613
            },
            {
              "id": "6.4",
              "sku": "sku6l",
              "size": "m",
              "color": "olive",
              "image_id": 611
            },
            {
              "id": "6.5",
              "sku": "sku6l",
              "size": "m",
              "color": "gray",
              "image_id": 612
            },
            {
              "id": "6.6",
              "sku": "sku6l",
              "size": "m",
              "color": "red",
              "image_id": 613
            }
          ],
          "images": [
            {
              "image_id": 611,
              "id": "6.1",
              "alt": "olive",
              "src": "/assets/images/pro3/11.jpg"
            },
            {
              "image_id": 612,
              "id": "6.2",
              "alt": "gray",
              "src": "/assets/images/pro3/12.jpg"
            },
            {
              "image_id": 613,
              "id": "6.3",
              "alt": "red",
              "src": "/assets/images/pro3/22.jpg"
            }
          ]
        },
        {
          "id": 7,
          "title": "sleeveless dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "biba",
          "category": "Women",
          "price": "290",
          "new": "true",
          "stock": 15,
          "sale": "true",
          "discount": "10",
          "variants": [
            {
              "id": "7.1",
              "sku": "sku7",
              "size": "s",
              "color": "pink",
              "image_id": 711
            },
            {
              "id": "7.2",
              "sku": "skul7",
              "size": "s",
              "color": "white",
              "image_id": 712
            },
            {
              "id": "7.3",
              "sku": "sku7s",
              "size": "s",
              "color": "black",
              "image_id": 713
            },
            {
              "id": "7.4",
              "sku": "sku7l",
              "size": "m",
              "color": "pink",
              "image_id": 711
            },
            {
              "id": "7.5",
              "sku": "sku7l",
              "size": "m",
              "color": "white",
              "image_id": 712
            },
            {
              "id": "7.6",
              "sku": "sku7l",
              "size": "m",
              "color": "black",
              "image_id": 713
            }
          ],
          "images": [
            {
              "image_id": 711,
              "id": "7.1",
              "alt": "pink",
              "src": "/assets/images/pro3/13.jpg"
            },
            {
              "image_id": 712,
              "id": "7.2",
              "alt": "white",
              "src": "/assets/images/pro3/8.jpg"
            },
            {
              "image_id": 713,
              "id": "7.3",
              "alt": "black",
              "src": "/assets/images/pro3/15.jpg"
            }
          ]
        },
        {
          "id": 8,
          "title": "v-neck dress",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
          "type": "fashion",
          "brand": "zara",
          "category": "Women",
          "price": "315",
          "new": "false",
          "stock": 15,
          "sale": "true",
          "discount": "70",
          "variants": [
            {
              "id": "8.1",
              "sku": "sku8",
              "size": "s",
              "color": "yellow",
              "image_id": 811
            },
            {
              "id": "8.2",
              "sku": "skul8",
              "size": "s",
              "color": "black",
              "image_id": 812
            },
            {
              "id": "8.3",
              "sku": "sku8s",
              "size": "m",
              "color": "yellow",
              "image_id": 811
            },
            {
              "id": "8.4",
              "sku": "sku8l",
              "size": "m",
              "color": "black",
              "image_id": 812
            }
          ],
          "images": [
            {
              "image_id": 811,
              "id": "8.1",
              "alt": "yellow",
              "src": "/assets/images/pro3/14.jpg"
            },
            {
              "image_id": 812,
              "id": "8.2",
              "alt": "black",
              "src": "/assets/images/pro3/16.jpg"
            }
          ]
        }
      ]
    }
  }

  var loading = false;

  return (
    <section className="section-b-space ratio_asos">
      <Container>
        <Row>
          <Col className="product-related">
            <h2>related products</h2>
          </Col>
        </Row>
        <Row className="search-product">
          {!data ||
            !data.products ||
            data.products.items.length === 0 ||
            loading ? (
            "loading"
          ) : (
            <>
              {data &&
                data.products.items.slice(0, 6).map((product, index) => (
                  <Col xl="2" md="4" sm="6" key={index}>
                    <div className="product-box">
                      <div className="img-wrapper">
                        <div className="front">
                          <a href={null}>
                            <Media
                              onClick={() => clickProductDetail(product)}
                              src={product.images[0].src}
                              className="img-fluid blur-up lazyload bg-img"
                              alt=""
                            />
                          </a>
                        </div>
                        <div className="back">
                          <a href={null}>
                            <Media
                              src={product.images[1].src}
                              className="img-fluid blur-up lazyload bg-img"
                              alt=""
                            />
                          </a>
                        </div>
                        <div className="cart-info cart-wrap">
                          <button
                            data-toggle="modal"
                            data-target="#addtocart"
                            title="Add to cart"
                            onClick={() => addToCart(product, quantity)}
                          >
                            <i className="fa fa-shopping-cart"></i>
                          </button>
                          <a
                            href="#"
                            onClick={() => wishlistContext.addToWish(product)}
                            title="Add to Wishlist"
                          >
                            <i className="fa fa-heart" aria-hidden="true"></i>
                          </a>
                          <a
                            href="#"
                            onClick={() => getSelectedProduct(product)}
                            data-toggle="modal"
                            data-target="#quick-view"
                            title="Quick View"
                          >
                            <i className="fa fa-search" aria-hidden="true"></i>
                          </a>
                        </div>
                      </div>
                      <div className="product-detail">
                        <div className="rating">
                          <i className="fa fa-star"></i>{" "}
                          <i className="fa fa-star"></i>{" "}
                          <i className="fa fa-star"></i>{" "}
                          <i className="fa fa-star"></i>{" "}
                          <i className="fa fa-star"></i>
                        </div>
                        <a href={null}>
                          <h6>{product.title}</h6>
                        </a>
                        <h4>
                          {symbol}
                          {product.price}
                        </h4>
                        <ul className="color-variant">
                          <li className="bg-light0"></li>
                          <li className="bg-light1"></li>
                          <li className="bg-light2"></li>
                        </ul>
                      </div>
                    </div>
                  </Col>
                ))}
            </>
          )}
        </Row>
        {selectedProduct ? (
          <Modal
            isOpen={modal}
            toggle={toggle}
            className="modal-lg quickview-modal"
            centered
          >
            <ModalBody>
              <Row>
                <Col lg="6" xs="12">
                  <div className="quick-view-img">
                    <Media
                      src={`${process.env.IMAGE_SERVER_URL + selectedProduct.images[0].src}`}
                      alt=""
                      className="img-fluid"
                    />
                  </div>
                </Col>
                <Col lg="6" className="rtl-text">
                  <div className="product-right">
                    <h2> {selectedProduct.title} </h2>
                    <h3>
                      {currency.symbol}
                      {(selectedProduct.price * currency.value).toFixed(2)}
                    </h3>
                    {selectedProduct.variants ? (
                      <ul className="color-variant">
                        {uniqueTags ? (
                          <ul className="color-variant">
                            {selectedProduct.type === "jewellery" ||
                              selectedProduct.type === "nursery" ||
                              selectedProduct.type === "beauty" ||
                              selectedProduct.type === "electronics" ||
                              selectedProduct.type === "goggles" ||
                              selectedProduct.type === "watch" ||
                              selectedProduct.type === "pets" ? (
                              ""
                            ) : (
                              <>
                                {uniqueTags ? (
                                  <ul className="color-variant">
                                    {uniqueTags.map((vari, i) => {
                                      return (
                                        <li
                                          className={vari.color}
                                          key={i}
                                          title={vari.color}
                                          onClick={() =>
                                            variantChangeByColor(
                                              vari.image_id,
                                              selectedProduct.images
                                            )
                                          }
                                        ></li>
                                      );
                                    })}
                                  </ul>
                                ) : (
                                  ""
                                )}
                              </>
                            )}
                          </ul>
                        ) : (
                          ""
                        )}
                      </ul>
                    ) : (
                      ""
                    )}
                    <div className="border-product">
                      <h6 className="product-title">product details</h6>
                      <p>{selectedProduct.description}</p>
                    </div>
                    <div className="product-description border-product">
                      {selectedProduct.size ? (
                        <div className="size-box">
                          <ul>
                            {selectedProduct.size.map((size, i) => {
                              return (
                                <li key={i}>
                                  <a href={null}>{size}</a>
                                </li>
                              );
                            })}
                          </ul>
                        </div>
                      ) : (
                        ""
                      )}
                      <h6 className="product-title">quantity</h6>
                      <div className="qty-box">
                        <div className="input-group">
                          <span className="input-group-prepend">
                            <button
                              type="button"
                              className="btn quantity-left-minus"
                              onClick={minusQty}
                              data-type="minus"
                              data-field=""
                            >
                              <i className="fa fa-angle-left"></i>
                            </button>
                          </span>
                          <input
                            type="text"
                            name="quantity"
                            value={quantity}
                            onChange={changeQty}
                            className="form-control input-number"
                          />
                          <span className="input-group-prepend">
                            <button
                              type="button"
                              className="btn quantity-right-plus"
                              onClick={() => plusQty(selectedProduct)}
                              data-type="plus"
                              data-field=""
                            >
                              <i className="fa fa-angle-right"></i>
                            </button>
                          </span>
                        </div>
                      </div>
                    </div>
                    <div className="product-buttons">
                      <button
                        className="btn btn-solid"
                        onClick={() => addToCart(selectedProduct, quantity)}
                      >
                        add to cart
                      </button>
                      <button
                        className="btn btn-solid"
                        onClick={() => clickProductDetail(selectedProduct)}
                      >
                        View detail
                      </button>
                    </div>
                  </div>
                </Col>
              </Row>
            </ModalBody>
          </Modal>
        ) : (
          ""
        )}
      </Container>
    </section>
  );
};

export default ProductSection;
