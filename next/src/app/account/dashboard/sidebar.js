"use client";

import React, { useState } from "react";
import { Col } from "reactstrap";
// import { useRouter } from "next/router";
import { useRouter } from "next/navigation";
import { useAuth } from "@/helpers/auth/AuthContext";
import axios from "axios";

const DashboardSidebar = () => {
  const [accountInfo, setAccountInfo] = useState(false);
  const router = useRouter();
  const { sessionToken, clearSessionToken } = useAuth();
  const Logout = async () => {
    try {
      const response = await axios.post('/api/auth/logout', {
        metadata: {
          token: sessionToken
        }
      });
      if (response.status === 200) {
        clearSessionToken();
        router.push("/");
      } else {
        console.error('Error logging out:', response.data.message);
      }
    } catch (error) {
      console.error('Error logging out:', error);
    }
  };

  return (
    <Col lg="3">
      {window.innerWidth <= 991 ? (
        <div
          className="account-sidebar"
          onClick={() => setAccountInfo(!accountInfo)}
        >
          <a className="popup-btn">my account</a>
        </div>
      ) : (
        ""
      )}
      <div
        className="dashboard-left"
        style={accountInfo ? { left: "0px" } : {}}
      >
        <div
          className="collection-mobile-back"
          onClick={() => setAccountInfo(!accountInfo)}
        >
          <span className="filter-back">
            <i className="fa fa-angle-left" aria-hidden="true"></i> back
          </span>
        </div>
        <div className="block-content">
          <ul>
            <li className="active">
              <a href="/account/dashboard">Thông tin tài khoản</a>
            </li>
            <li>
              <a href={`/account/cart`}>Giỏ hàng của tôi</a>
            </li>
            <li>
              <a href={`/account/wishlist`}>Sản phẩm yêu thích</a>
            </li>
            <li>
              <a href="#">Thay đổi mật khẩu</a>
            </li>
            <li className="last" onClick={Logout}>
              <a>Đăng xuất</a>
            </li>
          </ul>
        </div>
      </div>
    </Col>
  );
};

export default DashboardSidebar;
