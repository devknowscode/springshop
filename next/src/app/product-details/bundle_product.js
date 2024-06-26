import React from "react";
import CommonLayout from "../../components/shop/common-layout";
import ProductSection from "./common/product_section";
// import { withApollo } from "../../helpers/apollo/apollo";
import BundleProductPage from "./product/bundle_page.js";

const BundleProduct = () => {
  return (
    <CommonLayout parent="Trang chủ" title="Sản phẩm">
      <BundleProductPage />
      <ProductSection />
    </CommonLayout>
  );
};

export default BundleProduct;
