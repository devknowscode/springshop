import React, { useState, useContext } from "react";
import Link from "next/link";
import sizeChart from "/public/assets/images/size-chart.jpg";
import { Input } from "reactstrap";
import { CurrencyContext } from "@/helpers/Currency/CurrencyContext";
import CartContext from "@/helpers/cart";
import CountdownComponent from "@/components/common/widgets/countdownComponent";
import MasterSocial from "./master_social";

const DetailsWithPrice = ({ item, stickyClass, changeColorVar }) => {
  const CurContect = useContext(CurrencyContext);
  const symbol = CurContect.state.symbol;
  const product = item;
  const context = useContext(CartContext);
  const stock = context.stock;
  const plusQty = context.plusQty;
  const minusQty = context.minusQty;
  const quantity = context.quantity;
  const setQuantity = context.setQuantity;
  const [variantSelected, setVariantSelected] = useState({});
  const [attributesSelected, setAttributesSelected] = useState({});

  const changeQty = (e) => {
    setQuantity(parseInt(e.target.value));
  };

  let data = [];
  product.variants?.forEach((vari) => {
    const attributes = vari.attributes;
    data.push(attributes);
  });
  const result = {};

  // Iterate over each object in the data array
  data.forEach((item) => {
    Object.keys(item).forEach((key) => {
      // Initialize the key in result if it doesn't exist
      if (!result[key]) {
        result[key] = new Set();
      }
      // Add the value to the set
      result[key].add(item[key]);
    });
  });

  // Convert sets to arrays
  Object.keys(result).forEach((key) => {
    result[key] = Array.from(result[key]);
  });

  const handleSelectVariant = ({ key, value }) => {
    setAttributesSelected({
      ...attributesSelected,
      [key]: value,
    });
    Object.entries(attributesSelected).forEach(attr => {
      console.log(attr)
    })
  };

  return (
    <>
      <div className={`product-right ${stickyClass}`}>
        <h2> {product.title} </h2>
        {product.sale ? (
          <>
            <h4>
              <del>
                {symbol}
                {product.price}
              </del>
              <span>{product.discount}% off</span>
            </h4>
            <h3>
              {symbol}
              {product.price - (product.price * product.discount) / 100}
            </h3>
          </>
        ) : (
          <h3>
            {symbol}
            {product.price - (product.price * product.discount) / 100}
          </h3>
        )}
        <div className="product-variant">
          <div className="flex flex-column">
            {Object.entries(result).map(([key, values]) => (
              <section className="flex items-center">
                <h3 className="variant-title">{key}</h3>
                <div className="flex items-center">
                  {values.map((value) => (
                    <button
                      className={
                        (attributesSelected.hasOwnProperty(key) && attributesSelected[key] === value) 
                        ? "selection-box-selected"
                        : "selection-box-unselected"
                      }
                      aria-label="Mini 4/5"
                      aria-disabled="false"
                      onClick={() => {
                        handleSelectVariant({ key, value });
                      }}
                    >
                      {value}
                    </button>
                  ))}
                </div>
              </section>
            ))}
          </div>
        </div>

        <div className="product-description border-product">
          <span className="instock-cls">{stock}</span>
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
              <Input
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
                  onClick={() => plusQty(product)}
                  data-type="plus"
                  data-field=""
                >
                  <i className="fa fa-angle-right"></i>
                </button>
              </span>
            </div>
            <div className="pleft">17 products available</div>
          </div>
        </div>
        <div className="product-buttons">
          <a
            href={null}
            className="btn btn-solid"
            onClick={() => context.addToCart(product, quantity)}
          >
            add to cart
          </a>
          <Link
            href={`/account/checkout`}
            className="btn btn-solid"
            onClick={() => context.addToCart(product, quantity)}
          >
            buy now
          </Link>
        </div>
        <div className="border-product">
          <h6 className="product-title">product details</h6>
          <p>{product.description}</p>
        </div>
        <div className="border-product">
          <h6 className="product-title">share it</h6>
          <div className="product-icon">
            <MasterSocial />
          </div>
        </div>
        <div className="border-product">
          <h6 className="product-title">Time Reminder</h6>
          <CountdownComponent />
        </div>
      </div>
    </>
  );
};

export default DetailsWithPrice;
