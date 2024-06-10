"use client"

import React, { useState } from 'react';
import CommonLayout from '../../../components/shop/common-layout';
import { Input, Container, Row, Form, Label ,Col, Button, FormGroup } from 'reactstrap';
import axios from 'axios';
import { useRouter } from "next/navigation";
import { useAuth } from '@/helpers/auth/AuthContext';

const Register = () => {
    const {setSessionToken} = useAuth();
    const [formData, setFormData] = useState({
        fullname: '',
        email: '',
        password: '',
        retype_password: '',
        role_id: 2
    });
    const router = useRouter();
    const handleChange = (e) => {
        setFormData({
            ...formData,
            [e.target.id]: e.target.value
        });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post(
                'http://localhost:8088/v1/api/auth/signup', 
                formData
            );
            const result = await axios.post("/api/auth", response.data);
            setSessionToken(result.data.res.metadata.token)
            router.push("/");
        } catch (error) {
            console.error('There was an error registering:', error);
        }
    };
    
    return (
        <CommonLayout parent="home" title="register">
            <section className="register-page section-b-space">
                <Container>
                    <Row>
                        <Col lg="12">
                            <h3>Tạo tài khoản</h3>
                            <div className="theme-card">
                                <Form className="theme-form" onSubmit={handleSubmit}>
                                    <Row>
                                        <Col md="6">
                                            <FormGroup>
                                                <Label className="form-label" for="fullname">Full Name</Label>
                                                <Input type="text" className="form-control" id="fullname" placeholder="Full Name"
                                                    required=""
                                                    onChange={handleChange}
                                                    />
                                            </FormGroup>
                                        </Col>
                                        <Col md="6">
                                            <FormGroup>
                                                <Label className="form-label" for="email">email</Label>
                                                <Input type="email" className="form-control" id="email" placeholder="Email" required=""
                                                    onChange={handleChange} />
                                            </FormGroup>
                                        </Col>
                                    </Row>
                                    <Row>
                                        <Col md="6">
                                            <FormGroup>
                                                <Label className="form-label" for="password">Mật khẩu</Label>
                                                <Input type="password" className="form-control" id="password"
                                                    placeholder="Enter your password" required=""
                                                    onChange={handleChange} />
                                            </FormGroup>
                                        </Col>
                                        <Col md="6">
                                            <FormGroup>
                                                <Label className="form-label" for="retype_password">Nhập lại mật khẩu</Label>
                                                <Input type="password" className="form-control" id="retype_password" placeholder="Retype Password"
                                                    required=""
                                                    onChange={handleChange} />
                                            </FormGroup>
                                        </Col>
                                        <Col md="12">
                                            <Button className="btn btn-solid w-auto">Tạo tài khoản</Button>
                                        </Col>
                                    </Row>
                                </Form>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </section>
        </CommonLayout>
    )
}

export default Register