'use client'

import CommonLayout from "../../../components/shop/common-layout";
import ProductSection from "../common/product_section";
import LeftImagePage from "../product/leftImagePage";

const LeftSidebar = ({ params  }) => {
  const {slug} = params;
  console.log({slug})

  return (
    <CommonLayout parent="Home" title="Product">
      <LeftImagePage slug={slug} />
      <ProductSection />
    </CommonLayout>
  );
};

export default LeftSidebar; 
