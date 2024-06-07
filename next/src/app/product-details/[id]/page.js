'use client'

import CommonLayout from "../../../components/shop/common-layout";
import ProductSection from "../common/product_section";
import LeftImagePage from "../product/leftImagePage";

const LeftSidebar = ({ params  }) => {
  const id = params.id;
  console.log(id)

  return (
    <CommonLayout parent="Home" title="Product">
      <LeftImagePage pathId={id} />
      <ProductSection />
    </CommonLayout>
  );
};

export default LeftSidebar; 
