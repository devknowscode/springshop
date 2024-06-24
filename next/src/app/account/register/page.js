"use client";

import React, { useState } from "react";
import CommonLayout from "../../../components/shop/common-layout";
import {
  Input,
  Container,
  Row,
  Form,
  Label,
  Col,
  Button,
  FormGroup,
} from "reactstrap";
import axios from "axios";
import { useRouter } from "next/navigation";
import { useAuth } from "@/helpers/auth/AuthContext";

const Register = () => {
  const { setSessionToken } = useAuth();
  const [formData, setFormData] = useState({
    fullname: "",
    email: "",
    password: "",
    retype_password: "",
    role_id: 2,
  });
  const [passwordError, setPasswordError] = useState("");
  const [emailError, setEmailError] = useState("");
  const [serverError, setServerError] = useState("");
  const router = useRouter();

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.id]: e.target.value,
    });
  };

  const CheckPassword = (password) => {
    const minLength = 8;
    const hasUpperCase = /[A-Z]/.test(password);
    const hasLowerCase = /[a-z]/.test(password);
    const hasNumber = /[0-9]/.test(password);
    const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

    if (
      password.length < minLength ||
      !hasUpperCase ||
      !hasLowerCase ||
      !hasNumber ||
      !hasSpecialChar
    ) {
      return "Mật khẩu phải có ít nhất 8 ký tự, bao gồm: in thường, in hoa, số, ký tự đặc biệt";
    }
    return "";
  };

  const CheckEmail = (email) => {
    const emailPattern = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
    if (!emailPattern.test(email)) {
      return "Email phải đúng định dạng @gmail.com";
    }
    return "";
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const emailValidationMessage = CheckEmail(formData.email);
    if (emailValidationMessage) {
      setEmailError(emailValidationMessage);
      return;
    }
    setEmailError("");

    const passwordValidationMessage = CheckPassword(formData.password);
    if (passwordValidationMessage) {
      setPasswordError(passwordValidationMessage);
      return;
    }
    setPasswordError("");

    try {
      const response = await axios.post(
        "http://localhost:8088/v1/api/auth/signup",
        formData
      );
      const result = await axios.post("/api/auth", response.data);
      setSessionToken(result.data.res.metadata.token);
      router.push("/");
    } catch (error) {
      if (error.response && error.response.data) {
        setServerError(error.response.data.message || "Đã có lỗi xảy ra.");
      } else {
        setServerError("Đã có lỗi xảy ra khi đăng ký.");
      }
      console.error("There was an error registering:", error);
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
                        <Label className="form-label" for="fullname">
                          Họ và tên
                        </Label>
                        <Input
                          type="text"
                          className="form-control"
                          id="fullname"
                          placeholder="Họ và tên"
                          required=""
                          onChange={handleChange}
                        />
                      </FormGroup>
                    </Col>
                    <Col md="6">
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
                        {emailError && (
                          <p style={{ color: "red" }}>{emailError}</p>
                        )}
                      </FormGroup>
                    </Col>
                  </Row>
                  <Row>
                    <Col md="6">
                      <FormGroup>
                        <Label className="form-label" for="password">
                          Mật khẩu
                        </Label>
                        <Input
                          type="password"
                          className="form-control"
                          id="password"
                          placeholder="Nhập mật khẩu"
                          required=""
                          onChange={handleChange}
                        />
                        {passwordError && (
                          <p style={{ color: "red" }}>{passwordError}</p>
                        )}
                      </FormGroup>
                    </Col>
                    <Col md="6">
                      <FormGroup>
                        <Label className="form-label" for="retype_password">
                          Nhập lại mật khẩu
                        </Label>
                        <Input
                          type="password"
                          className="form-control"
                          id="retype_password"
                          placeholder="Nhập lại mật khẩu"
                          required=""
                          onChange={handleChange}
                        />
                      </FormGroup>
                    </Col>
                    <Col md="12">
                      {serverError && (
                        <p style={{ color: "red" }}>{serverError}</p>
                      )}
                      <Button className="btn btn-solid w-auto">
                        Tạo tài khoản
                      </Button>
                    </Col>
                  </Row>
                </Form>
              </div>
            </Col>
          </Row>
        </Container>
      </section>
    </CommonLayout>
  );
};

export default Register;
