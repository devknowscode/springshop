"use client";

import React, { useState } from "react";
import { Col } from "reactstrap";
import { useRouter } from "next/router";
import { useAuth } from "@/helpers/auth/AuthContext";

const DashboardSidebar = () => {
  const [accountInfo, setAccountInfo] = useState(false);

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
              <a href="#">Account Info</a>
            </li>
            <li>
              <a href="#">Address Book</a>
            </li>
            <li>
              <a href="#">My Orders</a>
            </li>
            <li>
              <a href="#">My Wishlist</a>
            </li>
            <li>
              <a href="#">Newsletter</a>
            </li>
            <li>
              <a href="#">My Account</a>
            </li>
            <li>
              <a href="#">Change Password</a>
            </li>
            <li className="last">
              <a href="#">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </Col>
  );
};

export default DashboardSidebar;
