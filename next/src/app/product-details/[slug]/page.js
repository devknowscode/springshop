'use client'

import CommonLayout from "../../../components/shop/common-layout";
import ProductSection from "../common/product_section";
import LeftImagePage from "../product/leftImagePage";

const LeftSidebar = ({ params  }) => {
  const {slug} = params;

  return (
    <CommonLayout parent="Trang chủ" title="Sản phẩm">
      <LeftImagePage slug={slug} />
      {/* <ProductSection /> */}
    </CommonLayout>
  );
};

export default LeftSidebar; 
