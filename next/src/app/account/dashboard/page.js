"use client";
import React, { useEffect, useState } from "react";
import CommonLayout from "../../../components/shop/common-layout";
import DashboardSidebar from "./sidebar";
import { Container, Row, Col, Button } from "reactstrap";
import "./dashboard.css";
import { useAuth } from "@/helpers/auth/AuthContext";
import axios from "axios";

const Dashboard = () => {
  const { sessionToken } = useAuth();
  console.log("sessionToken::", sessionToken);

  const [formData, setFormData] = useState({});

  useEffect(() => {
    // {
    //   username: "TrungLQ",
    //   email: "20522070@gm.uit.edu.vn",
    //   fullname: "Le Quang Trung",
    //   address: "dai hoc UIT",
    //   phone: "012983812310",
    // }
    axios
      .get("http://localhost:8088/v1/api/users", {
        headers: {
          Authorization: `Bearer ${sessionToken}`,
        },
      })
      .then(({ data }) => {
        setFormData(data.metadata);
      });
  }, []);

  const handleChange = (e, key) => {
    setFormData({
      ...formData,
      [key]: e.target.value,
    });
  };

  const handleSave = () => {
    alert("Lưu thành công!");
    console.log("data::", formData);

    axios
      .put("http://localhost:8088/v1/api/users", 
        formData, {
        headers: {
          Authorization: `Bearer ${sessionToken}`,
        },
      })
      .then(({data }) => {
        setFormData(data.metadata);
      });
  };

  return (
    <CommonLayout parent="home" title="dashboard">
      <section className="section-b-space">
        <Container>
          <Row>
            <DashboardSidebar />
            <Col lg="9">
              <div className="dashboard-right">
                <div className="dashboard">
                  <div className="box-account box-info">
                    <div className="box-head">
                      <h2>Thông tin tài khoản</h2>
                    </div>
                    <br />
                    <Row>
                      <Col sm="12">
                        <div className="box">
                          <div className="box-content">
                            <table className="table-container">
                              <tbody>
                                {Object.entries(formData).map(
                                  ([key, value]) => (
                                    <tr key={key}>
                                      <td>{key}</td>
                                      <td>
                                        <input
                                          type="text"
                                          className="input-field"
                                          value={value}
                                          onChange={(e) => handleChange(e, key)}
                                        />
                                      </td>
                                    </tr>
                                  )
                                )}
                              </tbody>
                            </table>
                            <div className="save-button-container">
                              <Button
                                className="save-button"
                                onClick={handleSave}
                              >
                                Save
                              </Button>
                            </div>
                          </div>
                        </div>
                      </Col>
                    </Row>
                  </div>
                </div>
              </div>
            </Col>
          </Row>
        </Container>
      </section>
    </CommonLayout>
  );
};

export default Dashboard;
