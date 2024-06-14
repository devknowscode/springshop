import React from "react";
import convertCurrencyFormat from "@/utils/currencyFormat";

const MasterProductDetail = ({
  product,
  productDetail,
  currency,
  detailClass,
  des,
}) => {
  let RatingStars = [];
  let rating = 5;
  for (var i = 0; i < rating; i++) {
    RatingStars.push(<i className="fa fa-star" key={i}></i>);
  }

  return (
    <div className={`product-detail ${productDetail} ${detailClass}`}>
      <div>
        <div className="rating">{RatingStars}</div>
        <h6>{product.title}</h6>
        {des ? <p>{product.description}</p> : ""}
        <h4>
          {product.sale ? (
            <>
              {(
                convertCurrencyFormat((product.price - (product.price * product.discount) / 100) * currency.value)
              )}
              <del>
                <span className="money">
                  {convertCurrencyFormat(product.price * currency.value)}
                </span>
              </del>
            </>
          ) : (
            <span className="money">
              {convertCurrencyFormat(product.price * currency.value)}
            </span>
          )}
        </h4>
      </div>
    </div>
  );
};

export default MasterProductDetail;
