"use client"

import React from 'react';
import CommonLayout from '@/components/shop/common-layout';
import CartPage from '../common/cart-page';


const Wishliat = () => {
    return (
        <CommonLayout parent="Trang chủ" title="Giỏ hàng">
            <CartPage />
        </CommonLayout>
    )
}

export default Wishliat;