"use client"

import React from 'react';
import CommonLayout from '../../../components/shop/common-layout';
import ProfilePage from '../common/profile-page';
import { useAuth } from '@/helpers/auth/AuthContext';

const Profile = () => {
    return (
        <CommonLayout parent="home" title="profile">
            <ProfilePage />
        </CommonLayout>
    )
}

export default Profile;