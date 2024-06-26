import React from 'react';
import CommonLayout from '../../components/shop/common-layout';
import LeftImagePage from './product/leftImagePage';
// import { withApollo } from '../../helpers/apollo/apollo';
import ProductTab from './common/product-tab';
import ProductSection from './common/product_section';

const ThumbnailLeft = () => {
    return (
        <CommonLayout parent="Trang chủ" title="Sản phẩm">
            <LeftImagePage />
            <ProductTab />
            <ProductSection />
        </CommonLayout>
    )
}

export default ThumbnailLeft; 