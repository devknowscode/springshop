"use client";

import React, { useState } from "react";
import CommonLayout from "../../../components/shop/common-layout";
import {
  Container,
  Row,
  Form,
  Label,
  Input,
  Col,
  FormGroup,
  Button,
} from "reactstrap";
import axios from "axios";
import { useAuth } from "@/helpers/auth/AuthContext";
import { useRouter } from "next/navigation";

const Login = () => {
  const {setSessionToken} = useAuth();
  const router = useRouter();
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.id]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    // TODO: request to server
    try {
      const response = await axios.post(
        "http://localhost:8088/v1/api/auth/login",
        formData
      );
      const result = await axios.post("/api/auth", response.data);
      setSessionToken(result.data.res.metadata.token)
      router.push("/");
    } catch (error) {
      console.error("There was an error login:", error);
    }
  };


  return (
    <CommonLayout parent="home" title="login">
      <section className="login-page section-b-space">
        <Container>
          <Row>
            <Col lg="6">
              <h3>Login</h3>
              <div className="theme-card">
                <Form className="theme-form" onSubmit={handleSubmit}>
                  <div className="form-group">
                    <FormGroup>
                      <Label className="form-label" for="email">
                        Email
                      </Label>
                      <Input
                        type="email"
                        className="form-control"
                        id="email"
                        placeholder="Email"
                        required=""
                        onChange={handleChange}
                      />
                    </FormGroup>
                  </div>
                  <div className="form-group">
                    <FormGroup>
                      <Label className="form-label" for="review">
                        Password
                      </Label>
                      <Input
                        type="password"
                        className="form-control"
                        id="password"
                        placeholder="Enter your password"
                        required=""
                        onChange={handleChange}
                      />
                    </FormGroup>
                  </div>
                  <Button className="btn btn-solid">Login</Button>
                </Form>
              </div>
            </Col>
            <Col lg="6" className="right-login">
              <h3>New Customer</h3>
              <div className="theme-card authentication-right">
                <h6 className="title-font">Create A Account</h6>
                <p>
                  Sign up for a free account at our store. Registration is quick
                  and easy. It allows you to be able to order from our shop. To
                  start shopping click register.
                </p>
                <a href="/page/account/register" className="btn btn-solid">
                  Create an Account
                </a>
              </div>
            </Col>
          </Row>
        </Container>
      </section>
    </CommonLayout>
  );
};

export default Login;
