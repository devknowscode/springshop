"use client"

import React from 'react';
import CommonLayout from '../../../components/shop/common-layout';
import ProfilePage from '../common/profile-page';

const Profile = () => {
    return (
        <CommonLayout parent="Trang chủ" title="hồ sơ">
            <ProfilePage />
        </CommonLayout>
    )
}

export default Profile;