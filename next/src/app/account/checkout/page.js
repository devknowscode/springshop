"use client"

import React, { useEffect, useState } from 'react';
import CommonLayout from '../../../components/shop/common-layout';
import CheckoutPage from '../common/checkout-page';
import Login from '../../account/login/page'

const Checkout = () => {
    const [currentUser, setCurrentUser] = useState(localStorage.getItem('user'));
    useEffect(() => {
        setCurrentUser(localStorage.getItem('user'))
    }, [localStorage.getItem('user')])
    return (
        <>
            {currentUser !== null ?
                <CommonLayout parent="Trang chủ" title="Thanh toán">
                    <CheckoutPage />
                </CommonLayout>
                :
                <Login />
            }
        </>
    )
}

export default Checkout;