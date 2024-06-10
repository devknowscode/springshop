"use client";
import React, { useState } from 'react';
import CommonLayout from '../../../components/shop/common-layout';
import DashboardSidebar from "./sidebar";
import { Container, Row, Col, Button } from 'reactstrap';
import './dashboard.css';

const Dashboard = () => {
    const initialData = {
        username: "TrungLQ",
        email: "20522070@gm.uit.edu.vn",
        fullname: "Le Quang Trung",
        address: "dai hoc UIT",
        phone: "012983812310",
    };

    const [data, setData] = useState(initialData);
    const [editData, setEditData] = useState(initialData);

    const handleChange = (e, key) => {
        setEditData({ ...editData, [key]: e.target.value });
    };

    const handleSave = () => {
        setData(editData);
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
                                                                {Object.entries(data).map(([key, value]) => (
                                                                    <tr key={key}>
                                                                        <td>{key}</td>
                                                                        <td>
                                                                            <input
                                                                                type="text"
                                                                                className="input-field"
                                                                                value={editData[key]}
                                                                                onChange={(e) => handleChange(e, key)}
                                                                            />
                                                                        </td>
                                                                    </tr>
                                                                ))}
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
