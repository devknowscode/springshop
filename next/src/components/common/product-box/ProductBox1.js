import React, { useContext, useState } from "react";
import { useRouter } from "next/navigation";
import { Row, Col, Media, Modal, ModalBody, ModalHeader } from "reactstrap";
import CartContext from "../../../helpers/cart";
import { CurrencyContext } from "../../../helpers/Currency/CurrencyContext";
import MasterProductDetail from "./MasterProductDetail";
import convertCurrencyFormat from "@/utils/currencyFormat";

const ProductItem = ({
  product,
  des,
  addWishlist,
  cartClass,
  productDetail,
  title,
}) => {
  // eslint-disable-next-line
  const router = useRouter();
  const cartContext = useContext(CartContext);
  const curContext = useContext(CurrencyContext);
  const currency = curContext.state;
  const setQuantity = cartContext.setQuantity;

  const [image, setImage] = useState("");
  const [modal, setModal] = useState(false);
  const toggle = () => setModal(!modal);
  const uniqueTags = [];

  const changeQty = (e) => {
    setQuantity(parseInt(e.target.value));
  };

  const clickProductDetail = () => {
    router.push(`/product-details/${product.slug}`);
  };

  const variantChangeByColor = (imgId, product_images) => {
    product_images.map((data) => {
      if (data.image_id == imgId) {
        setImage(data.src);
      }
    });
  };

  return (
    <div className="product-box product-wrap">
      <div className="img-wrapper">
        <div className="lable-block">
          {product.sale === true ? <span className="lable4">on sale</span> : ""}
        </div>
        <div className="front" onClick={clickProductDetail}>
          <Media
            src={`${
              image
                ? image
                : process.env.IMAGE_SERVER_URL + product.images[0].src
            }`}
            className="img-fluid"
            alt=""
          />
        </div>
        <div className={cartClass}>
          <a href={null} title="Add to Wishlist" onClick={addWishlist}>
            <i className="fa fa-heart" aria-hidden="true"></i>
          </a>
          <a href={null} title="Quick View" onClick={toggle}>
            <i className="fa fa-search" aria-hidden="true"></i>
          </a>
        </div>
      </div>
      <MasterProductDetail
        product={product}
        productDetail={productDetail}
        currency={currency}
        uniqueTags={uniqueTags}
        title={title}
        des={des}
        variantChangeByColor={variantChangeByColor}
      />
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
                  src={`${
                    product.variants && image
                      ? image
                      : process.env.IMAGE_SERVER_URL + product.images[0].src
                  }`}
                  alt=""
                  className="img-fluid"
                />
              </div>
            </Col>
            <Col lg="6" className="rtl-text">
              <div className="product-right">
                <button
                  type="button"
                  data-dismiss="modal"
                  className="btn-close btn btn-secondary"
                  aria-label="Close"
                  onClick={toggle}
                ></button>
                <h2>{product.title}</h2>
                <h3>
                  {convertCurrencyFormat(product.price * currency.value)}
                </h3>
                <div className="border-product">
                  <h6 className="product-title">product details</h6>
                  <p>{product.description}</p>
                </div>
                <button
                  className="btn btn-solid"
                  onClick={clickProductDetail}
                >
                  View detail
                </button>
              </div>
            </Col>
          </Row>
        </ModalBody>
      </Modal>
    </div>
  );
};

export default ProductItem;
